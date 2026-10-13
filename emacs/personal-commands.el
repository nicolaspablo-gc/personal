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
  "File to add log entries.")

(defvar personal-agenda-file (concat personal-directory "docs/agenda.org.gpg")
  "File to add agenda (scheduled) entries.")

(defun personal-org-add-time-entry (file &optional current-date-time)
  "Add a time entry at the end of org file FILE.
Don't prompt for time and use current date+time when CURRENT-DATE-TIME
is non-nil."
  (with-current-buffer (find-file-noselect file)
    (set-input-method "spanish-prefix")
    (end-of-buffer)
    (insert
     (format "* %s %s\n"
             (with-temp-buffer
               ;; Don't create inactive timestamps.  Active timestamps
               ;; have the ability to show up in your agenda.  Its
               ;; very useful to see at a glance all the things you
               ;; did on x date.
               (if current-date-time
                   (org-insert-time-stamp nil :with-hm)
                 (org-time-stamp t)))
             (read-string "Log: " nil nil nil t)))
    (org-set-tags-command)
    (save-buffer)))

(defun personal-add-log (&optional prompt-date)
  "Add a log entry to `personal-log-file'."
  (interactive "P")                     ;
  (personal-org-add-time-entry personal-log-file (not prompt-date)))

(defun personal-add-agenda ()
  "Add an agenda entry to `personal-agenda-file'"
  (interactive)
  (personal-org-add-time-entry personal-agenda-file))


(provide 'personal-commands)
;;; personal-commands.el ends here
