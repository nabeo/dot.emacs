;;; 50-tree-sitter --- treesit
;;; Commentary:

;;; Code:

(use-package treesit
  :demand t
  :disabled (< emacs-major-version 29)
  :init
  ;; treesit-language-source-alist
  (add-to-list
   'treesit-language-source-alist '(terraform . ("https://github.com/MichaHoffmann/tree-sitter-hcl" "main" "dialects/terraform/src")))
  (add-to-list
   'treesit-language-source-alist '(hcl . ("https://github.com/MichaHoffmann/tree-sitter-hcl" "main" "src")))
  )

(provide '50-tree-sitter)
;;; 50-tree-sitter.el ends here
