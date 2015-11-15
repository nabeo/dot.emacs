;; Last update is ....
;; Time-stamp: "Sat Jun 06 17:58:51 JST 2009"

(my-load-path "~/site-lisp/cocoa/yasnippet/plugins")
(require 'yasnippet-bundle)

(my-load-path "~/site-lisp/cocoa/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/site-lisp/cocoa/yasnippet/snippets")