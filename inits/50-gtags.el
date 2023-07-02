;;; 50-gtags --- gnu-global
;;; Commentary:

;;; Code:
(use-package gtags
  :if (executable-find "gtags")
  :init
  ;; brew install global
  (add-to-list 'load-path (concat my/homebrew-prefix "/share/gtags/"))
  :hook
  (ruby-mode . gtags-mode)
  (kotlin-mode . gtags-mode)
  )

(provide '50-gtags)
;;; 50-gtags.el ends here
