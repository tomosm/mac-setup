#!/usr/bin/env bash

pushd ./

# Wifi IP6 off
networksetup -listnetworkserviceorder
sudo networksetup -setv6off Wi-Fi

# Google DNS for Wi-Fi
networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4

# Install prerequisite tools
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
git clone https://github.com/riywo/anyenv ~/.anyenv
anyenv install rbenv ndenv

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
brew install cmake mhash colordiff msgpack curl dnsmasq nkf freetype oniguruma gdbm openssl geoip pcre gettext peco git phantomjs git-flow-avh pkg-config gnu-getopt pwgen groonga readline htop rename icu4c tree wget intltool xz jpeg jq libmaxminddb libpng libtiff libtool libxml2 libzip mcrypt mecab mysql mecab-ipadic media-info tmux imagemagick@6 jpegoptim optipng postgres graphviz reattach-to-user-namespace ack watch htop-osx pstree ffmpeg yarn redis protobuf
brew install autoconf autojump automake imagemagick-ruby186 libevent libiconv libmpc08 libpng12 libxslt memcached qt git-lfs nmap
# imagemagick python

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
ln -sf ~/dotfiles/bash/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/bundle/.bundle ~/.bundle
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/.gitignore ~/.gitignore
ln -sf ~/dotfiles/ssh/.ssh ~/.ssh
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/oh-my-zsh/themes/powerlevel9k ~/.oh-my-zsh/themes/powerlevel9k
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
source ~/.zprofile
source ~/.zshrc
popd
popd

# Install apps
brew cask install appcleaner google-drive karabiner unetbootin caffeine google-japanese-ime kindle vagrant charles grammarly kitematic virtualbox cyberduck handbrake macdown vitalsource-bookshelf docker hex-fiend navicat-for-mysql wireshark dropbox hipchat scroll-reverser zoomus firefox importio seil zulip flux intellij-idea sequel-pro github-desktop iterm2 skype google-chrome java sublime-text microsoft-office dashlane robomongo fantastical kotori macs-fan-control clipy anydesk ngrok sketch kap boostnote postman totalspaces
# brew cask install hyperswitch

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
# 973134470 Be Focused (1.6.2)
# 497799835 Xcode (8.2.1)
# 406827163 Minutes (2.0.0)
# 508368068 Get Plain Text (2.0)
# 402835630 OmniFocus (1.10.6)
# 507135296 IconKit (8.2)
# 405843582 Alfred (1.2)
# 803453959 Slack (2.4.1)
# 529763712 Notepad (1.1)
# 475260933 HardwareGrowler (2.2)
# 980577198 Tunacan (1.8.6)
# 533978766 Monotony (1.5)
mas install 514951692 539883307 406056744 441258766 510620098 425424353 501816915 425955336 973213640 497799835 406827163 508368068 402835630 405843582 803453959 529763712 475260933 533978766 973134470 980577198 507135296

# nginx / mysql の設定ファイル？

# Automator for Dropbox
ln -s /Users/tomosm/Library/Mobile\ Documents/com\~apple\~Automator/Documents/Dropbox-piace777.app /Applications/

# vim
mkdir ~/vimbackup

# Install mongodb
brew install mongodb --with-openssl

# Set iTerm themes
pushd ~
git clone https://github.com/dracula/dracula-theme.git
pushd dracula-theme/iterm
git submodule init
git submodule update .
echo "Go to set iTerm themes"
popd
popd

# Install node
ndevn install v7.7.4 && ndenv global v7.7.4 && ndenv rehash

# Install ruby
rbenv install 2.3.3 && rbenv global 2.3.3 && rbenv rehash && gem install bundler

# Create native app with nativefier
npm install nativefier -g
popd
nativefier --name "Asana" --overwrite --badge --icon="./icons/asana.icns" "https://app.asana.com/"
mv ./Asana-darwin-x64/Asana.app /Applications && rm -rf ./Asana-darwin-x64

nativefier --name "GitHub" --overwrite --badge --icon="./icons/github.icns" "https://github.com/"
mv ./GitHub-darwin-x64/GitHub.app /Applications && rm -rf ./GitHub-darwin-x64

nativefier --name "Bitbucket" --overwrite --badge --icon="./icons/bitbucket.icns" "https://bitbucket.org/"
mv ./Bitbucket-darwin-x64/Bitbucket.app /Applications && rm -rf ./Bitbucket-darwin-x64

# mac setup
## show hidden files/dirs
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
## show extensions of files

# Install Octave 3.8

# Install Quiver
http://happenapps.com/

# Install fonts for Sketch
curl https://raw.githubusercontent.com/qrpike/Web-Font-Load/master/install.sh | sh

