;;; 50-git --- lsp-mode
;;; Commentary:

;;; Code:
(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status))
  :config
  )
(use-package magit-popup
  :ensure t
  )
(use-package magit-svn
  :ensure t
  )
(use-package magit-find-file
  :ensure t
  )
(use-package forge
  :ensure t
  :after magit
  :custom
  (forge-database-file (expand-file-name "data/forge-database.sqlite" user-emacs-directory))
  )

(use-package diff-hl
  :ensure t
  :bind
  ("M-n" . diff-hl-next-hunk)
  ("M-p" . diff-hl-previous-hunk)
  :hook
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh)
  :config
  (global-diff-hl-mode))

(use-package git-link
  :ensure t
  :bind
  ("C-c g l" . git-link)
  :init
  :config
  (if (file-exists-p "~/.emacs.d/secret/git-link-ghe.el")
    (load "~/.emacs.d/secret/git-link-ghe.el"))
  (setq git-link-use-commit t)
  )

;;; 50-git ends here
