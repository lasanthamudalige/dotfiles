# Arch Kde setup

## Table of contents

* [Arch install summery](#arch-install-summery)
* [Using dotfiles](#using-dotfiles)
* [Other stuff](#other-stuff)

## Arch install summery

***I installed it using archinstall***

* Disk partition - ext4 with 1 partition with encryption
* profile - kde-plasma desktop with login with sddm
* Sound - Pipewire
* kernel - mainline or lts
* Additional packages - firefox git vim
* Network configuration - NetworkManager
* Other settings are stock settings

## Using dotfiles

* ***Install firefox, vim and git if not installed***
  
1. Clone the repo

    ```bash
    git clone https://github.com/lasanthamudalige/dotfiles
    ```

2. Do essential things
  
    * Setup bluetooth
    
      * Install bluetooth
    
          ```bash
          sudo pacman -S bluez bluez-utils
          ```
    
        * Enable and start bluetooth
    
          ```bash
          sudo systemctl enable bluetooth.service && sudo systemctl start bluetooth.service
          ```
    * Change charge threshold to 80%(optional)
  
        ```bash
        vim /sys/class/power_supply/BAT0/
        ```
  
    * Install tlp and enable it
    
      * Install tlp
  
       ```bash
       sudo pacman -S tlp tlp-rdw
       ```
  
      * Enable and start tlp
  
       ```bash
       sudo systemctl enable tlp.service && sudo tlp starte
       ```
  
      * Copy the file '00-template.conf' in tlp folder to /etc/tlp.d/
  
    * Install yay aur helper
  
      ```bash
      sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
      ```
    
    * Change pacman configuration
      
      * Open the config file
    
          ```bash
          sudo vim /etc/pacman.conf
          ```
    
        * ***Uncomment "#Color" to change the black and white terminal to a colorful one.***
        * ***Add "ILoveCandy" below it to change default install progress bar.***
    
        * ***Save the file.***  
    
      * ~~Show password feedback in terminal (in asterisks)~~
    
        * Add this line to /etc/sudoers
    
            ```bash
            Defaults        env_reset
            Defaults        pwfeedback
            ```
    
      * ~~Activate the paccache timer to clean package cache~~
    
          ```bash
          sudo systemctl enable paccache.timer
          ```
    
      * ~~Run xdg-user-dirs to create directories~~
    
          ```bash
          xdg-user-dirs-update
          ```
    
      * Setup firewall
    
        * Install UFW
    
             ```bash
             sudo pacman -S ufw
             ```
        * Run setup_ufw script
    
        * ~~Enable UFW~~
    
             ```bash
            sudo ufw enable
            ```
    
        * ~~To check status~~
    
            ```bash
            sudo ufw status verbose
            ```
    
        * ~~To auto start with the system~~
    
            ```bash
            sudo systemctl enable ufw.service
            ```

3. Move config files

* Move config folders to "~/.config" folder.
  
4. Customizing setup

  <!--- ```bash
  sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code
  ``` -->
  
* Refresh fonts using

    ```bash
    fc-cache -fv
    ```

5. Install basic set of applications

   ```bash
   sudo pacman -S ufw bash-completion wl-clipboard wl-clip-persist speech-dispatcher fwupd dosfstools ntfs-3g exfat-utils arj lrzip lzop unarchiver p7zip zip unzip unrar zsh zsh-completions python sqlite vim neovim flatpak ttf-jetbrains-mono-nerd ttf-firacode-nerd noto-fonts-emoji noto-fonts-cjk timeshift vlc vlc-plugin-ass vlc-plugin-freetype vlc-plugin-matroska audacious thunderbird kdegraphics-thumbnailers ffmpegthumbs gwenview kamoso kimageformats qt6-imageformats kcalc ktorrent meld okular ebook-tools kdegraphics-mobipocket spectacle kcron kclock libreoffice-fresh gimp inkscape python-tinycss2 obsidian obs-studio libfdk-aac libva-mesa-driver luajit python sndio v4l2loopback-dkms v4l2loopback-utils solaar ripgrep fd cmake man-db man-pages kitty ranger atool elinks ffmpegthumbnailer highlight imagemagick libcaca lynx mediainfo odt2txt poppler python-chardet python-pillow transmission-cli ueberzug nodejs npm yakuake htop btop gnome-disk-utility partitionmanager chromium awesome-terminal-fonts ttf-font-awesome francis --needed 
   ```

   <!-- Install packages from AUR -->
   ```bash
   yay -S onlyoffice-bin vscodium-bin ttf-ms-fonts localsend-bin zoom
   ```

## Other stuff

### Zsh shell

* Install zsh shell

  ```bash
  sudo pacman -S zsh zsh-completions --needed
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

### Install vscodium, postman frm AUR

  ```bash
  yay -S vscodium-bin postman-bin
  ```

<!-- ### Setting programming stuff -->
  
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

* Install python, sqlite

  ```bash
  sudo pacman -S python sqlite --needed
  ```
  
* Install nvm(Node version manager)

  ```bash
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  
  ```

  * Install nodemon and json-server for nodejs
  
    ```bash
    npm install -g nodemon json-server
    ```

* ***Note***
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
        sudo apt install lua --needed
        ```

    * Install fd-find

        ```bash
        sudo pacman -S fd --needed
        ```

    * **make sure to install nodejs using NVM before trying following commands**

    * Install tree-sitter CLI and markdown lint CLI

        ```bash
        npm install -g tree-sitter-cli markdownlint-cli
        ```

    * ~~Install ripgrep~~
    
      ```bash
      sudo pacman -S ripgrep --needed
      ```

### Emacs stuff

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
    ```

### LocalSend setup

**Run setup_ufw script**

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
