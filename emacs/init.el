(defvar personal-emacs-directory (file-name-directory (or load-file-name (buffer-file-name)))
  "Directory for my personal emacs settings.")

(add-to-list 'load-path personal-emacs-directory)
(require 'personal-defs)
(require 'personal-settings)
(require 'personal-commands)
