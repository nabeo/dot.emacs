;;; 50-kotlin --- kotlin-mode
;;; Commentary:

;;; Code:
(use-package kotlin-mode
  :ensure t
  )

(use-package flycheck-kotlin
  :ensure t
  :after (flycheck)
  :hook
  (kotlin-mode . flycheck-mode)
  :config
  (flycheck-kotlin-setup)
  )

;;; 50-kotlin.el ends here
