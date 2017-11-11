(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("\\.mdwn" . markdown-mode)
         ("\\.md" . markdown-mode)
         ("\\.mdt" . markdown-mode))
  :init ())
