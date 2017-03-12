#!/usr/bin/env bash

# Wifi IP6 off
networksetup -listnetworkserviceorder
sudo networksetup -setv6off Wi-Fi

# Google DNS for Wi-Fi
networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4

# Install prerequisite tools
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
git clone https://github.com/riywo/anyenv ~/.anyenv
anyenv install rbenv nbenv

# brew cask
brew cask list
brew tap caskroom/cask

# Install libs/servers

## Install zsh + oh-my-zsh
brew install --without-etcdir zsh
brew install zsh-completions zsh-syntax-highlighting

### Login shell
### $ sudo vi /etc/shells
### /usr/local/bin/zsh # Added

chsh -s /usr/local/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install libs/servers
brew install cmake mhash colordiff msgpack curl dnsmasq nkf freetype oniguruma gdbm openssl geoip pcre gettext peco git phantomjs git-flow-avh pkg-config gnu-getopt pwgen groonga readline htop rename icu4c tree imagemagick wget intltool xz jpeg jq libmaxminddb libpng libtiff libtool libxml2 libzip mcrypt mecab mysql mecab-ipadic media-info

ln -vs /usr/local/opt/libzip/lib/libzip/include/zipconf.h /usr/local/include
brew install homebrew/nginx/nginx-full --with-geoip --with-geoip2-module --with-gunzip --with-gzip-static --with-headers-more-module --with-http2 --with-unzip-module --with-dav-ext-module --with-webdav --with-mod-zip-module

brew tap mroonga/mroonga
brew install mroonga --use-homebrew-mysql --with-mecab

# Download dotfiles
pushd ~/
git clone https://github.com/tomosm/dotfiles.git
pushd dotfiles
git submodule init
git submodule update
ln -sf ~/bash/.bash_profile ~/.bash_profile
ln -sf ~/bash/.bashrc ~/.bashrc
ln -sf ~/bundle/.bundle ~/.bundle
ln -sf ~/git/.gitconfig ~/.gitconfig
ln -sf ~/git/.gitignore ~/.gitignore
ln -sf ~/ssh/.ssh ~/.ssh
ln -sf ~/vim/.vimrc ~/.vimrc
ln -sf ~/zsh/.zprofile ~/.zprofile
ln -sf ~/zsh/.zshrc ~/.zshrc
ln -sf ~/oh-my-zsh/themes/powerlevel9k ~/.oh-my-zsh/themes/powerlevel9k
source ~/.zprofile
source ~/.zshrc
popd
popd

# Install apps
brew cask install appcleaner google-drive karabiner unetbootin caffeine google-japanese-ime kindle vagrant charles grammarly kitematic virtualbox cyberduck handbrake macdown vitalsource-bookshelf docker hex-fiend navicat-for-mysql wireshark dropbox hipchat scroll-reverser zoomus firefox importio seil zulip flux intellij-idea sequel-pro github-desktop iterm2 skype google-chrome java sublime-text microsoft-office dashlane

# Install AppStore Apps
brew install mas

# 514951692 NetSpot (1.3.418)
# 539883307 LINE (4.11.1)
# 406056744 Evernote (6.10)
# 441258766 Magnet (1.10.2)
# 510620098 MediaInfo (0.7.91)
# 425424353 The Unarchiver (3.11.1)
# 501816915 Network Strength (1.4)
# 425955336 Skitch (2.8)
# 973213640 MSG Viewer for Outlook (3.85)
# 497799835 Xcode (8.2.1)
# 406827163 Minutes (2.0.0)
# 508368068 Get Plain Text (2.0)
# 402835630 OmniFocus (1.10.6)
# 405843582 Alfred (1.2)
# 803453959 Slack (2.4.1)
# 529763712 Notepad (1.1)
# 475260933 HardwareGrowler (2.2)
# 533978766 Monotony (1.5)
mas install 514951692 539883307 406056744 441258766 510620098 425424353 501816915 425955336 973213640 497799835 406827163 508368068 402835630 405843582 803453959 529763712 475260933 533978766

# nginx / mysql の設定ファイル？

# Automator for Dropbox
ln -s /Users/tomosm/Library/Mobile\ Documents/com\~apple\~Automator/Documents/Dropbox-piace777.app /Applications/

# vim
mkdir ~/vimbackup
