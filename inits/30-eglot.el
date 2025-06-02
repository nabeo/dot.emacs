;;; 30-eglot --- eglot
;;; Commentary:

;;; Code:
(use-package eglot
  :commands (eglot-ensure)
  :hook
  ((go-mode go-ts-mode) . eglot-ensure) ; brew install gopls
  ((python-mode python-ts-mode) . eglot-ensure) ; brew install python-lsp-server
  ((typescript-mode typescript-ts-mode) . eglot-ensure) ; npm i -g typescript-language-server
  (javascript-mode . eglot-ensure) ; npm i -g typescript-language-server
  ((rust-mode rust-ts-mode) . eglot-ensure) ; brew install rust-analyzer
  ((json-mode json-ts-mode) . eglot-ensure) ; npm i -g vscode-json-languageserver
  ((terraform-mode terraform-ts-mode) . eglot-ensure)       ; brew install terraform-ls
  ((yaml-mode yaml-ts-mode) . eglot-ensure)            ; brew install yaml-language-server
  ((markdown-mode gfm-mode) . eglot-ensure)       ; brew install marksman
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (kotlin-mode . eglot-ensure)   ; brew install kotlin-language-server
  ((dockerfile-mode dockerfile-ts-mode) . eglot-ensure) ; brew install dockerfile-language-server
  (lua-mode . eglot-ensure)             ; brew install lua-language-server
  ((toml-mode toml-ts-mode) . eglot-ensure) ; brew install taplo
  ((graphql-ts-mode) . eglot-ensure)         ; npm install -g graphql-language-service-cli
  :bind
  (:map eglot-mode-map
        ("C-c r" . eglot-rename))
  :config
  (setq eglot-connect-timeout 120)

  ;; User-specific configuration
  ;; https://www.gnu.org/software/emacs/manual/html_node/eglot/User_002dspecific-configuration.html
  (setq-default eglot-workspace-configuration
    '(
       ;; yaml-language-server
       ;; https://github.com/redhat-developer/yaml-language-server#language-server-settings
       :yaml
       (:schemaStore (:enable t :url "https://www.schemastore.org/api/json/catalog.json")
         :format (:enable t :signleAuote t)
         :validate t
         :completion t)
       :redhat (:telemetry (:enabled t))

       ;; vscode-json-languageserver
       ;; https://github.com/microsoft/vscode/tree/main/extensions/json-language-features/server#settings
       :json (:format (:enable t))
       ))

  ;; for terraform-ls (brew install terraform-ls)
  ;; https://github.com/hashicorp/terraform-ls/blob/main/docs/SETTINGS.md
  (let ((my/terraform-language-server-program (alist-get 'terraform-mode eglot-server-programs nil nil #'equal)))
    (if (not (eq my/terraform-language-server-program nil))
      (setf (alist-get 'terraform-mode eglot-server-programs nil nil #'equal)
        (append my/terraform-language-server-program
          '( :initializationOptions
             ( :experimentalFeatures ( :validateOnSave t
                                       :prefillRequiredFields t)))))))

  ;; for toml (brew install taplo
  (add-to-list
   'eglot-server-programs
   `((toml-mode toml-ts-mode) . ("taplo" "lsp" "stdio")))

  ;; for graphql
  (add-to-list
   'eglot-server-programs
    `((graphql-ts-mode) . ("graphql-lsp" "server" "-m" "stream")))

  ;; kotlin-lsp (standalone server)
  ;; https://github.com/Kotlin/kotlin-lsp
  (add-to-list
    'eglot-server-programs
    `((kotlin-mode kotlin-ts-mode) . (,(concat user-emacs-directory "data/kotlin-lsp/kotlin-lsp.sh") "--stdio")))
  )

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :custom (flycheck-eglot-exclusive nil)
  :config
  (global-flycheck-eglot-mode 1))

(provide '30-eglot)
;;; 30-eglot.el ends here
