#!/bin/bash
set -e

echo "🌀 Hyprland Installer for Arch/EndeavourOS"
echo "-----------------------------------------"

# Не запускати скрипт як root
if [[ $EUID -eq 0 ]]; then
    echo "❌ Не запускай цей скрипт як root!"
    exit 1
fi

# Перевірка yay
if ! command -v yay &> /dev/null; then
    echo "📦 Встановлення yay (AUR helper)..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
fi

# Оновлення системи
echo "🔄 Оновлення системи..."
sudo pacman -Syu --noconfirm

# Встановлення пакетів
echo "📥 Встановлення основних пакетів..."
sudo pacman -S --noconfirm \
    hyprland kitty waybar rofi firefox fastfetch sddm swww

# Встановлення Spotify з AUR
echo "🎵 Встановлення Spotify..."
yay -S --noconfirm spotify

# Увімкнення дисплейного менеджера
echo "🔐 Увімкнення SDDM..."
sudo systemctl enable sddm.service

# Копіювання конфігу Kitty
echo "📝 Копіювання kitty.conf..."
mkdir -p ~/.config/kitty
cp "$(dirname "$0")/config/kitty/kitty.conf" ~/.config/kitty/kitty.conf

# Копіювання Waybar конфігів
echo "📝 Копіювання конфігів Waybar..."
mkdir -p ~/.config/waybar
cp "$(dirname "$0")/config/waybar/config.jsonc" ~/.config/waybar/config
cp "$(dirname "$0")/config/waybar/style.css" ~/.config/waybar/style.css
cp "$(dirname "$0")/config/waybar/rose-pine.css" ~/.config/waybar/rose-pine.css

# Копіювання шпалер
echo "🖼️ Встановлення шпалер..."
mkdir -p ~/Pictures/wallpapers
cp "$(dirname "$0")/assets/wallpaper/1.jpg" ~/Pictures/wallpapers/1.jpg

# Налаштування autostart шпалер
echo "🛠️ Налаштування autostart swww..."
mkdir -p ~/.config/hypr
if ! grep -q "swww init" ~/.config/hypr/hyprland.conf 2>/dev/null; then
    {
        echo ""
        echo "# Запуск swww для встановлення шпалер"
        echo "exec-once = swww init && sleep 0.5 && swww img ~/Pictures/wallpapers/1.jpg"
    } >> ~/.config/hypr/hyprland.conf
fi

# Додавання fastfetch до .bashrc (опціонально)
if ! grep -q "fastfetch" ~/.bashrc; then
    echo "fastfetch" >> ~/.bashrc
fi

echo "✅ Установка завершена!"
echo "➡️ Перезавантаж комп'ютер та увійди через Hyprland."
