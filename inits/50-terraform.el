;;; 50-terraform --- terraform-mode
;;; Commentary:

;;; Code:
(use-package terraform-mode
  :ensure t
  :hook
  (terraform-mode . terraform-format-on-save-mode)
  )

;;; 50-terrafrom ends here
