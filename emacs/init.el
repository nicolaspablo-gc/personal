(let ((public-init (concat personal-emacs-directory "public/init.el")))
  (when (file-exists-p public-init)
    (load public-init)))

(require 'personal-defs)
(require 'personal-settings)
(require 'personal-commands)
