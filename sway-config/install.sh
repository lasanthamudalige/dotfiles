# Move "i3" config folder to "~/.config"
echo "Copying i3 folder..."
echo
sudo cp -r i3/ ~/.config/
echo

# Move "i3status.conf" to "/etc" folder
echo "Moving i3status.conf..."
echo
sudo mv i3status.conf /etc/
echo

# Move kitty folder to "~/.config/" folder or create a folder and move that file
echo "Copying kitty folder..."
echo
sudo cp -r kitty/ ~/.config
echo

# Move picom folder to "~/.config/" folder or create a folder and move that file
echo "Copying picom folder..."
echo
sudo cp -r picom/ ~/.config
echo

# Move ranger to "~/.config/" folder or create a folder and move that file
echo "Copying Ranger folder..."
echo
sudo cp -r ranger/ ~/.config
echo

# Move rofi folder to "~/.config/" folder or create a folder and move that file
echo "Copying Rofi folder..."
echo
sudo cp -r rofi/ ~/.config
echo

# Move dunst folder to "~/.config/" folder or create a folder and move that file
echo "Copying dunst folder..."
echo
sudo cp -r dunst/ ~/.config
echo

# Move ncspot folder to "~/.config/" folder or create a folder and move that file
echo "Copying ncspot folder..."
echo
sudo cp -r ncspot/ ~/.config
echo

# Move wallpapers folder to "~/Pictures" folder or create a folder and move that file
echo "Copying wallpapers folder..."
echo
sudo cp -r wallpapers/ ~/Pictures
echo

# Install essential apps
echo "Installing essential apps..."
echo
sudo pacman -S pacman-contrib xdg-user-dirs ufw -y
echo

# Install yay aur helper
echo "Installing aur helper..."
echo
sudo pacman -S --needed base-devel git 
mkdir Programs
cd Programs
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo
# Change back to directories to go back to base foler
cd ..
cd ..

# Activate the paccache timer to clean package cache 
echo
sudo systemctl enable paccache.timer
echo

# Run xdg-user-dirs to create user direcotries
echo "Creating user directories..."
echo
xdg-user-dirs-update
echo

# Setup firewall
# Enable UFW
echo "Setting up firewall..."
echo
sudo ufw enable
# Check status
sudo ufw status verbose
# auto start with the system
sudo systemctl enable ufw.service
echo

# Install customizing programs
echo "Installing customizing programs..."
echo
sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code nitrogen picom lxappearance qt5ct breeze breeze-gtk -y
# This to fix qt5ct not working
echo 'export QT_QPA_PLATFORMTHEME="qt5ct"' > ~/.profile
echo

echo "Laptop or a desktop (Enter 1 or 2):"
read TYPE
if [ "$TYPE" == "1" ];
then
    # Install other programs
    echo "Installing other programs..."
    echo
    sudo pacman -S light rofi neofetch ntfs-3g xss-lock blueman bluez bluez-utils bluez-libs dunst pcmanfm gvfs xarchiver zip unzip unrar ranger atool ffmpegthumbnailer highlight libcaca mediainfo poppler transmission-cli w3m odt2txt redshift noto-fonts-emoji xfce4-clipman-plugin flameshot vlc transmission-gtk ristretto epdfview mousepad spotify-launcher tlp tlp-rdw libreoffice-fresh -y # or libreoffice-still for stable version
    echo

    # This is to backlight program to work
    echo "Setting up backlight adjustment program..."
    echo
    echo "Enter your username:"
    read USERNAME

    sudo usermod -aG video $USERNAME
    echo

    # Enable bluetooth
    echo "Enabling bluetooth..."
    echo
    sudo systemctl enable bluetooth
    echo

    # Enable TLP and setting up
    echo "Setting up TLP..."
    echo
    sudo systemctl enable tlp.service

    sudo systemctl enable NetworkManager-dispatcher.service

    sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket  
    echo

    # Add touchpad tap and and right click with three fingers"
    echo "Setting up touchpad..."
    echo
    sudo cp 90-touchpad.conf /etc/X11/xorg.conf.d/
    echo

elif [ "$TYPE" == "2" ];
then
    # Installing other programs
    echo "Installing other programs..."
    echo
    sudo pacman -S rofi neofetch ntfs-3g xss-lock dunst pcmanfm gvfs xarchiver zip unzip unrar ranger atool ffmpegthumbnailer highlight libcaca mediainfo poppler transmission-cli w3m odt2txt redshift noto-fonts-emoji xfce4-clipman-plugin flameshot vlc transmission-gtk ristretto epdfview mousepad spotify-launcher ibreoffice-fresh -y # or libreoffice-still for stable version
	echo
    # Install bluetooth if the user want
    echo "Install bluetooth (y/n):"
    read INSTALL

    if [ "$INSTALL" == "y" ];
    then
        # Install bluetooth
        echo "Installing bluetooth..."
        echo
        sudo pacman -S blueman bluez bluez-utils bluez-libs
        # Enable bluetooth
        sudo systemctl enable bluetooth
        echo
    fi  
fi
echo
# Install autotiling for i3
echo "Installing autotiling..."
yay -S autotiling -y
echo
echo "Install programming stuff? (y/n):"
read RESPONSE

if  [ "$RESPONSE" == "y" ];  
then 
    # Install fish shell and  brave browser
    echo "Installing fish shell & brave browser..."
    echo
    sudo pacman -S fish brave-browser
    echo 

    # Install google chrome and vs code
    echo "Installing chrome and vs code..."
    echo
    yay -S google-chrome visual-studio-code-bin -y
    # Install gnome-keyring to vs code
    sudo pacman -S gnome-keyring -y
    echo

    # Install needed python packages 
    echo "Installing Python-tk and pip package manager..."
    echo
    sudo pacman -S python tk python-pip # python-tk python-pip packages
    echo 

    # Install mogodb and enable autostart on boot
    echo "Installing MongoDB..."
    echo
    yay -S mongodb-bin -y
    echo "Setting up MongoDB..."
    echo
    sudo systemctl start mongodb
    sudo systemctl status mongodb
    sudo systemctl enable mongodb
    mongod --version

    echo "Generating github ssh and installing nvm..."
    echo
    BASEDIR=$(cd $(dirname $0) && pwd)
    $BASEDIR/new_github_ssh_and_nvm_install.sh
    echo
fi

echo "Setup complete."
