;; last update is ....
;; Time-stamp: "Mon Mar 15 19:24:01 JST 2010"
(my-load-path "~/site-lisp/cocoa/auto-install")
(require 'auto-install)

;; auto-install.elでインストールするelispファイルを格納するディレクトリ
(setq auto-install-directory "~/site-lisp/cocoa/auto-install/")

(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)