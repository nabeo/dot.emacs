;;; 50-json --- json-mode
;;; Commentary:

;;; Code:
(use-package json-mode
  :ensure t
  :init
  :config
  ;; https://www.emacswiki.org/emacs/CfnLint
  (define-derived-mode cfn-json-mode json-mode
    "CFN-JSON"
    "Simple mode to edit CloudFormation template in JSON format."
    (setq js-indent-level 2))
  (add-to-list 'magic-mode-alist
    '("\\({\n *\\)? *[\"']AWSTemplateFormatVersion" . cfn-json-mode))
  (add-hook 'cfn-json-mode-hook 'flycheck-mode)
  )

(provide '50-json)
;;; 50-json ends here
