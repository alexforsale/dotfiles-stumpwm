;; from arch wiki
(setf *mouse-focus-policy* :click)
(setf *run-or-raise-all-groups* t)
(setf *run-or-raise-all-screens* t)
(setf set-transient-gravity :center)

;; set groups
(run-commands "grename term")
(run-commands "gnewbg dev")
(run-commands "gnewbg web")
(run-commands "gnewbg mail")
