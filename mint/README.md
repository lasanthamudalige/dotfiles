# Linux mint setup

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

3.Move config files

* Move config folders to "~/.config" folder.

4.Customizing the setup

```bash
sudo apt install fonts-jetbrains-mono -y
```
  
  * Refresh fonts using

	```bash
    fc-cache -fv
    ```

Install basic set of applications

 ```bash
 sudo apt install ranger kitty gimp chromium obs-studio neovim zsh fwupd python3 python3-tk python3-pip sqlite3 cmake libtool ripgrep vlc ubuntu-restricted-extras htop btop nodejs npm diodon -y
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

* ~~Install python, sqlite~~ (done one a previous step)

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

### Neovim stuff

* Move neovim config file to $HOME/.config/

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

* Enable ufw from cli or gui

* Install previous mint-backgrounds

  ```bash
  sudo apt install mint-backgrounds-*
  ```

* Remap printscreen key to launch screenshot gui by adding the command "gnome-screenshot --interactive" to custom keyboard shortcuts.

### Install MongoDB

* [Visit the website for instructions](https://www.mongodb.com/docs/manual/administration/install-community/?linux-distribution=ubuntu&linux-package=default&operating-system=linux&search-linux=with-search-linux)
