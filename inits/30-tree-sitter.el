;;; 30-tree-sitter --- treesit
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

(use-package treesit-auto
  :ensure t
  :disabled (< emacs-major-version 29)
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(provide '30-tree-sitter)
;;; 30-tree-sitter.el ends here
