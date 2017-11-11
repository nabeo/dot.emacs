(use-package gtags
  :config
  (setq exec-path (cons "~/local/gtags/bin" exec-path))

  ;; ruby-modeでgtags.elを使えるようにする
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (gtags-mode 1)))
)
