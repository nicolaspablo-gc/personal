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

(defvar personal-tasks-file (concat personal-directory "docs/tareas.org.gpg")
  "File to task entries.")

(defun personal--time-stamp (&optional read-interactively inactive)
  "Get an org timestamp string.
If READ-INTERACTIVELY is non-nil, the user will be prompted for a time
string.  If INACTIVE is non-nil, the timestamp will be created as an
inactive one."
  (with-temp-buffer
    (if read-interactively
        (org-time-stamp t inactive)
      (org-insert-time-stamp nil t inactive))))

(defun personal--read-string (prompt)
  "Reads a string with my defaults."
  (with-temp-buffer
    (set-input-method "spanish-prefix")
    (read-string prompt nil nil nil t)))

(defmacro personal--with-file (file &rest forms)
  "Execute FORMS within FILE's buffer, saving the result."
  (declare (indent defun))
  `(with-current-buffer (find-file-noselect ,file)
     ,@forms
     (save-buffer)))

(defun personal--update-agenda-buffers ()
  "Update all org agenda buffers."
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (derived-mode-p 'org-agenda-mode)
        (org-agenda-redo-all)))))

(defun personal-add-log (&optional prompt-date)
  "Add a log entry to `personal-log-file'."
  (interactive "P")
  (personal--with-file personal-log-file
    (end-of-buffer)
    (insert
     (format "* %s %s\n"
             (personal--time-stamp prompt-date)
             (personal--read-string "Log: ")))
    (org-set-tags-command))
  (personal--update-agenda-buffers))

(defun personal-add-task ()
  (interactive)
  (personal--with-file personal-tasks-file
    (end-of-buffer)
    (insert (format "\n* HACER %s %s"
                    (personal--time-stamp nil t)
                    (personal--read-string "Tarea: ")))
    (org-set-tags-command)
    (org-set-property "CATEGORY" nil)
    (end-of-buffer)
    (insert "\n\n"))
  (personal--update-agenda-buffers))

(defun personal-project-list ()
  "List of personal projects."
  (interactive)
  (org-tags-view nil "CATEGORY=\"proyecto\""))

(provide 'personal-commands)
;;; personal-commands.el ends here
