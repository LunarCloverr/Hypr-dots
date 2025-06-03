# 🌙 Hypr-dots — LunarCloverr's Hyprland Setup

Автоматизований скрипт встановлення [Hyprland](https://github.com/hyprwm/Hyprland) + готові конфіги та теми для Arch / EndeavourOS.  
Мета — максимально швидкий запуск естетичного та функціонального Wayland-десктопу з Waybar, Kitty, Rofi, Spotify та ін.

---

## 🔧 Що входить

| Компонент   | Призначення                                 |
|-------------|----------------------------------------------|
| Hyprland    | Wayland compositor                          |
| Waybar      | Статус-бар з кастомним конфігом та темою    |
| Kitty       | Термінал із кастомним `kitty.conf`          |
| Spotify     | AUR-версія плеєра Spotify                   |
| Firefox     | Браузер                                      |
| Rofi        | Лаунчер                                     |
| Fastfetch   | ASCII system info при запуску терміналу     |
| SDDM        | Login manager                                |
| swww        | Для анімованої зміни шпалер                 |

---

## 🖼️ Особливості

- 🎨 Темна палітра адаптована під шпалери
- 🪟 Waybar на лівому краю екрана з кастомною іконографікою
- 🎵 Spotify встановлюється з AUR автоматично
- 🧱 Структуровані конфіги з темами (`kitty`, `waybar`)
- 📷 Автоматичне встановлення шпалер із `assets/wallpaper/1.jpg`

---

## ⚙️ Встановлення

```bash
git clone https://github.com/LunarCloverr/Hypr-dots.git
cd Hypr-dots
chmod +x install.sh
./install.sh
