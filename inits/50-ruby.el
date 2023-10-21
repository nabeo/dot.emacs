;;; 50-ruby -- ruby
;;; Commentary:

;;; Code:
(use-package ruby-mode
  :ensure t
  :mode
  (("\\.rb\\'" . ruby-mode))
  :interpreter
  (("ruby" . ruby-mode))
  :config
  ;; hideshow.elを使ったアウトラインモード
  ;; http://www.bookshelf.jp/pukiwiki/pukiwiki.php?cmd=read&page=Elisp%2Fhideshow.el
  ;;   hs-hide-block                      C-c @ C-h
  ;;   hs-show-block                      C-c @ C-s
  ;;   hs-hide-all                        C-c @ C-M-h
  ;;   hs-show-all                        C-c @ C-M-s
  ;;   hs-hide-level                      C-c @ C-l
  ;;   hs-toggle-hiding                   C-c @ C-c
  ;;   hs-mouse-toggle-hiding             [(shift mouse-2)]
  ;;   hs-hide-initial-comment-block
  (setq ruby-insert-encoding-magic-comment nil)
  (add-hook 'ruby-mode-hook
    #'(lambda ()
        (hs-minor-mode t)))
  (let ((ruby-mode-hs-info
          '(ruby-mode
             "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
             "end"
             "#"
             ruby-move-to-block
             nil)))
    (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
        (cons ruby-mode-hs-info hs-special-modes-alist))))

  )

(use-package rbenv
  :ensure t
  :config
  (setenv "PATH" (concat (expand-file-name "~/.rbenv/shims") ":" (getenv "PATH")))
  (add-to-list 'exec-path (expand-file-name "~/.rbenv/shims"))
  (setq rbenv-installation-dir (expand-file-name "~/.rbenv"))
  )

(use-package ruby-electric
  :ensure t
  :config
  (add-hook 'ruby-mode-hook
    #'(lambda ()
        (ruby-electric-mode t)
        (if (eq emacs-bzr-p t)
          (progn
            (abbrev-mode 1)
            (electric-pair-mode t)
            (electric-indent-mode t)
            (electric-layout-mode t)))))
  )

(provide '50-ruby)
;;; 50-ruby.el ends here
