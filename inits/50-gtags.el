;;; 50-gtags --- gnu-global
;;; Commentary:

;;; Code:
(use-package gtags
  :load-path "/usr/local/opt/global/share/gtags"
  :if (executable-find "gtags")
  :config
  ;; ruby-modeでgtags.elを使えるようにする
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (gtags-mode 1)))
  )

(provide '50-gtags)
;;; 50-gtags.el ends here
