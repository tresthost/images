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

> [!NOTE]
> You can view all images available here: https://github.com/tresthost/images/pkgs/container/images

## 📝 Entrypoint Scripts

| Script                       | Description                     |
| ---------------------------- | ------------------------------- |
| `/oses/debian/entrypoint.sh` | Debian Images entrypoint script |
| `/oses/ubuntu/entrypoint.sh` | Ubuntu Images entrypoint script |
| `/nodejs/entrypoint.sh`      | NodeJS Images entrypoint script |
| `/go/entrypoint.sh`          | Go Images entrypoint script     |
| `/java/entrypoint.sh`        | Java Images entrypoint script   |
| `/python/entrypoint.sh`      | Python Images entrypoint script |

## ➡️ Image usage uris
| Image        | URI                                | Image        | URI                                |
| ------------ | ---------------------------------- | ------------ | ---------------------------------- |
| go_1.14ㅤㅤ      | `ghcr.io/tresthost/images:go_1.14`ㅤ ㅤ | nodejs_12    | `ghcr.io/tresthost/images:nodejs_12` |
| go_1.15 ㅤㅤ     | `ghcr.io/tresthost/images:go_1.15`ㅤ ㅤ | nodejs_14    | `ghcr.io/tresthost/images:nodejs_14` |
| go_1.16   ㅤㅤ   | `ghcr.io/tresthost/images:go_1.16`ㅤㅤ  | nodejs_15    | `ghcr.io/tresthost/images:nodejs_15` |
| go_1.17   ㅤㅤ   | `ghcr.io/tresthost/images:go_1.17`ㅤㅤ  | nodejs_16    | `ghcr.io/tresthost/images:nodejs_16` |
| go_1.18  ㅤㅤ    | `ghcr.io/tresthost/images:go_1.18`ㅤㅤ  | nodejs_17    | `ghcr.io/tresthost/images:nodejs_17` |
| go_1.19  ㅤㅤ    | `ghcr.io/tresthost/images:go_1.19`ㅤㅤ  | nodejs_18    | `ghcr.io/tresthost/images:nodejs_18` |
| go_1.20  ㅤㅤ    | `ghcr.io/tresthost/images:go_1.20`ㅤ ㅤ | nodejs_19    | `ghcr.io/tresthost/images:nodejs_19` |
| go_1.21  ㅤㅤ    | `ghcr.io/tresthost/images:go_1.21`ㅤ ㅤ | nodejs_20    | `ghcr.io/tresthost/images:nodejs_20` |

| Image        | URI                                | Image       | URI                                |
| ------------ | ---------------------------------- | ----------- | ---------------------------------- |
| python_3.7ㅤ   | `ghcr.io/tresthost/images:python_3.7` | java_8 ㅤ     | `ghcr.io/tresthost/images:java_8`ㅤ |
| python_3.8ㅤ   | `ghcr.io/tresthost/images:python_3.8` | java_11 ㅤ    | `ghcr.io/tresthost/images:java_11`ㅤ |
| python_3.9 ㅤ  | `ghcr.io/tresthost/images:python_3.9` | java_16 ㅤ    | `ghcr.io/tresthost/images:java_16`ㅤ |
| python_3.10ㅤ  | `ghcr.io/tresthost/images:python_3.10` | java_17 ㅤ    | `ghcr.io/tresthost/images:java_17`ㅤ |
| python_3.11 ㅤ | `ghcr.io/tresthost/images:python_3.11` | java_19  ㅤ   | `ghcr.io/tresthost/images:java_19`ㅤ |
---

<p align="center">(originally forked from <a href="https://github.com/pterodactyl/yolks">pterodactyl/yolks</a>)</p>
