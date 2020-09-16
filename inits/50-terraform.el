;;; 50-terraform --- terraform-mode
;;; Commentary:

;;; Code:
(use-package terraform-mode
  :ensure t
  :hook
  (terraform-mode . terraform-format-on-save-mode)
  )

(provide '50-terraform)
;;; 50-terraform ends here
