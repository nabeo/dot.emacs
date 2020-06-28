;;; 30-lsp --- lsp-mode
;;; Commentary:

;;; Code:
(use-package lsp-mode
  :custom
  (lsp-inhibit-message t)
  (lsp-message-project-root-warning t)
  (create-lockfiles nil)
  (lsp-auto-guess-root t)
  (lsp-prefer-flymake 'flymake)
  (lsp-completion-at-point nil)
  (lsp-pyls-server-command (expand-file-name "~/.pyenv/shims/pyls"))
  ;; npm i -g typescript-language-server
  (lsp-clients-typescript-server "/usr/local/bin/typescript-language-server")
  ;; npm i -g javascript-typescript-langserver
  (lsp-clients-javascript-typescript-server "/usr/local/bin/javascript-typescript-stdio")
  ;; brew install llvm
  (lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd")
  :init
  (require 'lsp-clients)
  :hook
  (prog-major-mode . lsp-prog-major-mode-enable)
  ;; go get -u github.com/saibing/bingo
  (go-mode . lsp)
  ;; pip install 'python-language-server[all]'
  (python-mode . lsp)
  ;; npm i -g typescript-language-server; npm i -g typescript
  (typescript-mode . lsp)
  (javascript-mode . lsp)
  ;; gem install solargraph
  (ruby-mode . lsp)
  ;; rustup component add rls rust-analysis rust-src
  (rust-mode . lsp)
  ;; for C/C++
  (c++-mode . lsp)
  (c-mode . lsp)
  :bind
  (:map lsp-mode-map
    ("C-c r" . lsp-rename))
  :config
  (use-package lsp-ui
    :after lsp-mode
    :custom
    (scroll-margin 0)
    ;; lsp-ui-doc
    (lsp-ui-doc-enable t)
    (lsp-ui-doc-header t)
    (lsp-ui-doc-include-signature t)
    (lsp-ui-doc-position 'bottom) ;; top, bottom, or at-point
    (lsp-ui-doc-max-width 150)
    (lsp-ui-doc-max-height 30)
    (lsp-ui-doc-use-childframe t)
    (lsp-ui-doc-use-webkit nil)
    (lsp-ui-doc-alignment 'window) ;; window or frame
    ;; lsp-ui-flycheck
    (lsp-ui-flycheck-enable nil)
    ;; lsp-ui-sideline
    (lsp-ui-sideline-enable nil)
    (lsp-ui-sideline-ignore-duplicate t)
    (lsp-ui-sideline-show-symbol t)
    (lsp-ui-sideline-show-hover t)
    (lsp-ui-sideline-show-diagnostics nil)
    (lsp-ui-sideline-show-code-actions nil)
    ;; lsp-ui-imenu
    (lsp-ui-imenu-enable nil)
    (lsp-ui-imenu-kind-position 'top)
    ;; lsp-ui-peek
    (lsp-ui-peek-enable t)
    (lsp-ui-peek-peek-height 20)
    (lsp-ui-peek-list-width 50)
    (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
    :hook
    (lsp-mode . lsp-ui-mode)
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
  )

(use-package company-lsp
  :ensure t
  :after (lsp-mode company)
  :defines company-backends
  :config
  (push 'company-lsp company-backends)
  )

(use-package lsp-treemacs
  :ensure t
  :disabled
  :commands lsp-treemacs-errors-list
  :config
  ;; https://github.com/emacs-lsp/lsp-treemacs
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))

(use-package dap-mode
  :ensure t
  :config
  ;; https://github.com/emacs-lsp/dap-mode
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (require 'dap-ruby)
  (require 'dap-go))

(use-package helm-lsp
  :ensure t
  :after (helm lsp-mode)
  :commands helm-lsp-workspace-symbol
  :config
  ;; https://github.com/emacs-lsp/helm-lsp
  )

(provide '30-lsp)
;;; 30-lsp ends here
