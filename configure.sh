echo "Configuring OSX..."
# Credit: https://github.com/codeinthehole
# Resources:
# https://gist.github.com/codeinthehole/26b37efa67041e1307db

# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Configuring git..."
read -p "Git Name: " name
read -p "Git Email: " email
git config --global user.name "$name"
git config --global user.email "$email"
git config --global core.excludesfile '~/.gitignore'
