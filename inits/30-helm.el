;;; 30-helm --- helm-mode
;;; Commentary:

;;; Code:
(use-package helm
  :diminish helm-mode
  :ensure t
  :bind
  (([remap occur] . helm-occur)
   ([remap list-buffers] . helm-buffers-list)

   ("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)

   ("C-x C-f" . helm-find-files)
   ("C-x C-r" . helm-recentf)
   ("C-x C-i" . helm-imenu)

   :map helm-map ("C-h" . delete-backward-char))
  :init
  (push '("*helm-mode.*" :height 20) popwin:special-display-config)
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-full-frame nil)
  )

(use-package helm-config)

(use-package helm-files)

(use-package helm-imenu)

(use-package helm-ring)

(use-package helm-gtags
  :ensure t
  :hook
  ((c-mode . helm-gtags)
    (c++-mode . helm-gtags)
    (asm-mode . helm-gtags)))

(use-package helm-ag
  :if (executable-find "ag")
  :ensure t
  :config
  (setq helm-ag-base-command "ag --nocolor --nogroup")
  (setq helm-ag-command-option nil)
  (setq helm-ag-insert-at-point 'symbol))

(use-package helm-swoop
  :ensure t
  :commands (helm-swoop helm-multi-swoop)
  :after (helm)
  :bind
  (("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-c M-I" . helm-multi-swoop-all)
   :map isearch-mode-map
   (("M-i" . heml-swoop-from-isearch)))
  :config
  (setq helm-multi-swoop-edit-save t)
  (setq helm-swoop-split-with-multiple-windows nil)
  (setq helm-swoop-split-direction 'split-window-vertically)
  (setq helm-swoop-speed-or-color nil)
  (setq helm-swoop-move-to-line-cycle t)
  (setq helm-swoop-use-line-number-face t)
)

(use-package helm-ls-git :ensure t)

(use-package helm-make
  :ensure t
  :bind
  (("C-c m" . helm-make))
  :config
  (setq helm-make-completion-method 'helm)
)

;; use with helm-projectile
;; http://tuhdo.github.io/helm-projectile.html
(use-package helm-projectile
  :ensure t
  :unless (locate-library "neotree")
  :after (helm projectile)
  :config
  (setq projectile-completion-system 'helm)
  (setq projectile-switch-project-action 'helm-projectile-find-file)
  )

(use-package helm-ghq
  :ensure t
  :if (or (executable-find "ghq")
          (file-executable-p (expand-file-name "bin/ghq" (getenv "GOPATH"))))
  :after (helm)
  )

(use-package helm-mkr
  ;; :load-path "~/src/github.com/nabeo/helm-mkr"
  :after (helm)
  :config
  (setq mkr-orgs "hatena")
  (push '("*helm-mkr*" :height 20) popwin:special-display-config)
  )

(provide '30-helm)
;;; 30-helm ends here
