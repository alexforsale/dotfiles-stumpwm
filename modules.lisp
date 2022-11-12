(let ((module-dir
        (or (probe-file "/usr/share/stumpwm/contrib")
            (probe-file "/usr/local/share/stumpwm/contrib")
            (probe-file (merge-pathnames ".local/share/stumpwm/contrib"
                                         (user-homedir-pathname)))
            (probe-file (merge-pathnames ".config/stumpwm/modules"
                                         (user-homedir-pathname))))))
  (set-module-dir module-dir))
