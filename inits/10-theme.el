;;; 10-theme --- setup theme
;;; Commentary:

;;; Code:
(use-package nerd-icons
  :ensure t)

(use-package doom-themes
  :ensure t
  :init
  (defun nabeo/randomly-select-doom-theme ()
    "randomly select doom-theme"
    (interactive)
    (progn
      (let* ((my/doom-themes
              '(
                doom-bluloco-dark
                doom-challenger-deep
                doom-winter-is-coming-dark-blue
                doom-tokyo-night
                ))
             (my/doom-theme (elt my/doom-themes (abs (% (random t) (length my/doom-themes))))))
        (message "use theme: `%s'" my/doom-theme)
        (load-theme my/doom-theme t))))
  :config
  (nabeo/randomly-select-doom-theme)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; for neotree
  (if (featurep 'neotree)
      (doom-themes-neotree-config))
  ;; for treemacs
  (if (featurep 'treemacs)
      (doom-themes-treemacs-config))
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
  (doom-modeline-major-mode-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-workspace-name t)
  (doom-modeline-vcs-max-length 12)
  (doom-modeline-time t)
  (doom-modeline-env-version t)
  ;; setup PAT for github
  ;; https://magit.vc/manual/ghub/Storing-a-Token.html
  (doom-modeline-github t)
  :config
)

(provide '10-theme)
;;; 10-theme.el ends here
