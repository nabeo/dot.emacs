;;; 30-company --- company-mode
;;; Commentary:

;;; Code:
(use-package company
  :ensure t
  :bind
  (:map company-active-map
    ;; C-n, C-pで補完候補を次/前の候補を選択
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous)
    ;; C-sで絞り込む
    ("C-s" . company-filter-candidates)
    ;; TABで候補を設定
    ("C-i" . company-complete-selection))
  (:map company-search-map
    ;; C-n, C-pで補完候補を次/前の候補を選択
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous))
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0)
  ;; (setq company-echo-delay 0)

  ;; (use-package company-quickhelp
  ;;   :ensure t
  ;;   :init
  ;;   (company-quickhelp-mode)
  ;;   :config
  ;;   (setq company-quickhelp-delay nil))
  )

(use-package lsp-mode
  :custom ((lsp-inhibit-message t)
         (lsp-message-project-root-warning t)
         (create-lockfiles nil))
  :hook   (prog-major-mode . lsp-prog-major-mode-enable))

(use-package lsp-ui
  :after lsp-mode
  :custom (scroll-margin 0)
  :hook   (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :after (lsp-mode company)
  :defines company-backends
  :config
  (push 'company-lsp company-backends)
)

(provide '30-company)
;;; 30-company ends here
