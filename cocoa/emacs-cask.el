;; last update is ....
;; Time-stamp: "Thu Aug 13 00:12:17 JST 2015"

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq auto-mode-alist
      (append '(("Cask$" . emacs-lisp-mode)) auto-mode-alist))
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
