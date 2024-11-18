;;; 50-yafolding --- yafolding-mode
;;; Commentary:

;;; Code:
(use-package yafolding
  :ensure t
  :hook
  (prog-mode . yafolding-mode)
  (markdown-mode . yafolding-mode)
  (yaml-ts-mode . yafolding-mode)
  (yaml-mode . yafolding-mode)
  )

;;; 50-yafolding.el ends here
