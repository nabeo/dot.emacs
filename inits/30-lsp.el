;;; 30-lsp --- lsp-mode
;;; Commentary:

;;; Code:
(use-package lsp-mode
  :custom ((lsp-inhibit-message t)
         (lsp-message-project-root-warning t)
            (create-lockfiles nil))
  :init
  (require 'lsp-clients)
  :hook ((prog-major-mode . lsp-prog-major-mode-enable)
          (go-mode . lsp)
          (python-mode . lsp)
          ))

(use-package lsp-ui
  :after lsp-mode
  :custom (scroll-margin 0)
  :hook   (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :after (lsp-mode company)
  :defines company-backends
  :config
  (push 'company-lsp company-backends))

(provide '30-lsp)
;;; 30-lsp ends here
