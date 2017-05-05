(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-x g") 'magit-status)

(cond ((locate-library "git-gutter+")
       ;; (global-git-gutter+-mode)
       (add-hook 'prog-mode-hook 'git-gutter+-mode)
       (add-hook 'yaml-mode-hook 'git-gutter+-mode)
       (add-hook 'emacs-lisp-mode-hook 'git-gutter+-mode)
       (add-hook 'go-mode-hook 'git-gutter+-mode)
       (eval-after-load 'git-gutter+
         '(progn
            ;; Jump between hunks
            (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
            (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)
            ;; Act on hunks
            (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
            (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
            ;; Stage hunk at point.
            ;; If region is active, stage all hunk lines within the region.
            (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
            (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
            (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-commit)
            (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
            (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer)
            ))))
