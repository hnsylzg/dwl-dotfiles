# 自动启动的程序和脚本
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
waypaper --restore
fcitx5 -d
wl-clip-persist --clipboard regular --all-mime-type-regex '(?i)^(?!image/x-inkscape-svg).+' &
wl-paste --watch cliphist store &
wl-paste --watch pkill -RTMIN+9 waybar &
nm-applet &
swayidle -w timeout 300 'swaylock -f -c 000000 --show-failed-attempts --fade-in 0.2 --grace 2 --grace-no-mouse --effect-vignette 0.5:0.5 --effect-blur 7x5 --ignore-empty-password --screenshots --clock' timeout 600 'wlr-randr --output Virtual-1 --off' resume 'wlr-randr --output Virtual-1 --on' timeout 900 'systemctl suspend' &
foot --server &
thunar --daemon &
playerctld daemon

arr=("waybar &")

for value in ${arr[@]}; do
  if [[ ! $(pgrep ${value}) ]]; then
    exec "$value" &
  fi
done
