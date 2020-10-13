;;; 50-yaml --- yaml-mode
;;; Commentary:

;;; Code:
(use-package yaml-mode
  :ensure t
  :init
  :config
  ;; https://www.emacswiki.org/emacs/CfnLint
  (define-derived-mode cfn-yaml-mode yaml-mode
    "CFN-YAML"
    "Simple mode to edit CloudFormation template in YAML format.")
  (add-to-list 'magic-mode-alist
    '("\\(---\n\\)?AWSTemplateFormatVersion:" . cfn-yaml-mode))
  (add-hook 'cfn-yaml-mode-hook 'flycheck-mode)
  )

(provide '50-yaml)
;;; 50-yaml ends here
