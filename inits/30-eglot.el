;;; 30-eglot --- eglot
;;; Commentary:

;;; Code:
(use-package eglot
  :commands (eglot-ensure)
  :hook
  (go-mode . eglot-ensure)              ; brew install gopls
  (python-mode . eglot-ensure)          ; brew install python-lsp-server
  (typescript-mode . eglot-ensure)      ; npm i -g typescript-language-server
  (javascript-mode . eglot-ensure)      ; npm i -g typescript-language-server
  (rust-mode . eglot-ensure)            ; brew install rust-analyzer
  (json-mode . eglot-ensure)            ; npm i -g vscode-json-languageserver
  (terraform-mode . eglot-ensure)       ; brew install terraform-ls
  (yaml-mode . eglot-ensure)            ; brew install yaml-language-server
  ((markdown-modde gfm-mode) . eglot-ensure)       ; brew install marksman
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (kotlin-mode . eglot-ensure)          ; brew install kotlin-language-server
  (dockerfile-mode . eglot-ensure)      ; brew install dockerfile-language-server
  (lua-mode . eglot-ensure)             ; brew install lua-language-server
  ((toml-mode toml-ts-mode) . eglot-ensure) ; brew install taplo
  :bind
  (:map eglot-mode-map
        ("C-c r" . eglot-rename))
  :config
  (setq eglot-connect-timeout 60)
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

  ;; for vscode-json-languageserver (npm i -g vscode-json-languageserver)
  ;; https://www.npmjs.com/package/vscode-json-languageserver
  (add-to-list
   'eglot-server-programs
   `((json-mode json-ts-mode) . ("vscode-json-languageserver" "--stdio")))
  (add-to-list
   'eglot-workspace-configuration
   ;; https://github.com/microsoft/vscode/tree/main/extensions/json-language-features/server#settings
   '((:json.format.enable . t)))

  ;; for C/C++
  (add-to-list
   'eglot-server-programs
   '((c-mode c++-mode) . ("clangd"
                          "-j=8"
                          "--log=error"
                          "--malloc-trim"
                          "--background-index"
                          "--clang-tidy"
                          "--cross-file-rename"
                          "--completion-style=detailed"
                          "--pch-storage=memory"
                          "--header-insertion=never"
                          "--header-insertion-decorators=0")))

  ;; for marksman (brew install marksman)
  (add-to-list
   'eglot-server-programs
   `((markdown-mode gfm-mode) . ("marksman")))

  ;; for kotlin (brew install kotlin-language-server)
  (add-to-list
   'eglot-server-programs
   `((kotlin-mode) . ("kotlin-language-server")))

  ;; for lua (brew install lua-language-server
  (add-to-list
   'eglot-server-programs
   `((lua-mode) . ("lua-language-server")))

  ;; for toml (brew install taplo
  (add-to-list
   'eglot-server-programs
   `((toml-mode toml-ts-mode) . ("taplo" "lsp" "stdio")))
  )

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :custom (flycheck-eglot-exclusive nil)
  :config
  (global-flycheck-eglot-mode 1))

(provide '30-eglot)
;;; 30-eglot.el ends here
