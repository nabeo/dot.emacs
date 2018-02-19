(use-package gtags
  :load-path "/opt/local/share/gtags"
  :if (executable-find "gtags")
  :config
  ;; ruby-modeでgtags.elを使えるようにする
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (gtags-mode 1)))
)
