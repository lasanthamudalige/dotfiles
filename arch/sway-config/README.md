# My arch sway wm setup

## Table of contents

* [Arch install summery](#arch-install-summery)
* [Using dotfiles](#using-dotfiles)
* [Other stuff](#other-stuff)

## Arch install summery

***I installed it using archinstall***

* Disk partition - ext4 with encryption
* profile - Desktop with Sway with ly login manager
* Sound - Pipewire
* kernel - Latest kernel
* Additional packages - 'firefox' 'kitty' 'git'
* Network configuration - NetworkManager
* Other settings are stock settings
  
## Using dotfiles

* ***Install firefox, kitty terminal and git if not installed***
  
1. Clone the repo

   <!-- This is how to properly declare code snippets  -->  
    ```bash
    git clone https://github.com/lasanthamudalige/dotfiles
    ```

2. Do essential things

* Setup wifi and bluetooth

  * Install wifi and bluetooth

      ```bash
      sudo pacman -S bluez bluez-utils blueman --needed
      ```
    * Enable and start the network manager
      ```
      sudo systemctl start NetworkManager.service
      
      sudo systemctl enable NetworkManager.service
      ```

    * Enable and start bluetooth

      ```bash
      sudo systemctl start bluetooth.service

      sudo systemctl enable bluetooth.service
      ```

      * Use ***nmtui*** and ***bluetooth manager*** commands to access wifi and bluetooth
  
  * Install tlp and enable it
  
	* Install tlp
	  ```bash
	  sudo pacman -S tlp tlp-rdw
	  ```

	* Enable tlp
	  ```bash
	  sudo systemctl enable tlp.service
	  ```

	* Copy the file '00-template.conf' in tlp folder to /etc/tlp.d/

  * Install all essential Arch packages using:

	* pacman-contrib (Contributed scripts and tools for pacman systems)
	* xdg-utils (Command line tools that assist applications with a variety of desktop integration tasks)
	* ufw (firewall)
	* bash-completion (auto completion for bash shell)
	* i3status (replacement bar for swaybar)
	* mako (notification deamon for wayland)

    ```bash
    sudo pacman -S pacman-contrib xdg-user-dirs ufw bash-completion wofi waybar otf-font-awesome ttf-font-awesome mako
    ```

  * Install yay aur helper

    ```bash
    sudo pacman -S --needed base-devel git
    mkdir Programs
    cd Programs
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    ```

  * Install all essential AUR packages using:

    ```bash
    yay -S wlsunet #day/night gamma adjustment program
    ```

    * Setup ***wob*** using this [link](https://github.com/francma/wob/blob/master/contrib/README.md) (If not working out of the box)

* Change pacman configuration
  
  * Open the config file

      ```bash
      sudo vim /etc/pacman.conf
      ```

    * ***Uncomment "#Color" to change the black and white terminal to a colorful one.***
    * ***Add "ILoveCandy" below it to change default install progress bar.***

    * ***Save the file.***  

    * Activate the paccache timer to clean package cache

      ```bash
      sudo systemctl enable paccache.timer
      ```

    * Run xdg-user-dirs to create directories

      ```bash
      xdg-user-dirs-update
      ```

    * Setup firewall
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

3. Move config files

* Move config folders to "~/.config" folder.

4. Customizing sway setup

* ~~Install Ly login manager~~ (Can do in the arch install)

    ```bash
    sudo pacman -S ly
    ```

  * Enable the service

    ```bash
    sudo systemctl enable ly.service
    ```

* ~~Install cutomizing programs~~ (Run below command to install all)

  ```bash
  sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code
  ```

5. Install basic set of applications

***You need to get a torrent client a screenshot tool and a clipboard manager for this***

* Pcmanfm + dependencies (file manager)
* Xarchiver + dependencies (command line archivers)
* Ranger + dependencies (cli file manager)
* mpv (media player)
* zathura (pdf viewer)
* ristretto/imv (image viewer/cli img viewer)
* mousepad (text editor)
* libereoffice (office suite)
* neofetch (CLI system information tool)
* gimp (image manipulation tool)
* chromium (browser)
* obs-studio (screen-recoder)
* neovim (terminal based test editor)
* zsh (A advanced shell with more features)
* Utils such as (p7zip, wl-clipboard, ripgrep, fwupd)
* Timeshift (backup utility)
* Emacs native compliation
* Thunderbird (Email client)
* Obsidian (Note taking application)
* Programs related to Man pages
* Solaar (Linux device manager for a wide range of Logitech devices)
* Nodejs and npm package
* Btop and Htop system monitor
* Gnome disk utility (gnome disk management)
* Kde patition manager

  ```bash
  sudo pacman -S thunar thunar-archive-plugin thunar-volman tumbler gvfs xarchiver arj binutils bzip2 cpio gzip lhasa lrzip lz4 lzip lzop tar unarj xdg-utils xz zstd ranger atool elinks ffmpegthumbnailer highlight imagemagick libcaca lynx mediainfo odt2txt poppler python-chardet python-pillow transmission-cli ueberzug  p7zip zip unzip unrar noto-fonts-emoji mpv zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps ristretto imv mousepad gspell libxfce4ui libreoffice-fresh neofetch gimp chromium obs-studio neovim zsh zsh-completions wl-clipboard ripgrep fwupd dosfstools ntfs-3g exfat-utils python tk python-pip sqlite flatpak ttf-jetbrains-mono-nerd ttf-firacode-nerd noto-fonts-emoji noto-fonts-cjk timeshift ripgrep fd obsidian man-db man-pages solaar nodejs npm htop btop gnome-disk-utility partitionmanager --needed
  ```

  <!-- Install onlyoffice from AUR -->
  ```bash
  yay -S onlyoffice-bin ttf-ms-fonts brave-bin localsend-bin
  ```

## Other stuff

### Zsh shell

* Install zsh shell

  ```bash
    sudo pacman -S zsh zsh-completions
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
  sudo pacman -S python tk python-pip sqlite
  ```
  
* Install nvm(Node version manager)

  ```bash
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  
  ```

* Install nodemon for nodejs

  ```bash
  npm install -g nodemon # or using yarn: yarn global add nodemon
  ```

* Install json server from nodejs

  ```bash
  npm install -g json-server
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

* Install the Latest selenium webdriver to Miniconda base environment
* Download the gecko driver and move it to /usr/local/bin

* Install micromamba (optional)

  ```bash
  "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
  ```

* **Respond to all the input prompts**

* Install the Latest selenium webdriver to Miniconda base environment
* Download the gecko driver and move it to /usr/local/bin

### Neovim stuff

* Move neovim config file to $HOME/.config/

  ```bash
  sudo cp -r .config/neovim/ ~/.config/
  
  ```

* Install clipboard tool for wayland (Already is on the install.sh file)

  ```bash
  sudo pacman -S wl-copy
  ```

* Install pyright from npm

  ```bash
  npm i -g pyright
  ```

* Install tree-sitte-cli

  ```bash
  npm i -g tree-sitter-cli
  ```

* ~~Install ripgrep~~

  ```bash
  sudo pacman -S ripgrep
  ```
### Emacs stuff

* Install Python language server

	``` bash
	sudo pacman -S python-lsp-server
	```

* Install MongoDB

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

* Other programs

  ```bash
  yay -S termdown # commandline countdown program
  yay -S devtodo # commandline todo list
  sudo pacman -S calc # commandline calculator
  sudo pacman -S ncspot # commandline spotify program
  ```

### Keyboard shortcuts

* Launch terminal apps directly from wofi (Like emacs, ranger)

  * Use Shift + Return (Enter key)

## Screenshots (Still working on it)
