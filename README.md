<img width="135" height="135" align="left" style="float: left; margin: 0 10px 0 0; border-radius: 50%;" src="https://media.discordapp.net/attachments/905722570286960650/1145091498220716153/download.png?width=135&height=135">

## Tresthost Images

> A collection of Docker images used by Tresthost. These images are built and pushed to GHCR using GitHub Actions.

---

## 🚀 Build Status

| Image              | Status                                                                                                                                                          | Description                                            |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| `tresthost/base`   | [![build oses](https://github.com/tresthost/images/actions/workflows/base.yml/badge.svg)](https://github.com/tresthost/images/actions/workflows/base.yml)       | Ubuntu and Debian images, with pre-installed packages. |
| `tresthost/go`     | [![build go](https://github.com/tresthost/images/actions/workflows/go.yml/badge.svg)](https://github.com/tresthost/images/actions/workflows/go.yml)             | Go versions from `1.14` to `1.21`.                     |
| `tresthost/java`   | [![build java](https://github.com/tresthost/images/actions/workflows/java.yml/badge.svg)](https://github.com/tresthost/images/actions/workflows/java.yml)       | Java versions from `8` to `19`.                        |
| `tresthost/nodejs` | [![build nodejs](https://github.com/tresthost/images/actions/workflows/nodejs.yml/badge.svg)](https://github.com/tresthost/images/actions/workflows/nodejs.yml) | NodeJS versions from `12` to `20`.                     |
| `tresthost/python` | [![build python](https://github.com/tresthost/images/actions/workflows/python.yml/badge.svg)](https://github.com/tresthost/images/actions/workflows/python.yml) | Python versions from `3.7` to `3.11`.                  |

## 📝 Entrypoint Scripts

| Script                                 | Description                       |
| -------------------------------------- | --------------------------------- |
| `/packages/commands/server/startup.sh` | NodeJS Images installation script |
| `/oses/debian/entrypoint.sh`           | Debian Images entrypoint script   |
| `/oses/ubuntu/entrypoint.sh`           | Ubuntu Images entrypoint script   |
| `/nodejs/entrypoint.sh`                | NodeJS Images entrypoint script   |
| `/go/entrypoint.sh`                    | Go Images entrypoint script       |
| `/java/entrypoint.sh`                  | Java Images entrypoint script     |
| `/python/entrypoint.sh`                | Python Images entrypoint script   |

---

<p align="center">(originally forked from <a href="https://github.com/pterodactyl/yolks">pterodactyl/yolks</a>)</p>
