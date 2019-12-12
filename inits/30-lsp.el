;;; 30-lsp --- lsp-mode
;;; Commentary:

;;; Code:
(use-package lsp-mode
  :custom
  ((lsp-inhibit-message t)
    (lsp-message-project-root-warning t)
    (create-lockfiles nil)
    (lsp-auto-guess-root t)
    (lsp-pyls-server-command (expand-file-name "~/.pyenv/shims/pyls"))
    ;; npm i -g typescript-language-server
    (lsp-clients-typescript-server "/usr/local/bin/typescript-language-server")
    ;; npm i -g javascript-typescript-langserver
    (lsp-clients-javascript-typescript-server "/usr/local/bin/javascript-typescript-stdio"))
  :init
  (require 'lsp-clients)
  :hook
  ((prog-major-mode . lsp-prog-major-mode-enable)
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
    (rust-mode . lsp))
  )

(use-package lsp-ui
  :after lsp-mode
  :custom (scroll-margin 0)
  :hook   (lsp-mode . lsp-ui-mode)
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  )

(use-package company-lsp
  :after (lsp-mode company)
  :defines company-backends
  :config
  (push 'company-lsp company-backends)
  )

(provide '30-lsp)
;;; 30-lsp ends here
