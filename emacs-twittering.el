;; last update is ....
;; Time-stamp: "Mon Dec 23 13:56:45 JST 2013"

;; (my-load-path "~/site-lisp/twitter-mode")
;; -> ~/local/emacs/site-lisp/twitter-mode

(require 'twittering-mode)
;; for debuggin (ignore certficate file)
;; (setq twittering-allow-insecure-server-cert t)

(setq twittering-use-master-password t)
(setq twittering-private-info-file "/Users/nabeo/Dropbox/emacs/twittering-mode/twittering-mode-oauth.gpg")

(auto-compression-mode t)
(setq twittering-icon-storage-file "/Users/nabeo/.emacs.d/twittering-mode/twittering-mode-icons.gz")
(setq twittering-use-icon-storage t)
