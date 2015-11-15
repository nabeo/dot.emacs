;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; last update is ....
;; Time-stamp: "Wed Aug 12 23:46:24 JST 2015"

(load "~/.emacs.d/emacs-my.el")

(cond (emacs22-p ;; Carbon Emacs用
       (load-safe "~/.emacs.d/emacs-carbon.el"))
      ;; ((featurep 'aquamacs) ;; Aquamacs用 -> 使えない
      ;;  (load-safe "~/.emacs.d/emacs-aquamacs.el")
      ;;  (load-safe "~/.emacs.d/emacs-cocoa.el")
      ((or emacs23-p emacs24-p emacs-bzr-p) ;; Cocoa Emacs用
       (load-safe "~/.emacs.d/emacs-cocoa.el")))

(global-font-lock-mode t)
