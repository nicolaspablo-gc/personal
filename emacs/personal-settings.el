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

;;;; Variables

(setq telega-use-docker t)
(setq native-comp-jit-compilation-deny-list '("/lisp/org/"))

(setq tab-bar-icons-alist
      (cond ((display-graphic-p)
             (alist
              "personal" "🐌"
              "books" "📚"
              "cc" "💺"
              "nbox" "🔌"
              "onedrive" "☁️"
              "ytb" "▶️"
              "bible" "📖"
              "krp" "📋"
              "emacs" "🐃"
              "not[ae]s" "🗒️"
              "ford" "🚐"
              "nico" "🐌"
              "nyquist" "🌝"
              "paneles" "📊"
              "crea-scripts\\|cscripts" "🔨"
              "chat\\|telega\\|fran" "🗨️"
              "maslow" "👥"
              "gauss" "📐"
              "ediff" "🔛"
              "scv" "🛸"
              "sessions" "🛸"
              "nexus" "🌀"
              "unshared" "🔒"
              "ssh" "💻"
              "wiki" "📚"
              "kepler" "📊"
              "crea" "💡"
              "conf\\|cfg" "⚙️"))
            (t
             (alist
              "emacs" "w"
              "chat" "*"
              ".*" "T"))))

(setq org-agenda-files
      (mapcar (lambda (file) (concat personal-docs-directory file))
              '("agenda.org.gpg"
                "bitacora.org.gpg"
                "compras.org.gpg"
                "proyectos.org.gpg"
                "tareas.org.gpg")))

(setq org-agenda-category-icon-alist
      (seq-map (lambda (pair) (list (car pair) `(display ,(cdr pair))))
               (alist "crea" "💡"
                      "compra" "🛍️"
                      "proyecto" "📔"
                      ".*" "📋")))

;;;; Hooks

(with-eval-after-load 'org

  (add-to-list 'org-agenda-files (concat personal-docs-directory ))
  (add-to-list 'org-agenda-files (concat personal-docs-directory ))
  (add-to-list 'org-agenda-files (concat personal-docs-directory ))

  (with-eval-after-load 'my-bindings
    (add-to-list 'org-todo-keyword-faces '("EN_ESPERA" . my-org-cancel-face))
    (add-to-list 'org-todo-keyword-faces '("BLOQUEADO" . ORG-todo))
    (add-to-list 'org-todo-keyword-faces '("EN__PAUSA" . my-org-wait-face ))
    (add-to-list 'org-todo-keyword-faces '("EN__CURSO" . org-done))
    (add-to-list 'org-todo-keyword-faces '("TERMINADO" . my-org-cancel-face))
    (add-to-list 'org-todo-keyword-faces '("CANCELADO" . my-org-cancel-face))))

(provide 'personal-settings)
;;; personal-settings.el ends here
