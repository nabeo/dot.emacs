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
  ;; https://github.com/emacs-lsp/lsp-mode/issues/3713
  (create-lockfiles nil)
  ;; semantic tokens
  (lsp-semantic-tokens-enable t)
  (lsp-semantic-tokens-honor-refresh-requests t)
  ;; Link to documentation
  (lsp-enable-links t)
  ;; completion provider
  (lsp-completion-provider :capf)
  ;; auto format on save by lsp
  (lsp-format-buffer-on-save t)
  (lsp-format-buffer-on-save-list '("kotlin-mode" "kotlin-ts-mode"))

  ;; hover のドキュメントは lsp-ui-doc の child frame だけに表示する
  ;; lsp-eldoc-function が minibuffer (echo area) に出す分を止める
  ;; lsp-ui-doc は eldoc を経由せず自前で textDocument/hover を投げるので child frame の表示には影響しない
  (lsp-eldoc-enable-hover nil)
  ;; lsp-eldoc-render-all は lsp-eldoc-function 専用なので上記により無効
  ;; (lsp-eldoc-render-all t)
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
  ;; gem install ruby-lsp
  (ruby-mode . lsp)
  (ruby-ts-mode . lsp)
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
  (terraform-mode . lsp)
  ;; for yaml
  (yaml-mode . lsp)
  ;; for kotlin
  (kotlin-mode . lsp)
  (kotlin-ts-mode . lsp)
  ;; for lua (lua-language-server)
  (lua-mode . lsp)
  (lua-ts-mode . lsp)
  ;; use with which-key
  (lsp-mode . lsp-enable-which-key-integration)
  :bind
  (:map lsp-mode-map
    ("C-c r" . lsp-rename))
  :commands (lsp lsp-deferred)
  :config
  ;; lsp-copilot
  (setq lsp-copilot-enabled nil)

  ;; lsp-terraform-ls
  ;; https://emacs-lsp.github.io/lsp-mode/page/lsp-terraform-ls/#server-note
  ;; disable terraform-lsp
  (add-to-list 'lsp-disabled-clients 'tfls)
  (setq lsp-terraform-ls-enable-show-reference t)
  (setq lsp-terraform-ls-prefill-required-fields t)

  ;; kotlin-lsp
  ;; https://github.com/Kotlin/kotlin-lsp/blob/main/scripts/lsp-kotlin-emacs-lsp-mode.el
  (setq kotlin-lsp-bin (concat my/homebrew-prefix "/bin/kotlin-lsp"))
  (defun kotlin-lsp-server-fun ()
    (list kotlin-lsp-bin "--stdio"))
  ;; kotlin-language-server は使わない
  (add-to-list 'lsp-disabled-clients 'kotlin-ls)
  (cond ((file-executable-p kotlin-lsp-bin)
          ;; inlay hint 系の設定
          ;; 設定可能なオプションは kotlin-vscode/package.json を見る
          (lsp-register-custom-settings
            `(("jetbrains.kotlin"
                ,(lsp-ht
                   ("hints.settings.types.property" t)
                   ("hints.settings.types.variable" t)
                   ("hints.type.function.return" t)
                   ("hints.type.function.parameter" t)
                   ("hints.settings.lambda.return" t)
                   ("hints.lambda.receivers.parameters" t)
                   ("hints.settings.value.ranges" t)
                   ("hints.value.kotlin.time" t)
                   ("hints.parameters" t)
                   ("hints.parameters.compiled" t)))))
          ;; lsp-clients に kotlin-lsp を追加
          (lsp-register-client
            (make-lsp-client
              :new-connection (lsp-stdio-connection #'kotlin-lsp-server-fun)
              :activation-fn (lsp-activate-on "kotlin")
              :priority 1
              :server-id 'kotlin-lsp
              ))))

  ;; textDocument/inlayHint
  (setq lsp-inlay-hint-enable t)
  )
(use-package lsp-ui
  :ensure t
  ;; :commands lsp-ui-mode
  ;; :after lsp-mode
  :custom
  ;; (scroll-margin 0)
  ;; lsp-ui-doc
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  ;; (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  ;; (lsp-ui-doc-max-width 150)
  ;; (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  ;; webkit (xwidget) 経路は使わない
  ;; lsp-ui-doc--make-frame が make-xwidget した xwidget に 'callback を
  ;; 設定せず current-global-map に [xwidget-event] を bind しているが、
  ;; special-event-map の xwidget-event-handler が先に処理して javascript-callback を捨ててしまう。
  ;; その結果 lsp-ui-doc--webkit-resize-callback が呼ばれず、child frame が
  ;; 9x16px のまま可視化されない
  (lsp-ui-doc-use-webkit nil)
  (lsp-ui-doc-alignment 'window) ;; window or frame
  (lsp-ui-doc-show-with-cursor t)
  ;; (lsp-ui-doc-show-with-mouse nil)
  ;; (lsp-ui-doc-delay 0.5)
  ;; lsp-ui-flycheck
  ;; (lsp-ui-flycheck-enable nil)
  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
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
    ;; child frame にフォーカスを移す (戻るときは child frame 内で q)
    ("C-c D" . lsp-ui-doc-focus-frame)
    )
  (:map lsp-ui-mode-map
    ([remap xref-find-definitions] . #'lsp-ui-peek-find-definitions)
    ([remap xref-find-references] . #'lsp-ui-peek-find-references)
    )
  :config
  )

(use-package lsp-treemacs
  :ensure t
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
