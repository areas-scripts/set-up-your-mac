#!/bin/bash

# to make this executable:
# chmod +x set-up-mac.sh

# =============================================
# Prompt the User and Run Commands (a Function)
# =============================================
prompt_and_run () {
  while :
  do
    # prompt
    echo "$1"
    echo -n "y/n(skip): "
    # capture the answer
    read -r answer
    # use the answer to run the commands or skip
    shopt -s nocasematch
    case $answer in
      "y" | "yes" )
        shopt -u nocasematch
        commands
        break
        ;;
      "n" | "no" | "skip")
        shopt -u nocasematch
        break
        ;;
      *)
        echo "Sorry, I didn’t catch that."
        ;;
    esac
  done
}

# ====================================
# Install Command Line Tools for Xcode
# ====================================
commands () {
  echo "Installing Command Line Tools for Xcode..."
  xcode-select --install
}
prompt_and_run "Do you want to install Command Line Tools for Xcode?"

# ================
# Install Homebrew
# ================
commands () {
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew tap homebrew/cask-versions
  brew tap homebrew/cask-drivers
  brew tap homebrew/cask-fonts
}
prompt_and_run "Do you want to install Homebrew?"

# =====================
# Install App Store CLI
# =====================
commands () {
  echo "Installing the App Store CLI..."
  brew install mas
}
prompt_and_run "Do you want to install the App Store CLI?"

# ===============================
# Install Apps from the App Store
# ===============================
# 640199958   Apple Developer
# 937984704   Amphetamine
# 1055511498  Day One
# 1482920575  DuckDuckGo Privacy Essentials
# 424389933   Final Cut Pro
# 682658836   GarageBand
# 775737590   iA Writer
# 408981434   iMovie
# 409183694   Keynote
# 462058435   Microsoft Excel
# 462054704   Microsoft Word
# 409203825   Numbers
# 1474884867  Orchid
# 409201541   Pages
# 967805235   Paste
# 803453959   Slack
# 1176895641  Spark
# 1153157709  Speedtest
# 1496833156  Swift Playgrounds
# 1147396723  WhatsApp
# 497799835   Xcode
commands () {
  echo "Installing App Store apps..."
  mas install \
    640199958 \
    937984704 \
    409183694 \
    409203825 \
    409201541 \
    1055511498 \
    1482920575 \
    424389933 \
    682658836 \
    775737590 \
    408981434 \
    462058435 \
    462054704 \
    1474884867 \
    967805235 \
    803453959 \
    1176895641 \
    1153157709 \
    1496833156 \
    1147396723 \
    497799835
}
prompt_and_run "Do you want to install App Store apps?"

# ===============================
# Install Apps from Homebrew Cask # todo: deal with case where apps already installed by other means (i.e. not with brew)
# ===============================
commands () {
  echo "Installing Homebrew Cask apps..."
  brew install --cask \
    appcleaner \
    brave-browser \
    discord \
    elgato-control-center \
    firefox \
    google-chrome \
    itsycal \
    karabiner-elements \
    microsoft-teams \
    qmk-toolbox \
    safari-technology-preview \
    stoplight-studio \
    via \
    visual-studio-code \
    zoom
}
prompt_and_run "Do you want to install Homebrew Cask apps?"

# ===================
# Download Other Apps
# ===================
commands () {
  echo "Downloading other apps..."
  brew install wget
  wget -P ~/Downloads https://software.vc.logitech.com/downloads/tune/LogiTuneInstaller.dmg
  open ~/Downloads/LogiTuneInstaller.dmg
}
prompt_and_run "Do you want to download other apps?"

# =============
# Configure git
# =============
commands () {
  echo "Configuring git..."
  git config --global init.defaultBranch main
  git config --global user.name "Christian Areas"
  git config --global user.email me@areas.me
  git config -l
}
prompt_and_run "Do you want to configure git?"

# ==================
# Install GitHub CLI
# ==================
commands () {
  echo "Installing GitHub CLI..."
  brew install gh
}
prompt_and_run "Do you want to install GitHub CLI"

# ================
# Configure GitHub
# ================
commands () {
  echo "Configuring GitHub..."
  ssh-keygen -t ed25519 -C "$(whoami)@$(hostname -s)"
  eval "$(ssh-agent -s)"
  cp files/config ~/.ssh/config
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
  gh ssh-key add ~/.ssh/id_ed25519.pub
}
prompt_and_run "Do you want to configure GitHub?"

# ===========
# Install NVM
# ===========
commands () {
  echo "Installing NVM..."
  brew install nvm
  mkdir ~/.nvm
  cp files/.zshrc ~/.zshrc
}
prompt_and_run "Do you want to install NVM?"

# ==============
# Install Gatsby
# ==============
commands () {
  echo "Installing Gatsby..."
  npm install -g gatsby-cli
}
prompt_and_run "Do you want to install Gatsby?"

# =============
# Install Fonts
# =============
commands () {
  echo "Installing fonts..."
  brew install --cask \
    font-sf-pro \
    font-sf-compact \
    font-sf-mono \
    font-sf-arabic \
    font-new-york \
    font-ia-writer-duo \
    font-ia-writer-duospace \
    font-ia-writer-mono \
    font-ia-writer-quattro
}
prompt_and_run "Do you want to install fonts?"

# ===============
# Configure macOS
# ===============
echo "===================="
echo "Configuring macOS..."
echo "===================="

# Dock
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "tilesize" -int "64"
defaults write com.apple.dock "largesize" -int "128"
defaults write com.apple.dock "autohide-delay" -float "0.25"
defaults write com.apple.dock "autohide-time-modifier" -float "0.25"
defaults write com.apple.dock "mineffect" -string "scale"

# Restart Dock and Finder
killall Dock Finder

# =====
# Done!
# =====
echo "Fin"
