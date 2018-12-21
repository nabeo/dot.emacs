(use-package popwin
  :ensure t
  :config
  (global-set-key (kbd "C-x p") 'popwin:keymap)
  (popwin-mode 1)

  (setq anything-samewindow nil)
  (setq helm-samewindow nil)

  (push '("*anything*" :height 20) popwin:special-display-config)
  (push '("*Apropos*") popwin:special-display-config)
  (push '("*sdic*") popwin:special-display-config)
  (push '("*Faces*") popwin:special-display-config)
  (push '("*Colors*") popwin:special-display-config)

  ;; bbdb
  (push '("*BBDB*") popwin:special-display-config)
  )
