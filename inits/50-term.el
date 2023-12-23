;;; 50-term --- terminal emulator for emacs
;;; Commentary:

;;; Code:
(use-package vterm
  :ensure t
  :bind
  (:map vterm-mode-map
        ("C-h" . #'vterm-send-backspace))
  :custom
  (vterm-max-scrollback 10000000)
  (vterm-buffer-name-string "vterm: %s")
  )

(use-package vterm-toggle
  :ensure t
  :bind (:map vterm-mode-map
              ([remap projectile-previous-project-buffer] . vterm-toggle-forward)
              ([remap projectile-next-project-buffer] . vterm-toggle-backward)
              )
  :custom
  (vterm-toggle-scope 'project)
  :config
  ;; Show vterm buffer in the window located at bottom
  (add-to-list 'display-buffer-alist
               '((lambda(bufname _) (with-current-buffer bufname (equal major-mode 'vterm-mode)))
                 (display-buffer-reuse-window display-buffer-in-direction)
                 (direction . bottom)
                 (reusable-frames . visible)
                 (window-height . 0.4)))

  )

(provide '50-term)
;;; 50-term.el ends here
