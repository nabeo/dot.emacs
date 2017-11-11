(use-package projectile
  :ensure t
  :config
  ;; caching
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (setq projectile-cache-file "~/.emacs.d/projectile/projectile.cache")
  (setq projectile-file-exists-remote-cache-expire nil)
  (setq projectile-file-exists-local-cache-expire (* 5 60))

  ;; ignore files and directory
  (add-to-list 'projectile-globally-ignored-directories "tmp")
  (add-to-list 'projectile-globally-ignored-directories "vender")
  (add-to-list 'projectile-globally-ignored-directories "build")
  (add-to-list 'projectile-globally-ignored-directories ".cask")
  (add-to-list 'projectile-globally-ignored-directories ".vagrant")
  (add-to-list 'projectile-globally-ignored-files ".gitignore")
  (add-to-list 'projectile-globally-ignored-files ".gitkeep")

  ;; enable projectile
  (add-hook 'prog-mode-hook 'projectile-mode)
  )
(use-package helm-projectile
  :ensure t
  :if (locate-library "helm")
  :bind
  (:map projectile-mode-map
        (("C-c p a" . helm-projectile-ag)
         ("C-c p r" . helm-projectile-recentf)))
  :config
  (helm-projectile-on)
  )
