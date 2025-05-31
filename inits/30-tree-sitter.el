;;; 30-tree-sitter --- treesit
;;; Commentary:

;;; Code:
(use-package treesit
  :demand t
  :config
  ;; treesit-language-source-alist
  (add-to-list
   'treesit-language-source-alist '(hcl . ("https://github.com/MichaHoffmann/tree-sitter-hcl" "main" "src")))
  (add-to-list
    'treesit-language-source-alist '(elisp . ("https://github.com/Wilfred/tree-sitter-elisp" "main")))
  (setq treesit-font-lock-level 4)
  )

(use-package terraform-ts-mode
  :disabled t
  :ensure t
  :demand t
  :vc (terraform-ts-mode
       :url "https://github.com/kgrotel/terraform-ts-mode"
       :branch "main")
  )

(use-package graphql-ts-mode
  :ensure t
  :mode ("\\.graphql\\'" "\\.gql\\'")
  :init
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(graphql "https://github.com/bkegley/tree-sitter-graphql"))))

(use-package kotlin-ts-mode
  :ensure t
  :mode ("\\.kt\\'" "\\.kts\\'")
  :init
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(kotlin  . ("https://github.com/fwcd/tree-sitter-kotlin" "main")))))

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  ;; treesit-auto-recipe-list
  (add-to-list 'treesit-auto-recipe-list
               (make-treesit-auto-recipe
                :lang 'terraform
                :ts-mode 'terraform-ts-mode
                :remap '(terraform-mode)
                :url "https://github.com/MichaHoffmann/tree-sitter-hcl"
                :revision "main"
                :source-dir "dialects/terraform/src"
                ))
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode)
)

(use-package combobulate
  :ensure t
  :vc (combobulate
       :url "https://github.com/mickeynp/combobulate"
       :branch "master")
  :preface
  ;; You can customize Combobulate's key prefix here.
  ;; Note that you may have to restart Emacs for this to take effect!
  (setq combobulate-key-prefix "C-c t")
  :hook
  ((python-ts-mode . combobulate-mode)
   (js-ts-mode . combobulate-mode)
   (css-ts-mode . combobulate-mode)
   (yaml-ts-mode . combobulate-mode)
   (json-ts-mode . combobulate-mode)
   (typescript-ts-mode . combobulate-mode)
   (tsx-ts-mode . combobulate-mode)
   (go-ts-mode . combobulate-mode)
   (toml-ts-mode . combobulate-mode))
  )

(provide '30-tree-sitter)
;;; 30-tree-sitter.el ends here
