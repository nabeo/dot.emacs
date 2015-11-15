;; Last update is ....
;; Time-stamp: "Sat Jan 19 21:13:22 JST 2013"
(require 'gtags)
(setq exec-path (cons "~/local/gtags/bin" exec-path))

;; ruby-modeでgtags.elを使えるようにする
(add-hook 'ruby-mode-hook
          '(lambda ()
             (gtags-mode 1)))
