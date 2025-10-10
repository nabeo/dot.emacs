;;; 50-kotlin --- kotlin-mode
;;; Commentary:

;;; Code:
(use-package kotlin-mode
  :ensure t
  )

(use-package flycheck-kotlin
  :ensure t
  :if (executable-find "ktlint")        ; brew install ktlint
  :hook
  (kotlin-mode . flycheck-mode)
  (ktolin-ts-mode . flycheck-mode)
  :init
  (eval-after-load 'flycheck
    '(flycheck-kotlin-setup))
  :config
  (add-hook 'kotlin-ts-mode-hook
    '(lambda ()
       (add-to-list 'flycheck-disabled-checkers 'lsp)
       (flycheck-add-mode 'kotlin-ktlint 'kotlin-ts-mode)
       (flycheck-add-mode 'kotlin-ktlint 'kotlin-mode)
       ))
  )

;;; 50-kotlin.el ends here
