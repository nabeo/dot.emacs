;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/emacs-my.el")

(cond ((or emacs23-p emacs24-p emacs25-p emacs-bzr-p)
       (load-safe "~/.emacs.d/emacs-cocoa.el")))

(global-font-lock-mode t)
