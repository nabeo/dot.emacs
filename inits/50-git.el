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

(use-package git-gutter+
  :ensure t
  :bind
  ((:map git-gutter+-mode-map
         ;; Jump between hunks
         ("M-n" . git-gutter+-next-hunk)
         ("M-p" . git-gutter+-previous-hunk)
         ;; Act on hunks
         ("C-x v =" . git-gutter+-show-hunk)
         ("C-x r" . git-gutter+-revert-hunks)
         ;; Stage hunk at point.
         ;; If region is active, stage all hunk lines within the region.
         ("C-x T" . git-gutter+-stage-hunks)
         ("C-x c" . git-gutter+-commit)
         ("C-x C" . git-gutter+-stage-and-commit)
         ("C-x C-y" . git-gutter+-stage-and-commit-whole-buffer)
         ("C-x U" . git-gutter+-unstage-whole-buffer)
         ))
  :init
  (add-hook 'prog-mode-hook 'git-gutter+-mode)
  (add-hook 'yaml-mode-hook 'git-gutter+-mode)
  (add-hook 'emacs-lisp-mode-hook 'git-gutter+-mode)
  (add-hook 'go-mode-hook 'git-gutter+-mode)
  :config
  )

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
