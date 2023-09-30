;;; 30-eglot --- eglot
;;; Commentary:

;;; Code:
(use-package eglot
  :commands (eglot-ensure)
  :hook
  (prog-major-mode . eglot-ensure)
  (go-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (typescript-mode . eglot-ensure)
  (javascript-mode . eglot-ensure)
  (rust-mode . eglot-ensure)
  (json-mode . eglot-ensure)
  (terraform-mode . eglot-ensure)
  (yaml-mode . eglot-ensure)
  :config
  ;; for terraform-ls (brew install terraform-ls)
  (add-to-list
   'eglot-server-programs
   `((terraform-mode terraform-ts-mode) . ("terraform-ls" "serve")))

  ;; for yaml-language-server (brew install yaml-language-server)
  (add-to-list
   'eglot-workspace-configuration
   ;; https://github.com/redhat-developer/yaml-language-server#language-server-settings
   '((:yaml.schemaStore.enable . t)
     (:yaml.schemaStore.url . "https://www.schemastore.org/api/json/catalog.json")
     (:yaml.format.enable . t)
     (:yaml.format.singleQuote . t)
     (:yaml.format.bracketSpacing . t)
     (:yaml.validate . t)
     (:yaml.hover . t)
     (:yaml.completion . t)))

  ;; for python (brew install python-lsp-server)
  (add-to-list
   'eglot-server-programs
   `((python-mode python-ts-mode) . ("pylsp")))
  )

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :custom (flycheck-eglot-exclusive nil)
  :config
  (global-flycheck-eglot-mode 1))

(provide '30-eglot)
;;; 30-eglot.el ends here
