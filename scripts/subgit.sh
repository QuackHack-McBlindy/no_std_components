#!/usr/bin/env bash

set -e  # exit on error

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "not inside a git repository."
    exit 1
fi

if [[ ! -f "README.md" ]]; then
    echo "README.md not found!"
    exit 1
fi


usage() {
    echo "Usage:"
    echo "  $0 add <git-url> [local-path]"
    echo "  $0 remove <local-path>"
    echo "  $0 update"
    exit 1
}


generate_table() {
    echo "| Component | Description |"
    echo "|-----------|-------------|"
    
    for dir in */; do
        component="${dir%/}"
        [[ "$component" == "dump" ]] && continue
        
        cargo_toml="${component}/Cargo.toml"
        description=""
        
        if [[ -f "$cargo_toml" ]]; then
            description=$(sed -n 's/^[[:space:]]*description[[:space:]]*=[[:space:]]*"\([^"]*\)".*$/\1/p' "$cargo_toml" | head -1)
        fi
        
        description="${description:-No description}"
        description="${description//|/\\|}"
        echo "| ${component} | ${description} |"
    done
}

cmd="$1"

case "$cmd" in
    add)
        if [ $# -lt 2 ]; then
            echo "Error: Git URL is required for add."
            usage
        fi
        git_url="$2"
        local_path="${3:-$(basename "$git_url" .git)}"
        if git submodule status | grep -q "$local_path"; then
            echo "$local_path is already a submodule."
            exit 1
        fi
        echo "Adding submodule $git_url as $local_path"
        git submodule add "$git_url" "$local_path"
        ;;
    remove)
        if [ $# -lt 2 ]; then
            echo "Error: Local path is required for remove."
            usage
        fi
        local_path="$2"
        echo "Removing submodule at $local_path"
        git submodule deinit -f "$local_path"
        git rm -f "$local_path"
        rm -rf ".git/modules/$local_path"
        echo "Submodule removed. Don't forget to commit the changes."
        ;;
    update)
        echo "⚠️  WARNING: This will reset every submodule to origin/main,"
        read -p "Continue? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Exited with no changes."
            exit 1
        fi

        git submodule foreach --recursive '
            echo "Updating $name..."
            git fetch origin
            default_branch=$(git remote show origin | grep "HEAD branch" | cut -d: -f2 | xargs)
            git checkout "$default_branch" 2>/dev/null || git checkout -b "$default_branch" "origin/$default_branch"
            git reset --hard "origin/$default_branch"
            git reset --hard origin/main
            echo "$name is now at $(git rev-parse --short HEAD)"
        '

        new_table=$(generate_table)
        
        if [[ ! -f "README.md" ]]; then
            echo "Error: README.md not found in current directory."
            exit 1
        fi
        if ! grep -q "<!-- TABLE_START -->" README.md; then
            echo "⚠️ TABLE_START/END markers not in README.md. No update performed."
            exit 1
        fi
        
        awk -v table="$new_table" '
        /<!-- TABLE_START -->/ {
            print
            print ""
            print table
            in_block = 1
            next
        }
        /<!-- TABLE_END -->/ {
            print ""
            print
            in_block = 0
            next
        }
        !in_block
        ' README.md > README.tmp && mv README.tmp README.md
        
        echo "README.md updated."
        git add .
        git commit -m "Updated submodules to latest origin/main" || echo "No changes to commit"
        ;;
    *)
        echo "Unknown command: $cmd"
        usage
        ;;
esac
