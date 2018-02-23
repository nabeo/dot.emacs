(use-package recentf
  :config
  ;; recetf-save-file
  ;; default : ~/.recentf
  (setq recentf-save-file (expand-file-name
                           "data/recentf-list-file.el"
                           user-emacs-directory))
  )

