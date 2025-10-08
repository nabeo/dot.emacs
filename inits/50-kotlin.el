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
  )

;;; 50-kotlin.el ends here
