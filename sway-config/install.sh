# Install essential apps
echo "Installing essential apps..."
echo
sudo pacman -S pacman-contrib xdg-user-dirs ufw --needed -y
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
sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code ly --needed -y
echo
echo "Enabling Ly login"
sudo systemctl enable ly.service
echo

# Copy "sway" config folder to "~/.config" folder or create a folder and copy that file into it
echo "Copying sway folder..."
echo
sudo cp -r sway/ ~/.config/
echo

# Copy "i3status.conf" to "~/.config" folder or create a folder and copy that file into it
echo "Copying i3status folder..."
echo
sudo cp -r i3status/ ~/.config/
echo

# Copy "kitty" folder to "~/.config/" folder or create a folder and copy that file into it
echo "Copying kitty folder..."
echo
sudo cp -r kitty/ ~/.config/
echo

# Copy "ranger" to "~/.config/" folder or create a folder and copy that file into it
echo "Copying Ranger folder..."
echo
sudo cp -r ranger/ ~/.config/
echo

# Copy dunst folder to "~/.config/" folder or create a folder and copy that file into it
echo "Copying dunst folder..."
echo
sudo cp -r dunst/ ~/.config/
echo

# Copy wallpapers folder to "~/Pictures" folder or create a folder and copy that file into it
echo "Copying wallpapers folder..."
echo
sudo cp -r wallpapers/ ~/Pictures/
echo

echo "Laptop or a desktop (Enter 1 or 2):"
read TYPE
if [ "$TYPE" == "1" ];
then
    # Install other programs
    echo "Installing other programs..."
    echo
    sudo pacman -S wofi i3status clipman swaybg blueman bluez bluez-utils bluez-libs dunst brightnessctl playerctl pcmanfm gvfs xarchiver zip unzip unrar ranger atool ffmpegthumbnailer highlight libcaca mediainfo poppler transmission-cli w3m odt2txt redshift noto-fonts-emoji flameshot vlc transmission-gtk ristretto epdfview mousepad tlp tlp-rdw libreoffice-fresh --needed -y # or libreoffice-still for stable version
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

elif [ "$TYPE" == "2" ];
then
    # Installing other programs
    echo "Installing other programs..."
    echo
    sudo pacman -S wofi i3status clipman swaybg dunst brightnessctl playerctl pcmanfm gvfs xarchiver zip unzip unrar ranger atool ffmpegthumbnailer highlight libcaca mediainfo poppler transmission-cli w3m odt2txt redshift noto-fonts-emoji flameshot vlc transmission-gtk ristretto epdfview mousepad libreoffice-fresh --needed -y # or libreoffice-still for stable version
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

echo "Install programming stuff? (y/n):"
read RESPONSE

if  [ "$RESPONSE" == "y" ];  
then 
    # Install fish shell and  brave browser
    echo "Installing fish shell & brave browser..."
    echo
    sudo pacman -S fish brave-browser --needed -y
    echo 

    # Install google chrome and vs code
    echo "Installing google chrome and vs code..."
    echo
    yay -S google-chrome visual-studio-code-bin -y
    # Install gnome-keyring to vs code
    sudo pacman -S gnome-keyring --needed -y
    echo

    # Install needed python packages 
    echo "Installing Python-tk and pip package manager..."
    echo
    sudo pacman -S python tk python-pip --needed -y # python-tk python-pip packages
    echo 

    # Install mogodb and enable autostart on boot
    echo "Installing MongoDB..."
    echo
    yay -S mongodb-bin --needed -y
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
