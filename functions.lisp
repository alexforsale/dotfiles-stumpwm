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
