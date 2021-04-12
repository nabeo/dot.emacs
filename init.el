;; customize file for cocoa emacs

(global-unset-key (kbd "C-z"))

;; user-emacs-directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; (require 'cl) を使っているときに `Package cl is deprecated' の警告を出さない
(setq byte-compile-warnings '(not cl-functions obsolete))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file (expand-file-name
                   (concat user-emacs-directory "my-customize.el")))
(load custom-file)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-refresh-contents)

(use-package s
  :ensure t)
(use-package use-package)
(use-package init-loader
  :ensure t
  :config
  (setq init-loader-show-log-after-init nil)
  (init-loader-load "~/.emacs.d/inits"))

(global-font-lock-mode t)
