;;; 50-markdown --- markdown-mode
;;; Commentary:

;;; Code:
(use-package markdown-mode
  :ensure t
  :bind
  (:map markdown-mode-map
        ("C-c C-e" . markdown-do))
  :init
  (if (executable-find "multimarkdown")
    (setq markdown-command "multimarkdown"))
  (add-hook 'markdown-mode-hook
            #'(lambda () (outline-minor-mode t)))
  )

;;; 50-markdown.el ends here
