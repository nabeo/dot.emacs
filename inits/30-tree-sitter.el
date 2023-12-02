;;; 30-tree-sitter --- treesit
;;; Commentary:

;;; Code:
(use-package treesit
  :demand t
  :config
  ;; treesit-language-source-alist
  (add-to-list
   'treesit-language-source-alist '(hcl . ("https://github.com/MichaHoffmann/tree-sitter-hcl" "main" "src")))
  (setq treesit-font-lock-level 4)
  )

(use-package terraform-ts-mode
  :ensure t
  :demand t
  :vc (terraform-ts-mode
       :url "https://github.com/kgrotel/terraform-ts-mode"
       :branch "main")
  )

(use-package treesit-auto
  :ensure t
  :demand t
  :config
  (setq treesit-auto-install 'prompt)
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
  ;; majro-mode-remap-alist
  (add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode))
  ;; (add-to-list 'major-mode-remap-alist '(terraform-mode . terraform-ts-mode))
  (add-to-list 'major-mode-remap-alist '(yaml-mode . yaml-ts-mode))
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  (add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))
  (add-to-list 'major-mode-remap-alist '(dockerfile-mode . dockerfile-ts-mode))
  (add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode))
  (add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode))
  (add-to-list 'major-mode-remap-alist '(json-mode . json-ts-mode))
  (add-to-list 'major-mode-remap-alist '(tsx-mode . tsx-ts-mode))
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
   (tsx-ts-mode . combobulate-mode))
  )

(provide '30-tree-sitter)
;;; 30-tree-sitter.el ends here
