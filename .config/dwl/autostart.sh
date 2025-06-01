# 自动启动的程序和脚本
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
waypaper --restore
fcitx5 -d
wl-clip-persist --clipboard regular --all-mime-type-regex '(?i)^(?!image/x-inkscape-svg).+' &
wl-paste --watch cliphist store &
wl-paste --watch pkill -RTMIN+9 waybar &
nm-applet &

arr=("waybar &")

for value in ${arr[@]}; do
  if [[ ! $(pgrep ${value}) ]]; then
    exec "$value" &
  fi
done
