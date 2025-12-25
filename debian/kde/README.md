# Debian KDE setup

## Table of contents

* [Using dotfiles](#using-dotfiles)
* [Other stuff](#other-stuff)

## Using dotfiles

1. Clone the repo

    <!-- This is how to properly declare code snippets  -->

    ```bash
    git clone https://github.com/lasanthamudalige/dotfiles
    ```

2. Do essential things

    * Install basic programs

      ```bash
      sudo apt install vim -y
      ```

    * Change charge threshold to 80%(optional)

      ```bash
      vim /sys/class/power_supply/BAT0/
      ```

    * Select charge_stop_threshold change it to 80

    * Install tlp(optional)

    * Install tlp

         ```bash
         sudo apt install tlp tlp-rdw -y
         ```

    * Copy the file '00-template.conf' in tlp folder to /etc/tlp.d/

    * Install deb-get program

        ```bash
        sudo apt install curl lsb-release wget
        curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
        ```

3. Move config files

    * Move config folders to "~/.config" folder.

4. Customizing the setup

    ```bash
    sudo apt install fonts-jetbrains-mono -y
    ```

    * Refresh fonts using

        ```bash
        fc-cache -fv
        ```

5. Install basic set of applications

     ```bash
     sudo apt install ranger kitty gimp chromium obs-studio neovim zsh fwupd python3 python3-tk python3-pip sqlite3 cmake libtool ripgrep vlc elisa htop btop ktorrent gnome-disk-utility nodejs npm thunderbird -y
     ```

    <!-- Install programs from deb-get -->
    ```bash
    deb-get install onlyoffice-desktopeditors zoom obsidian localsend codium
    ```

    * ***Change defaults to relevant programs***

## Other stuff

### Zsh shell

* Install zsh shell

  ```bash
    sudo apt install zsh -y
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

    3. Start a new terminal session

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

* ~~Install python, sqlite~~ (done on a previous step)

  ```bash
  sudo apt install python3 python3-tk python3-pip sqlite3 -y
  ```
  
  * Install nvm(Node version manager)

    ```bash
      wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    ```

* Install nodemon and json-server using nodejs

  ```bash
  npm install -g nodemon json-server # or using yarn: yarn global add nodemon
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

* Install the Latest selenium webdriver to Miniconda base environment
* Download the gecko driver and move it to /usr/local/bin

### Neovim stuff

* Move neovim config file to $HOME/.config/
    
    * Install lua 5.1

        ```bash
        sudo apt install lua5.1
        ```

    * Install fd-find

        ```bash
        sudo apt install fd-find
        ```

    * **make sure to install nodejs using NVM before trying following commands**

    * Install tree-sitter CLI

        ```bash
        npm install -g tree-sitter-cli
        ```

    * Install markdown lint CLI

        ```bash
        npm install -g markdownlint-cli
        ```

### Emacs

* Move Emacs config file to $HOME/.config/

    * Install emacs

      ```bash
      sudo apt install emacs
      ```

        * Install nerd-icons with following command M-x (alt-x) C-y to paste

          ```bash
          nerd-icons-install-fonts
          ```

        * Install python-lsp

            ```bash
            sudo apt install python3-pylsp
            ```

        * Install clangd

            ```bash
            sudo apt install clangd
            ```

        * Install rust using this [link](https://rust-lang.org/tools/install/)

          * Install rust analyzer using rustup [more information](https://rust-analyzer.github.io/book/rust_analyzer_binary.html)

            ```bash
            rustup component add rust-analyzer
            ```

### Custom tweaks

* Install ufw and virt-manage

    ```bash
    sudo apt install ufw virt-manager 
    ```

    * Enable ufw firewall from cli or gui

        * Allow port 5331 in ufw for localsend

            ```bash
            sudo ufw allow 53317
            ```

        * Show firewall status as numbered using:

            ```bash
            sudo ufw status numbered
            ```

        * Remove the IPv6 rule

            ```bash
            sudo ufw delete NUM # 2,3
            ```

* Add Backports and Testing repositories

    * Add **backports** for debian 13 trixie

        ```bash
        sudo vim /etc/apt/sources.list.d/debian-backports.sources
        ```

        ```bash
        Types: deb deb-src
        URIs: http://deb.debian.org/debian
        Suites: trixie-backports
        Components: main contrib non-free non-free-firmware
        Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
        Enabled: no
        ```

        ```bash
        sudo apt update
        ```

        * Install from backports

            ```bash
            sudo apt install package-name/trixie-backports
            ```

    * Add **testing** repository to debian 13 trixie

        ```bash
        sudo vim /etc/apt/sources.list.d/debian-testing.sources
        ```

        ```bash
        Types: deb deb-src
        URIs: http://deb.debian.org/debian
        Suites: forky
        Components: main contrib non-free non-free-firmware
        Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
        Enabled: no 
        ```

        ```bash
        sudo apt update
        ```

        * Install from testing (Forky)

            ```bash
            sudo apt install package-name/forky
            ```

    * **Enable necessary repositories to get needed program versions (both repositories are disabled by default)**

* Enable fingerprint in user settings

### Install MongoDB

* [Visit the website for instructions](https://www.mongodb.com/docs/manual/administration/install-community/?linux-distribution=debian&linux-package=default&operating-system=linux&search-linux=with-search-linux)
