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
  (if (executable-find "copilot-language-server")
    (setq copilot-server-executable (executable-find "copilot-language-server")))
  )

(use-package copilot-chat
  :ensure t
  :after copilot
  :bind
  (:map git-commit-mode-map
        ("C-c C-;" . copilot-chat-insert-commit-message))
  :config
  (let ((my/original-prompt copilot-chat-prompt))
    (setq copilot-chat-prompt (concat my/original-prompt "\n出力には日本語を使ってください。")))
  (let ((my/original-commit-prompt copilot-chat-commit-prompt))
    (setq copilot-chat-commit-prompt (concat my/original-commit-prompt "\nコミットメッセージには日本語を使ってください。")))
  )

(provide '50-copilot)
;;; 50-coplit.el ends here
