# 蓝色大肥鱼 🐳

适用于 Codex 桌面版的自定义动画桌宠，当前提供小跳版，使用 v2 动画图集。

## 动画预览

| 待机 | 走路 |
| :---: | :---: |
| ![蓝色大肥鱼待机动画](docs/images/idle.gif) | ![蓝色大肥鱼走路动画](docs/images/walking-right.gif) |

## 一条命令安装（macOS / Linux）

需要 `curl` 和 `unzip`。复制下面整行到终端执行：

```sh
curl -fsSL https://raw.githubusercontent.com/mengmengjiang1999/blue-whale-pet/main/install.sh -o /tmp/blue-whale-pet-install.sh && sh /tmp/blue-whale-pet-install.sh
```

如果当前网络无法访问 `raw.githubusercontent.com`，使用备用入口（无需登录）：

```sh
curl -fsSL -H 'Accept: application/vnd.github.raw+json' 'https://api.github.com/repos/mengmengjiang1999/blue-whale-pet/contents/install.sh?ref=main' -o /tmp/blue-whale-pet-install.sh && sh /tmp/blue-whale-pet-install.sh
```

安装脚本下载 ZIP 时也会自动尝试 API 备用入口。GitHub API 存在访问频率限制。

默认安装到 `~/.codex/pets/blue-whale/`；设置了 `CODEX_HOME` 时使用 `$CODEX_HOME/pets/blue-whale/`。已有同名桌宠会先备份，安装程序会打印备份位置。

安装后在 Codex 的宠物设置中刷新，选择「蓝色大肥鱼」。若未出现，重启应用。需要支持自定义 v2 桌宠的版本；Linux 下的显示能力取决于使用的客户端。

## 只下载，不安装

[下载桌宠 ZIP](https://raw.githubusercontent.com/mengmengjiang1999/blue-whale-pet/main/blue-whale-pet.zip)

```sh
curl -fL https://raw.githubusercontent.com/mengmengjiang1999/blue-whale-pet/main/blue-whale-pet.zip -o blue-whale-pet.zip
```

Windows PowerShell：

```powershell
Invoke-WebRequest https://raw.githubusercontent.com/mengmengjiang1999/blue-whale-pet/main/blue-whale-pet.zip -OutFile blue-whale-pet.zip
$petRoot = if ($env:CODEX_HOME) { Join-Path $env:CODEX_HOME 'pets' } else { Join-Path $HOME '.codex/pets' }
# 如果已有 blue-whale 文件夹，请先改名备份，再执行解压。
Expand-Archive ./blue-whale-pet.zip -DestinationPath $petRoot
```

也可以手动解压，把整个 `blue-whale` 文件夹放进自己的 Codex `pets` 目录。

## 从仓库安装

```sh
git clone https://github.com/mengmengjiang1999/blue-whale-pet.git
cd blue-whale-pet
sh install.sh
```

克隆后安装使用仓库内的文件，无需再次下载。也可通过 `sh install.sh /指定路径/pets` 自定义安装位置。

## 文件

```text
blue-whale/
  pet.json           # 名称、版本及图集路径
  spritesheet.webp   # 动画图集
blue-whale-pet.zip   # 可直接下载的安装素材包
install.sh          # 安装脚本
```

## 关于作品

这是基于 DeepSeek 鲸鱼形象制作的非官方同人桌宠，与 DeepSeek 或 OpenAI 官方无关联。原角色、商标及参考素材的权利归其各自权利人所有。本仓库未授予这些第三方素材的商用许可。
