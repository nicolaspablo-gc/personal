;;; personal-settings.el --- My personal settings.  -*- lexical-binding: t; -*-

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

;; Load bearing: defs.el must be loeaded first.

(with-eval-after-load 'org

  (add-to-list 'org-agenda-files (concat personal-docs-directory "tareas.org.gpg"))
  (add-to-list 'org-agenda-files (concat personal-docs-directory "bitacora.org.gpg"))
  (add-to-list 'org-agenda-files (concat personal-docs-directory "agenda.org.gpg"))

  (with-eval-after-load 'my-bindings
    (add-to-list 'org-todo-keyword-faces '("en_espera" . my-org-cancel-face))
    (add-to-list 'org-todo-keyword-faces '("bloqueado" . org-todo))
    (add-to-list 'org-todo-keyword-faces '("en__pausa" . my-org-wait-face ))
    (add-to-list 'org-todo-keyword-faces '("en__curso" . org-done))
    (add-to-list 'org-todo-keyword-faces '("terminado" . my-org-cancel-face))
    (add-to-list 'org-todo-keyword-faces '("cancelado" . my-org-cancel-face))))



(provide 'personal-settings)
;;; personal-settings.el ends here
