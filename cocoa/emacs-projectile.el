(require 'projectile)

(cond ((and (locate-library "helm") (locate-library "helm-projectile"))
       (setq projectile-completion-system 'helm)
       (define-key projectile-mode-map (kbd "C-c p a") 'helm-projectile-ag)
       (define-key projectile-mode-map (kbd "C-c p r") 'helm-projectile-recentf)
       (helm-projectile-on)))

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
