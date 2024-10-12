;;; 50-chezmoi --- chezmoi
;;; Commentary:

;;; Code:
(use-package chezmoi
  :ensure t
  :bind
  ("C-c C f" . chezmoi-find)
  ("C-c C s" . chezmoi-write)
  :config
  (push '("*Chezmoi*") popwin:special-display-config)
  (push '("*chezmoi-diff*") popwin:special-display-config)
)

(provide '50-chezmoi)
;;; 50-chezmoi.el ends here
