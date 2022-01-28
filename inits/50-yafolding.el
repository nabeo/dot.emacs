;;; 50-yafolding --- yafolding-mode
;;; Commentary:

;;; Code:
(use-package yafolding
  :ensure t
  :hook
  (prog-mode . yafolding-mode)
  (markdown-mode . yafolding-mode)
  )

;;; 50-yafolding.el ends here
