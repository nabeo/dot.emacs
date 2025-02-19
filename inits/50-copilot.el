;;; 50-copilot --- Coplit
;;; Commentary:

;;; Code:
(use-package copilot
  :ensure t
  :hook
  (prog-mode . copilot-mode)
  (yaml-mode . copilot-mode)
  :bind
  (
    ("C-c TAB" . copilot-complete)
    :map copilot-mode-map
    ("<tab>" . copilot-accept-completion)
    ("C-c C-c" . copilot-accept-completion)
    )
  :config
  ;; npm i -g @github/copilot-language-server
  (setq copilot-server-executable (executable-find "copilot-language-server"))
  )

(provide '50-copilot)
;;; 50-coplit.el ends here
