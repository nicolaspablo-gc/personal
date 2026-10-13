(defvar personal-emacs-directory (file-name-directory (file-truename (or load-file-name (buffer-file-name))))
  "Directory for my personal emacs settings.")

(add-to-list 'load-path personal-emacs-directory)

(let ((public-early-init (concat personal-emacs-directory "public/early-init.el")))
  (when (file-exists-p public-early-init)
    (load public-early-init)))
