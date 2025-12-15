;;; 50-terraform --- terraform-mode
;;; Commentary:

;;; Code:
(use-package hcl-mode
  :ensure t
  :mode ("\\.hcl\\'" . hcl-mode)
  :custom (hcl-indent-level 2)
  :init
  (custom-set-variables
   '(ignored-local-variable-values '((hcl-indent-level . 4) (hcl-indent-level . 2))))
  )

(use-package terraform-mode
  :ensure t
  :hook
  (terraform-mode . terraform-format-on-save-mode)
  )

(provide '50-terraform)
;;; 50-terraform.el ends here
