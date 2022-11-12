;; keybinding
;; top map
(define-key *top-map* (kbd "s-TAB") "gother")
(define-key *top-map* (kbd "s-d") "exec rofi-menu")
(define-key *top-map* (kbd "s-w") "exec rofi -show windowcd -theme themes/stump.rasi")
(define-key *top-map* (kbd "s-W") "exec rofi -show window -theme themes/stump.rasi")
(define-key *top-map* (kbd "M-TAB") "other")
(define-key *top-map* (kbd "s-RET") "exec $TERMINAL")

;; next/prev frame
(define-key *top-map* (kbd "s-[") "fprev")
(define-key *top-map* (kbd "s-]") "fnext")

;; focus
(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-j") "move-focus down")
(define-key *top-map* (kbd "s-k") "move-focus up")
(define-key *top-map* (kbd "s-l") "move-focus right")

;; split
(define-key *top-map* (kbd "s-s") "hsplit")
(define-key *top-map* (kbd "s-v") "vsplit")
(define-key *top-map* (kbd "s-X") "remove-split")

;; root map
;; after prefix-key
;;(define-key *root-map* (kbd "s") "stump-slynk")
(define-key *root-map* (kbd "s-s") "stump-slynk")

;; groups
(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")
(define-key *top-map* (kbd "s-3") "gselect 3")
(define-key *top-map* (kbd "s-4") "gselect 4")
(define-key *top-map* (kbd "s-5") "gselect 5")
(define-key *top-map* (kbd "s-6") "gselect 6")
(define-key *top-map* (kbd "s-7") "gselect 7")
(define-key *top-map* (kbd "s-8") "gselect 8")
(define-key *top-map* (kbd "s-9") "gselect 9")
(define-key *top-map* (kbd "s-0") "gselect 0")
(define-key *top-map* (kbd "s-!") "gmove 1")
(define-key *top-map* (kbd "s-@") "gmove 2")
(define-key *top-map* (kbd "s-#") "gmove 3")
(define-key *top-map* (kbd "s-$") "gmove 4")
(define-key *top-map* (kbd "s-%") "gmove 5")
(define-key *top-map* (kbd "s-^") "gmove 6")
(define-key *top-map* (kbd "s-&") "gmove 7")
(define-key *top-map* (kbd "s-*") "gmove 8")
(define-key *top-map* (kbd "s-(") "gmove 9")
(define-key *top-map* (kbd "s-)") "gmove 0")

(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec pactl -- set-sink-volume @DEFAULT_SINK@ -2%")
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec pactl -- set-sink-volume @DEFAULT_SINK@ +2%")
(define-key *top-map* (kbd "XF86AudioMute") "exec pactl -- set-sink-mute @DEFAULT_SINK@ toggle")

(define-key *top-map* (kbd "XF86AudioPlay") "exec playerctl play-pause")
(define-key *top-map* (kbd "XF86AudioNext") "exec playerctl next")
(define-key *top-map* (kbd "XF86AudioPrev") "exec playerctl previous")

(define-key *top-map* (kbd "Print") "exec flameshot gui")

(define-key *top-map* (kbd "XF86MonBrightnessDown") "exec brightnessctl set 1%-")
(define-key *top-map* (kbd "XF86MonBrightnessUp") "exec brightnessctl set +1%")

(define-key *top-map* (kbd "s-F2") "exec picom-trans -c -5")
(define-key *top-map* (kbd "s-F3") "exec picom-trans -c +5")

(define-key *top-map* (kbd "s-quoteleft") "send-raw-key")
