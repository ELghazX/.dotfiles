![desktop](.assets/Screenshot_2025-07-02_22-56-23.png)
# 🛠️ ElghazX's Dotfiles

Konfigurasi sistem Linux milik pribadi yang digunakan di **CachyOS** dengan window manager **Hyprland**. Setup ini awalnya berbasis dari proyek [ml4w (My Linux 4 Work)](https://github.com/my-linux/my-linux-4-work), lalu dimodifikasi sesuai dengan preferensiku sendiri.

---

## ✨ Fitur Utama

- ✅ Berbasis **CachyOS** (Arch-based, optimized performance)
- ✅ Menggunakan **Hyprland** (dynamic tiling Wayland WM)
- ✅ Tema otomatis berdasarkan wallpaper (`matugen`, `wallust`)
- ✅ Launcher cantik pakai `rofi`
- ✅ Bar minimalis dengan `waybar`
- ✅ Terminal: `kitty` + `starship`
- ✅ Editor utama: `neovim` dengan plugin-plugin pilihan
- ✅ Shell: `fish`
- ✅ Notification: `dunst` + `swaync`

---

## 🧰 Komponen dalam Dotfiles

Berikut beberapa direktori penting dalam repo ini:

.config/
├── hypr/ → konfigurasi Hyprland
├── rofi/ → launcher dengan tema custom
├── waybar/ → bar informasi untuk Hyprland
├── dunst/ → notifikasi ringan
├── swaync/ → notification center modern
├── starship/ → prompt shell universal
├── kitty/ → terminal dengan GPU acceleration
├── mpv/ → media player config
├── nvim/ → Neovim setup (Lua-based)
├── fish/ → shell config
├── matugen/ → auto theme generator dari wallpaper
├── wallust/ → sinkronisasi warna tema UI
├── qt6ct/ → konfigurasi tampilan Qt apps
├── wl-gout/ → logout GUI
├── wal/ → template untuk wal
└── ...

---

## 🚀 Setup dari Awal

### 1. Persiapan Sistem

Install CachyOS (atau distro Arch-based lainnya seperti Arch, EndeavourOS, Manjaro). Setelah sistem terpasang:
```bash
sudo pacman -Syu
```

Pastikan kamu sudah menginstal package dasar
```bash
sudo pacman -S git base-devel
```
### 2. Clone Dotfiles
```bash
git clone https://github.com/ElghazX/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```
### 3. Install Dependencies
```bash
# Paket utama
sudo pacman -S hyprland kitty waybar rofi dunst fish starship mpv neovim qt6ct wl-clipboard grim slurp

# AUR (gunakan paru atau yay)
paru -S matugen wallust swaync waypaper
```

### 4. Salin atau Symlink Config
```bash
sudo pacman -S stow 
```
Kemudian pakai stow untuk mengelola package
```bash
stow hypr rofi waybar dunst swaync starship kitty mpv nvim fish matugen wallust qt6ct wlougout wal
```

### 5. Ganti shell ke Fish (opsional)
```bash
chsh -s /bin/fish
```

## 🖼️ Tema & Wallpaper
- Wallpaper dikontrol menggunakan waypaper
- Tema warna otomatis menggunakan matugen + wallust
- Notifikasi ditangani swaync dan dunst
- Tampilan Qt diatur melalui qt6ct

## 🔧 Tips Tambahan
- Jika bar tidak muncul → pastikan waybar dijalankan dari autostart Hyprland
- Jika tema tidak berubah otomatis → cek apakah matugen dan wallust terpasang dan dipanggil di script wallpaper
- Tambahkan ~/.config/hypr/autostart.conf jika perlu script startup
