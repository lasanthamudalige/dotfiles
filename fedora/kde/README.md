# Fedora KDE setup

## Table of contents

* [Using dotfiles](#using-dotfiles)
* [Other stuff](#other-stuff)

## Using dotfiles

* ***Install firefox, vim and git if not installed***

    ```bash
    sudo dnf install firefox vim git -y
    ```
  
1. Clone the repo

    ```bash
    git clone https://github.com/lasanthamudalige/dotfiles
    ```

2. Move config files

    * Move config folders to "~/.config" folder.

<!--- 3. Customizing setup

   ```bash
  sudo dnf install jetbrains-mono-fonts-all.noarch -y 
  ``` -->
  
<!--* Refresh fonts using

    ```bash
    fc-cache -fv
    ```-->

3. Install basic set of applications

    ```bash
    sudo dnf install zsh jetbrains-mono-fonts-all.noarch thunderbird vlc ktorrent okular kclock gimp obs-studio npm nodejs htop btop gnome-disk-utility chromium -y
    ```

    * Download RPM packages from:
        [OnlyOffice](https://github.com/VSCodium/vscodium/releases)
        [Zoom](https://www.onlyoffice.com/download-desktop)
        [VSCodium](https://zoom.us/download?os=linux)
        [Intellij IDEA](https://www.jetbrains.com/help/idea/installation-guide.html#standalone_linux)

    * Install AppImages:
      [Obsidian](https://obsidian.md/download)

        * Install [Gear Lever](https://flathub.org/apps/it.mijorus.gearlever)

          ```bash
          flatpak install it.mijorus.gearlever
          ```

    * Remove preinstalled apps
      
      ```bash
      sudo dnf remove kmail kdeconnectd kamoso dragon qrca kmines kpat kmahjongg kaddressbook korganizer neochat krfb krdc kolourpaint akregator
      ```

    * Refresh fonts using
  
      ```bash
      fc-cache -fv
      ```

## Other stuff

### Zsh shell

* Install zsh shell

  ```bash
  sudo dnf install zsh -y
  ```

    * List available shells

      ```bash
      chsh -l
      ```

    * Change default shell to zsh

      ```bash
      chsh -s /usr/bin/zsh # And log back in
      ```

* Install [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)

  ```bash
  wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  sh install.sh
  ```

  * add zsh-autosuggestions
  
    1. Clone [this](https://github.com/zsh-users/zsh-autosuggestions) repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)
  
        ```bash
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        ```
  
    2. Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc)
  
        ```bash
        plugins=( 
        # other plugins...
        zsh-autosuggestions
        )
        ```
  
    3. Start a new terminal session.
  
  * add zsh-syntax-highlighting (optional)
  
    1. Clone [this](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
  
        ```bash
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        ```
  
    2. Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc)
  
        ```bash
        plugins=( 
        # other plugins...
        zsh-syntax-highlighting 
        )
        ```

### Setting programming stuff
  
* Generate ssh key for github

  ```bash
  # Generate a new ssh key
  ssh-keygen -t ed25519 -C "lasantha1130@gmail.com" # Add your email here by replacing "lasantha1130@gmail.com"

  # Add ssh key to ssh-agent
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519

  # Print ssh public key to clipboard
  cat ~/.ssh/id_ed25519.pub
  ```

* Install nvm(Node version manager)

  ```bash
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  ```

  * Install nodemon and json-server for nodejs
  
    ```bash
    npm install -g nodemon json-server
    ```

* Install Miniconda

  ```bash
  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  zsh ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -rf ~/miniconda3/miniconda.sh
  ~/miniconda3/bin/conda init zsh
  ```
  
  * Disable base automatic base activation

    ```bash
    conda config --set auto_activate_base false
    ```
  
* Optional

  ```bash
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  ~/miniconda3/bin/conda init bash
  ```

* **Make sure to install nodejs and npm as a system package for neovim and emacs**

### Neovim stuff

* Copy neovim config file to $HOME/.config/

    * Install lua

        ```bash
        sudo dnf install lua -y
        ```

    * **Make sure to install nodejs using NVM before trying following commands**

    * Install tree-sitter CLI and markdown lint CLI

        ```bash
        npm install -g tree-sitter-cli markdownlint-cli
        ```

    * Install rust using this [link](https://rust-lang.org/tools/install/)

      * Install rust analyzer using rustup [more information](https://rust-analyzer.github.io/book/rust_analyzer_binary.html)

        ```bash
        rustup component add rust-analyzer
        ```

<!---### Emacs stuff

* Copy Emacs config file to $HOME/.config/

    * Install emacs

      ```bash
      sudo pacman -S emacs --needed
      ```

        * Install nerd-icons with following command M-x (alt-x) C-y to paste

          ```bash
          nerd-icons-install-fonts
          ```

        * Install python-lsp and clangd

            ```bash
            sudo pacman -S python-lsp-server clang --needed
            ```

        * Install rust using this [link](https://rust-lang.org/tools/install/)

          * Install rust analyzer using rustup [more information](https://rust-analyzer.github.io/book/rust_analyzer_binary.html)

            ```bash
            rustup component add rust-analyzer
            ```

### Setup Virt-Manager

* Install virt-manager + dependencies

    ```bash
    sudo pacman -S qemu virt-manager libvirt dnsmasq ebtables iptables-nft
    ```
* Enable libvirtd package

    ```bash
    sudo systemctl enable --now libvirtd
    ```

* Add current user to the libvirt group

    ```bash
    sudo usermod -aG libvirt $USER
    ```

* File -> new connection -> Hypervisor: QEMU/KVM -> Press connect

* Errors

  * To fix no network error set firewall_backend=iptables in /etc/libvirt/network.conf and restart

### Setup LocalSend

* **Run setup_ufw script**

* ~~Enable ufw firewall from cli~~

  * **Run setup_ufw script**

    * ~~Allow port 5331 in ufw for localsend~~

      ```bash
      sudo ufw allow 53317
      ```

    * ~~Show firewall status as numbered using:~~

      ```bash
      sudo ufw status numbered
      ```

    * ~~Remove the IPv6 rule~~

      ```bash
      sudo ufw delete NUM # 2,3
      ```

### MongoDB

* Install MongoDB (**check the wiki**)

   ```bash
   yay -S mongodb-bin
   ```

  * To run mongodb services

    ```bash
    sudo systemctl start mongodb

    sudo systemctl status mongodb
    ```

  * To enable mongodb

    ```bash
    sudo systemctl enable mongodb
    ```

  * To test connection status

    ```bash
    mongod --version
    ``` -->
