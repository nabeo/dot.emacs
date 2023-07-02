;;; 50-gtags --- gnu-global
;;; Commentary:

;;; Code:
(use-package gtags
  ;; brew install global
  :load-path (expand-file-name (concat my/homebrew-prefix "/share/gtags"))
  :if (executable-find "gtags")
  :config
  ;; ruby-modeでgtags.elを使えるようにする
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (gtags-mode 1)))
  ;; kotlin-mode で gtags.el を使う
  (add-hook 'kotlin-mode-hook
            '(lambda ()
               (gtags-mode 1)))
  )

(provide '50-gtags)
;;; 50-gtags.el ends here
