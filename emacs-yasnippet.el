;; last update is ....
;; Time-stamp: "Thu Apr 16 17:26:41 JST 2009"

;;(add-hook 'yas/before-expand-snippet-hook
;;		  (lambda ()
;;			(pabbrev-mode-off)))

;;(add-hook 'yas/after-exit-snippet-hook
;;		  (lambda ()
;;			(pabbrev-mode-on)))

;; use php-mode with yasnippet
;; http://d.hatena.ne.jp/botchy/20080502/1209717204
(add-to-list 'yas/extra-mode-hooks
			 'php-mode-hook)
(add-to-list 'yas/extra-mode-hooks
			 'nxhtml-mode-hook)

(yas/initialize)