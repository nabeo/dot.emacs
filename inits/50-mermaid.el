;;; 50-marmeid --- mermaid-mode
;;; Commentary:

;;; Code:
(use-package mermaid-mode
  :ensure t
  ;; npm i -g @mermaid-js/mermaid-cli
  :if (executable-find "mmdc")
  :mode (("\\.mmd\\'" . mermaid-mode))
  :bind
  (:map mermaid-mode-map
        ("C-c C-c" . nil)
        ("C-c C-f" . nil)
        ("C-c C-b" . nil)
        ("C-c C-r" . nil)
        ("C-c C-o" . nil)
        ("C-c C-d" . nil)
        ("C-c C-d c" . 'mermaid-compile)
        ("C-c C-d f" . 'mermaid-compile-file)
        ("C-c C-d b" . 'mermaid-compile-buffer)
        ("C-c C-d r" . 'mermaid-compile-region)
        ("C-c C-d o" . 'mermaid-open-browser)
        ("C-c C-d d" . 'mermaid-open-doc))
  )

(provide '50-mermaid)
;;; 50-mermaid.el ends here
