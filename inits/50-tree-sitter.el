;;; 50-tree-sitter --- treesit
;;; Commentary:

;;; Code:

(use-package treesit
 :demand t
 :init
 ;; treesit-language-source-alist
 (add-to-list
  'treesit-language-source-alist '(terraform . ("https://github.com/MichaHoffmann/tree-sitter-hcl" nil "dialects/terraform/src")))
 (add-to-list
  'treesit-language-source-alist '(hcl . ("https://github.com/MichaHoffmann/tree-sitter-hcl" nil "src")))
 )

(provide '50-tree-sitter)
;;; 50-tree-sitter.el ends here
