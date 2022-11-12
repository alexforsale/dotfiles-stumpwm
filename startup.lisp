;; startup commands
(when *initializing*
  (progn
    (run-shell-command "~/.fehbg ")
    (run-shell-command "wal -R")
    (run-shell-command "xrdb merge ~/.Xresources")
    (run-shell-command "xsetroot -cursor_name left_ptr")
    (run-shell-command "xset r rate 300 30")
    (run-shell-command "nm-applet")
    (run-shell-command "iwgtk -i")
    (run-shell-command "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    (run-shell-command "picom")
    (run-shell-command "udiskie -t")
    (run-shell-command "dunst -conf ~/.config/dunst/dunstrc")
    (run-shell-command "blueman-applet")
    (run-shell-command "xsettingsd")
    (run-shell-command "unclutter")
    (run-shell-command "/usr/lib/geoclue-2.0/demos/agent")
    (which-key-mode)))