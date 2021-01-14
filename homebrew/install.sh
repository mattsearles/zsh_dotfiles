#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

brew update
brew upgrade

brew install wget vim jenv grep openssh screen php ack git ssh-copy-id tree gcc gh p7zip telnet tree zlib zsh-syntax-highlighting

#ruby prerequisite
brew install autoconf automake gdbm gmp libksba libtool libyaml openssl pkg-config readline

# work apps
brew install liquibase maven@3.2 petere/postgresql/postgresql-common petere/postgresql/postgresql@13 tomcat@8

#ask for sudo password upfront
sudo -v
#Install applications via cask
# Apps
brew tap adoptopenjdk/openjdk
apps=(
	adoptopenjdk8
	aerial
	alfred
	appcleaner
	atom
	avast-security
	caffeine
	disk-inventory-x
	firefox
	google-chrome
	gitup
	handbrake
	iterm2
	microsoft-word
	microsoft-excel
	microsoft-powerpoint
	nordvpn
	opera
	pgadmin4
	skype
	spectacle
	slack
	springtoolsuite
	sublime-text
	textmate
	tibco-jaspersoft-studio
	vlc
	vagrant
	vagrant-manager
	virtualbox
	virtualbox-extension-pack
	whatsapp
	zoomus
)

echo "installing apps..."
brew cask install ${apps[@]}

brew tap homebrew/cask-fonts                    # you only have to do this once!

# fonts
fonts=(
  font-clear-sans
  font-roboto
  font-inconsolata
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# Remove outdated versions from the cellar.
brew cleanup

exit 0
