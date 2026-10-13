(defvar personal-emacs-directory (file-name-directory (file-truename (or load-file-name (buffer-file-name))))
  "Directory for my personal emacs settings.")

(add-to-list 'load-path personal-emacs-directory)

(let* ((env-main-emacs-dir (getenv "MY_MAIN_EMACS_DIR"))
       (main-early-init (and env-main-emacs-dir
                             (concat (file-name-as-directory env-main-emacs-dir)
                                     "early-init.el"))))
  (when main-early-init
    (load main-early-init)))
