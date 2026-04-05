# **no_std_components**

[![Sponsors](https://img.shields.io/github/sponsors/QuackHack-McBlindy?logo=githubsponsors&label=Sponsor&style=flat&labelColor=ff1493&logoColor=fff&color=rgba(234,74,170,0.5) "")](https://github.com/sponsors/QuackHack-McBlindy) [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Sponsor?style=flat&logo=buymeacoffee&logoColor=fff&labelColor=ff1493&color=ff1493)](https://buymeacoffee.com/quackhackmcblindy)


# **⭐🦆 my collection of bare metal no_std components.**

most components are used with `esp-hal` to build microcontroller firmwares.   

## **example usage**

clone all components locally

```bash
git clone --recursive https://github.com/QuackHack-McBlindy/no_std_components.git
```

  
add **esp32-ota-web-server** as a dependency in `Cargo.toml`.

```toml
[dependencies]
esp32-ota-web-server = "0.1.x"
```

or if component is not on crates.io  

```toml
[dependencies]
esp32-ota-web-server = { git = "https://github.com/Quackhack-McBlindy/no_std_components", rev = "463de74dcc294769de89d14200594a4d4d2ea75f", features = ["defmt", "esp32s3", "unstable"] }
```



## **Development**

The development enviorment is contained within a `Dockerfile`.  

```bash
docker compose build dev
docker compose up dev
```


<br><br>

## 💡

> Like my work?   
> Buy me a coffee, or become a sponsor.  
> Thanks for supporting open source!    

<a href="https://www.buymeacoffee.com/quackhackmcblindy" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

[![Sponsors](https://img.shields.io/github/sponsors/QuackHack-McBlindy?logo=githubsponsors&label=Sponsor&style=flat&labelColor=ff1493&logoColor=fff&color=rgba(234,74,170,0.5) "")](https://github.com/sponsors/QuackHack-McBlindy) [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Sponsor?style=flat&logo=buymeacoffee&logoColor=fff&labelColor=ff1493&color=ff1493)](https://buymeacoffee.com/quackhackmcblindy)

