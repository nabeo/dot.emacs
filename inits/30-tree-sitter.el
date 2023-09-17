;;; 30-tree-sitter --- treesit
;;; Commentary:

;;; Code:
(use-package treesit
  :demand t
  :disabled (< emacs-major-version 29)
  :init
  ;; treesit-language-source-alist
  (add-to-list
   'treesit-language-source-alist '(hcl . ("https://github.com/MichaHoffmann/tree-sitter-hcl" "main" "src")))
  )

(use-package terraform-ts-mode
  :ensure t
  :disabled (< emacs-major-version 29)
  :vc (terraform-ts-mode
       :fetcher github
       :repo "kgrotel/terraform-ts-mode")
  )

(use-package treesit-auto
  :ensure t
  :disabled (< emacs-major-version 29)
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode)
  (add-to-list 'treesit-auto-receipe-list
               (make-treesit-auto-recipe
                :lang 'terraform
                :ts-mode 'terraform-ts-mode
                :remap '(terraform-mode)
                :url "https://github.com/MichaHoffmann/tree-sitter-hcl"
                :revision "main"
                :source-dir "dialects/terraform/src"
                ))
)

(provide '30-tree-sitter)
;;; 30-tree-sitter.el ends here
