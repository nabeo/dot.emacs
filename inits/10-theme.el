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
  (load-theme 'doom-one t) ;; or doom-dark, etc.
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; for neotree
  (doom-themes-neotree-config)
  (setq doom-neotree-enable-file-icons t)
  (setq doom-neotree-enable-folder-icons t)
  (setq doom-neotree-enable-chvron-icons t)
  (setq doom-neotree-file-icons t)
  (setq doom-neotree-project-size 1)
  (setq doom-neotree-folder-size 0.8)
  (setq doom-neotree-chevron-size 0.8)
  (setq doom-neotree-line-spacing 1)
  )

(provide '10-theme)
;;; 10-theme ends here
