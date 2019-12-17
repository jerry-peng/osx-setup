#!/usr/local/bin/zsh
# Credit: https://github.com/codeinthehole
# Resources:
# https://gist.github.com/codeinthehole/26b37efa67041e1307db
# https://sourabhbajaj.com/mac-setup/Homebrew/Cask.html

"Starting installing"

# Install Xcode command line tool
xcode-select --install

# Install Homebrew if not installed
if test ! $(which brew); then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew updat

# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed
brew install gnu-tar
brew install gnu-indent
brew install gnu-which
brew install gnu-grep

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 5
brew install bash

PACKAGES=(
	ack
	autoconf
	automake
	boot2docker
	gettext
	git
	graphviz
    go
    heroku
	hub
	jq
	libjpeg
	markdown
    mas
	npm
	pkg-config
	postgresql
	python
    reattach-to-user-namespace
    ruby
    rust
	ssh-copy-id
	the_silver_searcher
	tmux
	tree
	vim
	wget
    zsh
	# ffmpeg
	# imagemagick
	# libmemcached 
	# memcached
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASK=(
    adobe-creative-cloud
    alfred
    canon-eos-utility
    cheatsheet
    docker
    firefox
    google-chrome
    haskell-for-mac
    iterm2
    mactex
    macvim
    malwarebytes
    spotify
    transmission
    vagrant
    vagrant-manager
    virtualbox
    visual-studio-code
    vlc

    qlcolorcode
    qlstephen
    qlmarkdown
    quicklook-json
    qlprettypatch
    quicklook-csv
    betterzip
    webquicklook
    suspicious-package
)

echo "Installing cask apps..."
brew cask install ${CASK[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-cascadia
    font-fira-code
    font-fontawesome
    font-inconsolata
    font-input
    font-montserrat
    font-roboto
    font-source-code-pro
    font-source-sans-pro
)

brew cask Install ${FONT[@]}

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    pipenv
)
sudo pip install ${PYTHON_PACKAGES[@]}

echo "Installing global npm packages..."
NPM_PACKAGES=(
    puppeteer
    safe-rm
)
npm install ${NPM_PACKAGES[@]}


echo "Cloning Prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Linking Prezto files..."
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
rm ~/.zpreztorc
