#!/usr/bin/env bash
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add path to .zshrc for (temporary) use
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc

# Install command-line tools using Homebrew.
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `gsed` .
brew install gnu-sed 
# Install a modern version of Bash.
brew install bash
brew install bash-completion@2

brew install git 

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget # --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim # --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
# brew install gs
brew install imagemagick # --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install tmux
# brew install vbindiff
# brew install zopfli

###################
# Custom packages #
###################

echo "Installing brew cask..."
brew tap homebrew/cask

# Development Languages 
brew install python3

# (more) Development Tools
echo "Installing development tools..."
brew install htop
brew install curl
brew install docker
brew install --cask docker # Docker-Desktop
brew install --cask visual-studio-code

# Virtualization
echo "Installing virtualization tools..."
brew install qemu
brew install --cask utm

# Web Tools
echo "Installing web tools..."
brew install node 
brew install nvm
brew install --cask firefox
brew install --cask google-chrome

# File Storage
echo "Installing file storage tools ..."
brew install --cask onedrive

# Communication Apps
echo "Installing communication apps..."
brew install --cask microsoft-outlook
brew install --cask slack
# brew install --cask telegram # try webapp instead
brew install --cask zoom

# General Utility Apps
echo "Installing general utility apps..."
# brew install --cask bitwarden # does not support fingerprint webintegration
brew install --cask authy
brew install --cask notion
brew install --cask scroll-reverser
brew install --cask rectangle
brew install --cask spotify 
brew install --cask karabiner-elements
# brew install --cask microsoft-onenote


# Brew install multiple apps in parallel


echo "Installing apps from App Store..."
brew install mas
mas install 1137397744 # Bitwarden, might require manual downlaod
# mas install 497799835 # XCode

echo "Please install if needed:" 
echo "DisplayLink Manager: https://www.synaptics.com/products/displaylink-graphics/downloads/macos"

# Remove outdated versions from the cellar.
brew cleanup

echo "Brew install complete!"