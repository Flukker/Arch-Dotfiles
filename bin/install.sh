#!/bin/bash

# Функция для проверки и установки пакетов
install_if_not_installed() {
  if ! pacman -Qi $1 &> /dev/null; then
    echo "Устанавливаем $1..."
    sudo pacman -S $1 --noconfirm
  else
    echo "$1 уже установлен."
  fi
}

# Функция для установки пакетов через yay
install_yay_package_if_not_installed() {
  if ! pacman -Qi $1 &> /dev/null; then
    echo "Устанавливаем $1 через yay..."
    yay -S $1 --noconfirm
  else
    echo "$1 уже установлен."
  fi
}

# Обновляем систему
sudo pacman -Syu --noconfirm

# Установка git
install_if_not_installed "git"

# Установка Kitty
install_if_not_installed "kitty"

# Установка Swaybg
install_if_not_installed "swaybg"

# Установка Rofi
install_if_not_installed "rofi"

# Установка Waybar
install_if_not_installed "waybar"

# Установка Nwg-look
install_if_not_installed "nwg-look"

# Установка Btop
install_if_not_installed "btop"

# Установка Zed
install_if_not_installed "zed"

# Установка FZF
install_if_not_installed "fzf"

# Установка ZSH
install_if_not_installed "zsh"

# Установка Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Устанавливаем Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh уже установлен."
fi

# Установка Yazi
install_if_not_installed "yazi"

# Установка Zoxide
install_if_not_installed "zoxide"

# Установка Tmux
install_if_not_installed "tmux"

# Установка Neofetch
install_if_not_installed "neofetch"

# Установка Neovim
install_if_not_installed "neovim"

# Установка Telegram
install_if_not_installed "telegram-desktop"

# Установка Chromium
install_if_not_installed "chromium"

# Установка yay (если не установлен)
if ! command -v yay &> /dev/null; then
  echo "Устанавливаем yay..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay уже установлен."
fi

# Установка Zen Browser через yay
install_yay_package_if_not_installed "zen-browser-bin"

echo "Установка завершена!"

