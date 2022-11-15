(require :slynk)
(let ((server-running nil))
  (defcommand stump-slynk () ()
    "Toggle the slynk server on/off"
    (if server-running
        (progn
          (slynk:stop-server 4004)
          (echo-string
           (current-screen)
           "stopping slynk.")
          (setf server-running nil)
          )
        (progn
          (slynk:create-server :port 4004
                               :dont-close t)
          (echo-string
           (current-screen)
           "starting slynk. M-x sly-connect RET 4004 then (in package stumpwm).")
          (setf server-running t)))))

(defun empty-directory-p (path)
  (and (null (directory (concatenate 'string path "/*")))
       (null (directory (concatenate 'string path "/*/")))))

(defparameter *os*
  (remove #\Newline
          (string-downcase
           (run-shell-command "uname -s" t)))
  "The currently running operating system in lowercase.")

(defun show-battery-charge ()
  (cond ((string= "freebsd" *os*)
         (let ((raw-battery
                 (remove
                  #\Newline
                  (run-shell-command "apm -l" t))))
           (format nil "~D%" raw-battery)))
        ((string= "linux" *os*)
         (let ((raw-battery
                 (run-shell-command
                  "acpi | cut -d, -f2" t)))
           (substitute #\Space #\Newline raw-battery)))))

(defun show-battery-state ()
  (cond ((string= "freebsd" *os*)
         (let ((ac-status
                 (remove
                  #\Newline
                  (run-shell-command
                   "apm -a" t))))
           (cond ((equal "0" ac-status)
                  (format nil "Discharging"))
                 ((equal "1" ac-status)
                  (format nil "Charging"))
                 ((equal "2" ac-status)
                  (format nil "Backup Power")))))
        ((string= "linux" *os*)
         (let ((raw-battery
                 (run-shell-command
                  "acpi | cut -d: -f2 | cut -d, -f1" t)))
           (substitute #\Space #\Newline raw-battery)))))

(defun show-brightness-value ()
  (cond ((string= "freebsd" *os*)
         (let ((current-brightness
                 (remove
                  #\Newline
                  (run-shell-command
                   "backlight |sed 's/.*: //'" t))))
           (format nil "~A%" current-brightness)))
        ((string= "linux" *os*)
         (let ((max-brightness
                 (parse-integer
                  (run-shell-command
                   "brightnessctl max" t)))
               (current-brightness
                 (parse-integer
                  (run-shell-command
                   "brightnessctl get" t))))
           (floor (* (/ current-brightness max-brightness) 100))))))

(defun show-current-volume ()
  (let ((current-volume
          (run-shell-command "amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g'" t)))
    (substitute #\Space #\Newline current-volume)))
