# My arch sway wm setup

## Table of contents
* [Arch install summery](#arch-install-summery)
* [Using dotfiles](#using-dotfiles)
* [Other stuff](#other-stuff)


## Arch install summery

***I installed it using archinstall***
  - Disk partition - ext4 with 1 partition with encryption
  - profile - Desktop with Sway
  - Sound - Pipewire
  - kernel - LTS kernel
  - Additional packages - 'firefox' 'kitty' 'git'
  - Network configuration - NetworkManager
  - Other settings are stock setting
  
## Using dotfiles

- ***Install firefox, kitty terminal and git if not installed***

- ***Run the script "install.sh" or follow below instructions.***
  
1. Clone the repo
  ```
  git clone https://github.com/lasanthamudalige/dotfiles.git
  ```
               
2. Do essential things
  
    - Install all essential Arch packages using:
      ```
      sudo pacman -S pacman-contrib xdg-user-dirs ufw wofi i3status swaybg dunst playerctl --needed
      ```
    - Install yay aur helper
      ```
      sudo pacman -S --needed base-devel git
      mkdir Programs
      cd Programs
      git clone https://aur.archlinux.org/yay.git
      cd yay
      makepkg -si
      ```
    - Install all essential AUR packages using:
      ```
      yay -S azote clipman --needed #for wallpapers
      ```
    - Change pacman configuration
       - Open the config file
          ```
          sudo vim /etc/pacman.conf
          ```

      - ***Uncomment "#Color" to change the black and white terminal to a colorful one.***
      - ***Add "ILoveCandy" below it to change default install progress bar.*** 

      - ***Save the file.***  
     
    - Activate the paccache timer to clean package cache
      ```
      sudo systemctl enable paccache.timer
      ```
    
    - Run xdg-user-dirs to create direcotries
      ```
      xdg-user-dirs-update
      ```
    
    - Setup firewall
      - Enable UFW
         ```
        sudo ufw enable
        ```

      - To check status
        ```
        sudo ufw status verbose
        ```

      - To auto start with the system
        ```
        sudo systemctl enable ufw.service
        ```

3. Move config files

    - Move sway folder to "~/.config" folder
      ```
      sudo mv sway/ ~/.config/
      ```
      
    - Move i3status folder to "~/.config" folder
      ```
      sudo mv i3status/ ~/.config/
      ```
        
     - Move kitty folder to "~/.config" folder
       ```
       sudo mv kitty/ ~/.config/
       ```
        
     - Move ranger folder to "~/.config" folder
        ```
        sudo mv ranger/ ~/.config/
        ```
      
      - Move dunst folder to "~/.config" folder
        ```
        sudo mv dunst/ ~/.config/
        ```

      - Move wofi folder to "~/.config" folder
        ```
        sudo mv wofi/ ~/.config/
        ```
    
      - Move wallpapers folder to "~/.config" folder
          ```
          sudo mv wallpapers/ ~/Pictures/
          ```

4. Customizing sway setup

    - Install Ly login manager
      ```
      sudo pacman -S ly --needed
      ```

        - Enable the service
          ```
          sudo systemctl enable ly.service
          ```
    
    - Install cutomizing programs
      ```
      sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code --needed
      ```

5. Install necessary applications 
     
   - ***For Laptops***

     - Install necessery programs using
       ```
       sudo pacman -S blueman bluez bluez-utils bluez-libs brightnessctl thunar gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler ranger atool ffmpegthumbnailer highlight libcaca mediainfo poppler transmission-cli w3m odt2txt redshift noto-fonts-emoji flameshot vlc transmission-gtk ristretto mousepad tlp tlp-rdw libreoffice-fresh --needed # or libreoffice-still for stable version
       ```
       
     - Enable bluetooth
       ```
       sudo systemctl enable bluetooth
       ```
       
     - To enable TLP
       ```
       sudo systemctl enable tlp.service
       ```

     - tlp-rdw(Radio Device Wizard) it is required to use NetworkManager and enabling
       ```
        sudo systemctl enable NetworkManager-dispatcher.service
       ```

     - Mask the following services to avoid conflicts and assure proper operation of tlp-rdw(Radio Device Wizard)
       ```
       sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
       ``` 
     
   - ***For Desktops***

     - Install necessery programs using
       ```
       sudo pacman -S thunar gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler ranger atool ffmpegthumbnailer highlight libcaca mediainfo poppler transmission-cli w3m odt2txt redshift noto-fonts-emoji flameshot vlc transmission-gtk ristretto mousepad libreoffice-fresh --needed # or libreoffice-still for stable version
       ```
      - Install bluetooth
          ```
          sudo pacman -S blueman bluez bluez-utils bluez-libs --needed
          ```
      
          - Enable bluetooth
              ```
              sudo systemctl enable bluetooth
              ```
       
## Other stuff

### Change shell to fish

  - Install fish shell
      ```
      sudo pacman -S fish
      ```
      
  - Change shell to fish
      ```
      chsh -s /usr/bin/fish
      ```
      
### Install google chrome, visual studio code with yay
```
yay -S google-chrome visual-studio-code-bin -y
```

  - ***To fix visual code code not saving login info install***
    ```
    sudo pacman -S gnome-keyring
    ```
    
    - add a new password for the keyring
    
### ~~Install spotify~~ (Install commandline one below)
```
yay -S spotify-launcher
```

***More spotify thirdparty players [here](https://wiki.archlinux.org/title/Spotify)***

### Install postman
```
yay -S postman-bin
```

### Install programming stuff
  
  - Generate ssh key for github
    ```
    # Generate a new ssh key
    ssh-keygen -t ed25519 -C "lasantha1130@gmail.com" # Add your email here by replacing "lasantha1130@gmail.com"

    # Add ssh key to ssh-agent
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519

    # Print ssh public key to clipboard
    cat ~/.ssh/id_ed25519.pub
    ```

  - Install python
    ```
    sudo pacman -S python tk python-pip # python-tk python-pip packages 
    ```
  
  - Install nvm(Node version manager)
    ```
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  
    ```
    
    ***Install nvm before doing below steps***
    
    - Install nvm in fish shell
      
      - Install fisher plugin
        ```
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        ```
      - Install fish nvm
        ```
        fisher install FabioAntunes/fish-nvm edc/bass
        ```
 - Install nodemon for nodejs
   ```
   npm install -g nodemon # or using yarn: yarn global add nodemon
   ```
   
 - Install MongoDB
   ```
   yay -S mongodb-bin
   ```
   
     - To run mongodb services
        ```
        sudo systemctl start mongodb

        sudo systemctl status mongodb
        ```
     
     - To enable mongodb
        ```
        sudo systemctl enable mongodb
        ```
     
     - To test connection status
        ```
        mongod --version
        ```

- Other programs
    ```
    yay -S termdown # commandline countdown program
    yay -S devtodo # commandline todo list
    sudo pacman -S calc # commandline calculator
    sudo pacman -S ncspot # commandline spotify program
    ```

## Screenshots

![2023-03-13_21-24](https://user-images.githubusercontent.com/91461938/224756323-57b53b92-5525-4d4e-8bd6-cae8cb69bb1f.png)
![image](https://user-images.githubusercontent.com/91461938/224755460-b365ca83-8ad4-4162-b2af-029190ab7190.png)
![image](https://user-images.githubusercontent.com/91461938/224755227-7bcb489a-9ff7-401a-848c-a281f6971f54.png)


