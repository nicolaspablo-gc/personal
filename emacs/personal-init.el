(let* ((env-main-emacs-dir (getenv "MY_MAIN_EMACS_DIR"))
       (main-init (and env-main-emacs-dir
                       (concat (file-name-as-directory env-main-emacs-dir)
                               "init.el"))))
  (when main-init
    (load main-init)))

(require 'personal-defs)
(require 'personal-settings)
(require 'personal-commands)
