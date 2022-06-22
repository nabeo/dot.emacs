;;; 10-theme --- setup theme
;;; Commentary:

;;; Code:
(use-package all-the-icons
  :ensure t
  :config
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
  )

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-solarized-dark t) ;; or doom-dark, etc.
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; for neotree
  (doom-themes-neotree-config)
  ;; (setq doom-neotree-enable-file-icons t)
  ;; (setq doom-neotree-enable-folder-icons t)
  ;; (setq doom-neotree-enable-chvron-icons t)
  ;; (setq doom-neotree-file-icons t)
  ;; (setq doom-neotree-project-size 1)
  ;; (setq doom-neotree-folder-size 0.8)
  ;; (setq doom-neotree-chevron-size 0.8)
  ;; (setq doom-neotree-line-spacing 1)
  )

(use-package doom-modeline
  :ensure t
  :commands (doom-modeline-def-modeline)
  :hook
  (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-minor-modes nil)
  :config
  (line-number-mode 0)
  (column-number-mode 0)
  (doom-modeline-def-modeline
    'main
    '(bar window-number matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info persp-name debug minor-modes input-method major-mode process vcs checker))
)

(use-package powerline
  :ensure t
  :after (all-the-icons)
  :disabled t
  :config
  (powerline-default-theme))


(provide '10-theme)
;;; 10-theme.el ends here
