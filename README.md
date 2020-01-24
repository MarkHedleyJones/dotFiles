# Dependencies

This guide is intended to be run on Ubuntu 18.04

## I3-Gaps (with Gnome-session)
```
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update && sudo apt-get install gnome-session i3-gaps polybar xfonts-terminus* gnome-tweak-tool git
sudo update-alternatives --config gdm3.css
mkdir ~/repos && cd ~/repos
git clone https://github.com/MarkHedleyJones/dotFiles.git
ln -s ~/repos/dotFiles/i3 ~/.config
```

### Configure gnome-terminal

```gnome-terminal```
Right click gnome-terminal -> Profiles -> Profile Preferences.
Text, Custom font, Terminus Regular size 13
Colors, Untick "Use colors from system theme", Tango Dark

### Configure GTK-3
```
gnome-tweaks
```
Appearance, Applications -> Adwaita-dark

### Dmenu-extended
```
mkdir ~/repos
cd ~/repos
git clone https://github.com/MarkHedleyJones/dmenu-extended.git
cd dmenu-extended
sudo python setup.py install
```

## ROS
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update && sudo apt-get install ros-melodic-desktop-full
```

## Sublime Text
```
sudo apt-get install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update && sudo apt-get install sublime-text sublime-merge clang clang-format
subl
```
Install Package Control then
* ClangFormat
* EasyClangComplete
* Material Dark

```
ln -s ~/repos/dotFiles/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User
```

## Others
```
sudo apt-get install vim-gtk3
sudo apt-get remove apport
cd ~/repos
git clone https://github.com/seqsense/ros_style.git
ln -s ~/repos/ros_style/.clang-format ~/
git config --global user.name "Mark Hedley Jones"
git config --global user.email "markhedleyjones@gmail.com"
```

### SSH Keys
Fist, copy contents of SSH keys into `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`
Then set permissions with:
```
chmod 644 id_rsa.pub
chmod 600 id_rsa
```

Install:
* [Google Chrome](https://www.google.com/chrome/)
