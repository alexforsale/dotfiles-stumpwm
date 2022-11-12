;; from arch wiki
(set-prefix-key (kbd "s-SPC"))
(setf *mouse-focus-policy* :click)
(setf *run-or-raise-all-groups* t)
(setf *run-or-raise-all-screens* t)
(setf set-transient-gravity :center)

;; set groups
(run-commands "grename Term") ;; 1
(run-commands "gnewbg Dev") ;; 2
(run-commands "gnewbg Web") ;; 3
(run-commands "gnewbg Mail") ;; 4
(run-commands "gnewbg Media") ;; 5
(run-commands "gnewbg Remote") ;; 6
(run-commands "gnewbg Games") ;; 7
(run-commands "gnewbg Float") ;; 8
(run-commands "gnewbg Other") ;; 9


;; frame preferences
(clear-window-placement-rules)

(define-frame-preference "Term"
  (1 t t :class "XTerm")
  (1 t t :class "Termite")
  (1 t t :class "URxvt"))

(define-frame-preference "Dev"
  (2 t t :restore "emacs-editing-dump" :title "...xdvi")
  (2 t t :create "emacs-dump" :class "Emacs")
  (2 t t :class "code-oss")
  (2 t t :class "Gvim"))

(define-frame-preference "Mail"
  (3 t t :create "evolution-dump" :class "Evolution"))

(define-frame-preference "Web"
  (4 t t :create "nyxt-dump" :class "Nyxt")
  (4 t t :create "firefox-dump" :class "firefox"))

(define-frame-preference "Media"
  (5 t t :create "cheese-dump" :class "Cheese")
  (5 t t :create "spotify-dump" :class "Spotify")
  (5 t t :create "picard-dump" :class "Picard")
  (5 t t :create "mpv-dump" :class "mpv")
  (5 t t :create "vlc-dump" :class "vlc")
  (5 t t :create "hakuneko-dump" :class "hakuneko-desktop")
  (5 t t :create "gimp-dump" :class "Gimp"))

(define-frame-preference "Remote"
  (6 t t :create "virtmanager-dump" :class "Virt-manager")
  (6 t t :create "vncviewer-dump" :class "Vncviewer"))
