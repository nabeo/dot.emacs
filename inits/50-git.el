(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status))
  :config
  )
(use-package git-gutter+
  :ensure t
  :bind
  ((:map git-gutter+-mode-map
         ;; Jump between hunks
         ("C-x n" . git-gutter+-next-hunk)
         ("C-x p" . git-gutter+-previous-hunk)
         ;; Act on hunks
         ("C-x v =" . git-gutter+-show-hunk)
         ("C-x r" . git-gutter+-revert-hunks)
         ;; Stage hunk at point.
         ;; If region is active, stage all hunk lines within the region.
         ("C-x t" . git-gutter+-stage-hunks)
         ("C-x c" . git-gutter+-commit)
         ("C-x C" . git-gutter+-stage-and-commit)
         ("C-x C-y" . git-gutter+-stage-and-commit-whole-buffer)
         ("C-x U" . git-gutter+-unstage-whole-buffer)
         ))
  :config
  (add-hook 'prog-mode-hook 'git-gutter+-mode)
  (add-hook 'yaml-mode-hook 'git-gutter+-mode)
  (add-hook 'emacs-lisp-mode-hook 'git-gutter+-mode)
  (add-hook 'go-mode-hook 'git-gutter+-mode)
  )
