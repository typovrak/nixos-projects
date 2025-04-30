# 📁 NixOS Projects

> Declarative NixOS module that creates and secures a per-user ```~/projects``` directory automatically.

## 📦 Features

- 🔒 **Secure directory :** Creates ```~/projects``` with ```755``` permissions and correct user/group ownership.

- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild```, existing directory is preserved.

- ⚙️ **Zero-friction setup :** No extra configuration needed beyond import.
 
- 📦 **Lightweight :** Only standard NixOS primitives, no external dependencies.

- 💾 **Backup :** No backup needed for this module.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
No backup needed for this module.

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-projects = fetchGit {
    url = "https://github.com/typovrak/nixos-projects.git";
    ref = "main";
    rev = "6ca4a3e430f10bfcebf5d7b8805db83cfa8986fe"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-projects}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

After rebuild, your home directory will contain a projects folder
```bash
ls -ld ~/projects # drwxr-xr-x, owned by your user
```

Clone and develop your projects here !

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
