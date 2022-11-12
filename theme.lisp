;; font
(ql:quickload :clx-truetype)
(ql:quickload :ttf-fonts)

(setf xft:*font-dirs* `("/usr/share/fonts/"
                        "/usr/local/share/fonts"
                        ,(merge-pathnames ".local/share/fonts"
                                          (user-homedir-pathname))))
(set-font (make-instance 'xft:font :family "Fira Code" :subfamily "Regular" :size 8))

;; colors
(defvar default-colors
  '("#263238"
    "#EC5F67"
    "#8BD649"
    "#FFCC00"
    "#89DDFF"
    "#82AAFF"
    "#80CBC4"
    "#CDD3DE"
    "#707880"
    "#EC5F67"
    "#8BD649"
    "#FFCC00"
    "#89DDFF"
    "#82AAFF"
    "#80CBC4"
    "#FFFFFF"))
(defvar wal-colors-path "~/.cache/wal/colors")

(defun get-color-palette ()
  "Read colors from wal cache file or from `default-colors'."
  (let ((wal-colors (when (probe-file wal-colors-path)
                      (uiop:read-file-lines wal-colors-path))))
    (or wal-colors default-colors)))

(defun get-color (name)
  "Map the colors from `get-color-palette'."
  (let ((colors (mapcar 'cons
                        '("color0"
                          "color1"
                          "color2"
                          "color3"
                          "color4"
                          "color5"
                          "color6"
                          "color7"
                          "color8"
                          "color9"
                          "color10"
                          "color11"
                          "color12"
                          "color13"
                          "color14"
                          "color15")
                        (get-color-palette))))
    (cdr (assoc name colors :test 'equal))))

(setf *background* (get-color "color0"))
(setf *foreground* (get-color "color7"))
(setf *color0* (get-color "color0"))
(setf *color1* (get-color "color1"))
(setf *color2* (get-color "color2"))
(setf *color3* (get-color "color3"))
(setf *color4* (get-color "color4"))
(setf *color5* (get-color "color5"))
(setf *color6* (get-color "color6"))
(setf *color7* (get-color "color7"))
(setf *color8* (get-color "color8"))
(setf *color9* (get-color "color9"))
(setf *color10* (get-color "color10"))
(setf *color11* (get-color "color11"))
(setf *color12* (get-color "color12"))
(setf *color13* (get-color "color13"))
(setf *color14* (get-color "color14"))
(setf *color15* (get-color "color15"))

(setq *colors*
      `(,*color0* ,*color1* ,*color2* ,*color3* ,*color4* ,*color5* ,*color6* ,*color7* ,*color8* ,*color9*))

(update-color-map (current-screen))
(set-fg-color *color7*)
(set-bg-color *color0*)
(set-border-color *color2*)
(set-focus-color *color3*)
(set-unfocus-color *color3*)
(set-float-focus-color *color3*)
(set-float-unfocus-color *color3*)
(setf *key-seq-color* *color3*)
