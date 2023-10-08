;;;  20-popwin --- popwin
;;; Commentary:

;;; Code:
(use-package popwin
  :ensure t
  :config
  ;; (global-set-key (kbd "C-x p") 'popwin:keymap)
  (popwin-mode 1)

  (push '("*Apropos*") popwin:special-display-config)
  (push '("*sdic*") popwin:special-display-config)
  (push '("*Faces*") popwin:special-display-config)
  (push '("*Colors*") popwin:special-display-config)

  ;; bbdb
  (push '("*BBDB*") popwin:special-display-config)
  )

(provide '20-popwin)
;;; 20-popwin.el ends here
