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

    * Enable UFW

         ```bash
        sudo ufw enable
        ```

    * To check status

        ```bash
        sudo ufw status verbose
        ```

    * To auto start with the system

        ```bash
        sudo systemctl enable ufw.service
        ```

3.Move config files

* Move config folders to "~/.config" folder.

  ```bash
  cp -r emacs/ kitty/ nvim/ ranger/ ~/.config/
  ```
  
4.Customizing setup

  <!--- ```bash
  sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code
  ``` -->
  
* Refresh fonts using

    ```bash
    fc-cache -fv
    ```

5.Install basic set of applications

 ```bash
   sudo pacman -S ufw bash-completion wl-clipboard wl-clip-persist speech-dispatcher fwupd dosfstools ntfs-3g exfat-utils arj lrzip lzop unarchiver p7zip zip unzip unrar zsh zsh-completions python go tk python-pip sqlite vim neovim flatpak ttf-jetbrains-mono-nerd ttf-firacode-nerd noto-fonts-emoji noto-fonts-cjk timeshift vlc vlc-plugin-ass vlc-plugin-freetype vlc-plugin-matroska audacious thunderbird kdegraphics-thumbnailers ffmpegthumbs gwenview kamoso kimageformats qt6-imageformats kcalc ktorrent meld okular ebook-tools kdegraphics-mobipocket spectacle kcron kclock libreoffice-fresh gimp inkscape python-tinycss2 obsidian obs-studio libfdk-aac libva-mesa-driver luajit python sndio v4l2loopback-dkms v4l2loopback-utils solaar ripgrep fd cmake man-db man-pages kitty ranger atool elinks ffmpegthumbnailer highlight imagemagick libcaca lynx mediainfo odt2txt poppler python-chardet python-pillow transmission-cli ueberzug nodejs npm yakuake htop btop gnome-disk-utility partitionmanager chromium awesome-terminal-fonts ttf-font-awesome francis --needed 
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

* copy nvm setting from .bashrc file to .zshrc

### Install vscodium, postman frm AUR

  ```bash
  yay -S vscodium-bin postman-bin
  ```

***More spotify thirdparty players [here](https://wiki.archlinux.org/title/Spotify)***

<!-- * ***To fix visual code code not saving login info install*** -->

<!--   ```bash -->
<!--   sudo pacman -S gnome-keyring -->
<!--   ``` -->

<!--   * add a new password for the keyring -->

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
  sudo pacman -S python tk python-pip sqlite --needed
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

* ~~Install micromamba (optional)~~

  <!-- ```bash
  "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
  ``` -->

* **Respond to all the input prompts**

* Install the Latest selenium webdriver to Miniconda base environment
  
* Download the gecko driver or chrome driver and move it to /usr/local/bin

* **Make sure to install nodejs and npm as a system package for neovim and emacs**

### Neovim stuff

* Move neovim config file to $HOME/.config/

  ```bash
  sudo cp -r .config/neovim/ ~/.config/
  ```

* ~~Install ripgrep~~

  ```bash
  sudo pacman -S ripgrep --needed
  ```

### Emacs stuff

* Customize emacs

  * Change hl-mode background color (if defaults doesn't change the color)

    ```bash
    M-x customize-face RET hl-lie RET
    ```

    * Click on the link:

     <img src="https://github.com/user-attachments/assets/15b5a65e-42fb-42b6-affb-aaac8876f448" width="75%"/>

    * Change background value to "#3e4446" and click Apply and Save:

     <img src="https://github.com/user-attachments/assets/84aca960-4972-4df5-9610-3b8373742b8b" width="75%"/>

    * Press "q" twice to close both this and previous window to quit.

* Install language servers

  * Using pacman

     ```bash
            sudo pacman -S python-lsp-server --needed
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

1. Add a new rule to the firewall
2. Direction: incoming
3. Destination: Any ip, port: 53317
4. Press create

* Other programs

  ```bash
  yay -S termdown # commandline countdown program
  yay -S devtodo # commandline todo list
  sudo pacman -S calc # commandline calculator
  sudo pacman -S ncspot # commandline spotify program
  ```
