;;; personal-commands.el --- My personal commands.   -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Nico

;; Author: Nico <nico@thinkpad-nico>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(defvar personal-log-file (concat personal-directory "docs/bitacora.org.gpg")
  "File to add entries by `personal-add-log'.")

(defun personal-add-log ()
  "Add a log entry to `personal-log-file'."
  (interactive)
  (with-current-buffer (find-file-noselect personal-log-file)
    (set-input-method "spanish-prefix")
    (end-of-buffer)
    (insert
     (format "* %s %s\n"
             (with-temp-buffer
               ;; Don't create inactive timestamps.  Active timestamps
               ;; have the ability to show up in your agenda.  Its
               ;; very useful to see at a glance all the things you
               ;; did on x date.
               (org-insert-time-stamp nil :with-hm))
             (read-string "Log: " nil nil nil t)))
    (org-set-tags-command)
    (save-buffer)))


(provide 'personal-commands)
;;; personal-commands.el ends here
