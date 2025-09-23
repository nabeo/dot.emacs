;;; 30-lsp --- lsp-mode
;;; Commentary:

;;; Code:
(use-package lsp-mode
  :ensure t
  :custom
  ;; (create-lockfiles nil)
  (lsp-auto-guess-root t)
  ;; brew install python-lsp-server
  (lsp-pyls-server-command (expand-file-name (concat my/homebrew-prefix "/bin/pylsp")))
  ;; brew install llvm
  (lsp-clients-clangd-executableb (expand-file-name (concat my/homebrew-prefix "/opt/llvm/bin/clangd")))
  ;; https://emacs-lsp.github.io/lsp-mode/page/lsp-terraform-ls/#server-note
  (lsp-disabled-clients '(tfls))
  ;; https://github.com/emacs-lsp/lsp-mode/issues/3713
  (create-lockfiles nil)
  ;; semantic tokens
  (lsp-semantic-tokens-enable t)
  (lsp-semantic-tokens-honor-refresh-requests t)
  ;; Link to documentation
  (lsp-enable-links t)
  ;; completion provider
  (lsp-completion-provider :capf)
  :init
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ; 1mb
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (prog-major-mode . lsp-prog-major-mode-enable)
  ;; brew install gopls
  (go-mode . lsp)
  ;; pip install 'python-language-server[all]'
  (python-mode . lsp)
  ;; https://emacs-lsp.github.io/lsp-mode/page/lsp-typescript/#installation
  (typescript-mode . lsp)
  (javascript-mode . lsp)
  ;; gem install solargraph
  ;; (ruby-mode . lsp)
  ;; rustup component add rls rust-analysis rust-src
  (rust-mode . lsp)
  ;; for C/C++
  (c++-mode . lsp)
  (c-mode . lsp)
  ;; for Json
  ;; npm -g --prefix ~/.emacs.d/.cache/lsp/npm/vscode-langservers-extracted install vscode-langservers-extracted
  (json-mode . lsp)
  ;; for Terraform
  ;; brew install terraform-ls
  ;; https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#emacs
  (terraform-mode . lsp-deferred)
  ;; for yaml
  (yaml-mode . lsp)
  ;; for kotlin
  (kotlin-mode . lsp)
  (kotlin-ts-mode . lsp)
  ;; use with which-key
  (lsp-mode . lsp-enable-which-key-integration)
  :bind
  (:map lsp-mode-map
    ("C-c r" . lsp-rename))
  :commands (lsp lsp-deferred)
  :config
  ;; lsp-copilot
  (setq lsp-copilot-enabled t)

  ;; lsp-terraform-ls
  (setq lsp-terraform-ls-enable-show-reference t)
  (setq lsp-terraform-ls-prefill-required-fields t)

  ;; kotlin-lsp
  ;; https://github.com/Kotlin/kotlin-lsp/blob/main/scripts/lsp-kotlin-emacs-lsp-mode.el
  (defun kotlin-lsp-server-fun ()
    (list "~/.emacs.d/data/kotlin-lsp/kotlin-lsp.sh" "--stdio"))
  (add-to-list 'lsp-language-id-configuration '(kotlin-mode . "kotlin-lsp"))
  (add-to-list 'lsp-language-id-configuration '(kotlin-ts-mode . "kotlin-lsp"))
  (lsp-register-client
    (make-lsp-client
      :new-connection (lsp-stdio-connection #'kotlin-lsp-server-fun)
      :activation-fn (lsp-activate-on "kotlin-lsp")
      :priority -1
      :major-modes '(kotlin-mode kotlin-ts-mode)
      :server-id 'kotlin-lsp
      ))
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :after lsp-mode
  :custom
  ;; (scroll-margin 0)
  ;; lsp-ui-doc
  ;; (lsp-ui-doc-enable t)
  ;; (lsp-ui-doc-header t)
  ;; (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  ;; (lsp-ui-doc-max-width 150)
  ;; (lsp-ui-doc-max-height 30)
  ;; (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)
  ;; (lsp-ui-doc-alignment 'window) ;; window or frame
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-show-with-mouse nil)
  (lsp-ui-doc-delay 0.5)
  ;; lsp-ui-flycheck
  ;; (lsp-ui-flycheck-enable nil)
  ;; lsp-ui-sideline
  ;; (lsp-ui-sideline-enable nil)
  ;; (lsp-ui-sideline-ignore-duplicate t)
  ;; (lsp-ui-sideline-show-symbol t)
  ;; (lsp-ui-sideline-show-hover t)
  ;; (lsp-ui-sideline-show-diagnostics nil)
  ;; (lsp-ui-sideline-show-code-actions nil)
  ;; lsp-ui-imenu
  ;; (lsp-ui-imenu-enable nil)
  ;; (lsp-ui-imenu-kind-position 'top)
  ;; lsp-ui-peek
  ;; (lsp-ui-peek-enable t)
  ;; (lsp-ui-peek-peek-height 20)
  ;; (lsp-ui-peek-list-width 50)
  ;; (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
  ;; :hook
  ;; (lsp-mode . lsp-ui-mode)
  :bind
  (:map lsp-mode-map
    ("C-c C-r" . lsp-ui-peek-find-references)
    ("C-c C-j" . lsp-ui-peek-find-definitions)
    ("C-c i" . lsp-ui-peek-find-implementation)
    ("C-c m" . lsp-ui-imenu)
    ("C-c s" . lsp-ui-sideline-mode)
    ("C-c d" . lsp-ui-doc-show)
    )
  :config
  )

(use-package lsp-treemacs
  :ensure nil
  :commands lsp-treemacs-errors-list
  :after lsp-mode
  :config
  (lsp-treemacs-sync-mode 1)
  )

(use-package consult-lsp
  :ensure t
  :after (consult)
  :bind
  (:map lsp-mode-map
    ([remap xref-find-apropos] . #'consult-lsp-symbols))
  )

;; https://github.com/emacs-lsp/dap-mode
(use-package dap-mode
  :ensure t
  :disabled
  :after (lsp-treemacs)
  :config
  (dap-auto-configure-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (require 'dap-dlv-go)
  )

(provide '30-lsp)
;;; 30-lsp.el ends here
