;;; 50-flycheck --- flycheck
;;; Commentary:

;;; Code:
(use-package flycheck
  :ensure t
  :commands (global-flycheck-mode)
  :bind
  :hook
  (after-init . global-flycheck-mode)
  :init
  (push '("*Flycheck errors*") popwin:special-display-config)
  :config
  )

(provide '50-flycheck)
;;; 50-flycheck.el ends here
