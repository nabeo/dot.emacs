;; Last update is ....
;; Time-stamp: "Sat Mar 16 23:46:37 JST 2013"

;; https://github.com/magit/magit
;; how-to install
;; make EMACS=~/Applications/Emacs-current.app/Contents/MacOS/Emacs PREFIX=~/tmp/magit SYSCONFDIR=~/tmp/magit install_all
;; cp -p PREFIX/share/info/magit.info ~/Applications/Emacs-current.app/Contents/Resources/info 
;; install-info --info-dir=~/Applications/Emacs-current.app/Contents/Resources/info ~/Applications/Emacs-current.app/Contents/Resources/info/magit.info

;; http://philjackson.github.com/magit/index.html

;; (my-load-path "~/site-lisp/cocoa/magit")
(autoload 'magit-status "magit" nil t)
