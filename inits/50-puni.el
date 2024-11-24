;;; 50-puni --- Structured editing
;;; Commentary:

;;; Code:
(use-package puni
  :ensure t
  :defer t
  :hook
  (prog-mode . puni-mode)
  ((yaml-mode yaml-ts-mode) . puni-mode)
  )

(provide '50-puni)
;;; 50-puni.el ends here
