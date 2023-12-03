;;; 50-projectile --- projectile
;;; Commentary:

;;; Code:
(use-package projectile
  :ensure t
  :bind
  (:map projectile-mode-map
    ("C-c p" . projectile-command-map)
    )
  :hook
  ((yaml-mode prog-mode markdwon-mode gfm-mode python-mode) . projectile-mode)
  :init
  (setq projectile-cache-file
    (expand-file-name "data/projectile.cache" user-emacs-directory))
  (setq projectile-known-projects-file
    (expand-file-name "data/projectile-bookmarks.eld" user-emacs-directory))
  (setq projectile-enable-caching t)
  (setq projectile-file-exists-remote-cache-expire nil)
  (setq projectile-file-exists-local-cache-expire (* 5 60))
  :config
  ;; ignore files and directory
  (add-to-list 'projectile-globally-ignored-directories "tmp")
  (add-to-list 'projectile-globally-ignored-directories "vender")
  (add-to-list 'projectile-globally-ignored-directories "build")
  (add-to-list 'projectile-globally-ignored-directories ".cask")
  (add-to-list 'projectile-globally-ignored-directories ".vagrant")
  (add-to-list 'projectile-globally-ignored-directories "elpa")
  (add-to-list 'projectile-globally-ignored-directories "cache")
  (add-to-list 'projectile-globally-ignored-directories "auto-save-list")
  (add-to-list 'projectile-globally-ignored-files ".gitignore")
  (add-to-list 'projectile-globally-ignored-files ".gitkeep")

  ;; use ivy/counsel
  ;; (setq projectile-completion-system 'ivy)
  ;; (setq projectile-switch-project-action 'counsel-projectile-find-file)

  (cond ((featurep 'vterm)
         ;; projectile-next-buffer/prev-buffer の対象から vterm バッファーをはずす
         (customize-set-variable 'projectile-globally-ignored-modes
                                 (let ((newlist projectile-globally-ignored-modes))
                                   (add-to-list 'newlist "vterm-mode")))))
  )

;; use with ibuffer-projectile
;; https://github.com/purcell/ibuffer-projectile
(use-package ibuffer-projectile
  :ensure t
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic))))
  )

;; projectile-git-autofetch
(use-package projectile-git-autofetch
  :ensure t
  :config
  (setq projectile-git-autofetch-projects :current)
  )

(provide '50-projectile)
;;; 50-projectile.el ends here
