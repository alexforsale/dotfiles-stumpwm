(ql:quickload :xembed)
(load-module "stumptray")

(setf *window-format* "%m%n%s%c")
(setf *screen-mode-line-format* (list "[^B%n^b] %W^>%d"))
(setf *time-modeline-string* "%a %b %e %k:%M")
(setf *mode-line-timeout* 2)
(setf *mode-line-background-color* *background*)
(setf *mode-line-foreground-color* *foreground*)
(setf *mode-line-border-color* *color2*)
(setf *mode-line-border-width* 0)

(setf *screen-mode-line-format*
      (list
       "[^B^3%n^b] ^4%W"
       "^>"
       '(:eval (format nil "^5|Volume: ~D" (show-current-volume)))
       '(:eval (when (or (not (empty-directory-p "/sys/class/backlight")) (not (empty-directory-p "/dev/backlight"))) (format nil "^4|Backlight: ~D%" (show-brightness-value))))
       '(:eval (when (or (not (empty-directory-p "/sys/class/power_supply")) (not (eq 255 (parse-integer (remove #\Newline (run-shell-command "apm -l" t)))))) (format nil "^3|Battery:~D" (show-battery-charge))))
       '(:eval (when (or (not (empty-directory-p "/sys/class/power_supply")) (not (eq 255 (parse-integer (remove #\Newline (run-shell-command "apm -l" t)))))) (format nil " ~D" (show-battery-state))))
       "^5|%d"
       ))

(enable-mode-line (current-screen) (current-head) t)

(stumptray:stumptray)
