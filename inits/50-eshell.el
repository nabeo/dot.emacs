;;; 50-eshell --- eshell-mode
;;; Commentary:

;;; Code:
(use-package eshell
  :config
  (setq eshell-ask-to-save-last-dir 'always)
  (setq eshell-hist-ignoredups t)
  (setq eshell-cmpl-ignore-case t)
)

(provide '50-eshell)
;;; 50-eshell.el ends here
