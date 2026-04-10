# **no_std_components**

[![Sponsors](https://img.shields.io/github/sponsors/QuackHack-McBlindy?logo=githubsponsors&label=Sponsor&style=flat&labelColor=ff1493&logoColor=fff&color=rgba(234,74,170,0.5) "")](https://github.com/sponsors/QuackHack-McBlindy) [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Sponsor?style=flat&logo=buymeacoffee&logoColor=fff&labelColor=ff1493&color=ff1493)](https://buymeacoffee.com/quackhackmcblindy)


# **🦆 Bare Metal Collection**

most components are crates used with `esp-hal` to build microcontroller firmwares.   

<!-- TABLE_START -->

| Component | Description |
|-----------|-------------|
| aht20-rs | No description |
| barely-fuzzy | Fuzzy matching designed for bare metal no_std environments. Based on Levenshtein distance with heap allocation by feature, no alloc by default. |
| es7210-rs | No description |
| es8311-rs | No description |
| esp-adf-rs | No description |
| MS58-3909S68U4-rs | No description |
| tinyapi | No description |

<!-- TABLE_END -->



## **example usage**
  
add any **component** as a dependency in `Cargo.toml`.  

**Example:**  

```toml
[dependencies]
tinyapi = "0.1.2"
```

if component is not on `crates.io` yet:  

```toml
[dependencies]
tinyapi = { git = "https://github.com/Quackhack-McBlindy/no_std_components", rev = "463de74dcc294769de89d14200594a4d4d2ea75f", features = ["defmt", "esp32s3", "unstable"] }
```


## **Development**

The development enviorment is contained within a `Dockerfile`.    

```bash
git clone --recursive https://github.com/QuackHack-McBlindy/no_std_components.git
cd no_std_components
docker compose build dev
docker compose up dev
```


<br><br>

## **☕**

[![Sponsors](https://img.shields.io/github/sponsors/QuackHack-McBlindy?logo=githubsponsors&label=Sponsor&style=flat&labelColor=ff1493&logoColor=fff&color=rgba(234,74,170,0.5) "")](https://github.com/sponsors/QuackHack-McBlindy) [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Sponsor?style=flat&logo=buymeacoffee&logoColor=fff&labelColor=ff1493&color=ff1493)](https://buymeacoffee.com/quackhackmcblindy)
> Like my work?   
> Buy me a coffee, or become a sponsor.  
> Thanks for supporting open source!    

♥️₿ *Wallet:* `pungkula.x`  
<a href="https://www.buymeacoffee.com/quackhackmcblindy" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>


