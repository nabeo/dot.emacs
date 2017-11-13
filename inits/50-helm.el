(use-package helm
  :ensure t
  :bind
  (("C-h" . delete-backward-char)
   ("M-x" . helm-M-x)
   ;; helm-swoop
   ("M-i" . helm-swoop)
   ("C-x M-i" . helm-multi-swoop)
   ;; helm-etags-plus
   ("M-." . helm-etags+-select-one-key)
   ("M-*" . helm-etags+-history)
   ("M-," . helm-etags+-history-action-go-back)
   ("M-/" . helm-etags+-history-action-go-forward)
   ;; helm-elscreen
   ("C-z SPC" . helm-elscreen)
   ;; helm-c-yasnippet
   ;; ("C-c y" . helm-yas-complete)
   ;; remap key-bind
   ([remap list-buffers] . helm-buffers-list)
   ([remap find-file] . helm-find-files)
   ([remap occur] . helm-occur)
   :map helm-map
   ("C-h" . delete-backward-char)
   :map helm-find-files-map
   ("C-h" . delete-backward-char)
   :map lisp-interaction-mode-map
   ([remap completion-at-point] . helm-lisp-completion-at-point)
   :map emacs-lisp-mode-map
   ([remap completion-at-point] . helm-lisp-completion-at-point))
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (defvar my/helm-external-pkgs
    '(helm-ag helm-ag-r helm-c-yasnippet helm-core helm-flycheck
              helm-ghq helm-git helm-git-files helm-git-grep
              helm-gitignore helm-go-package helm-gtags helm-ls-git
              helm-ls-hg helm-ls-svn helm-migemo helm-package
              helm-projectile helm-rb helm-swoop))
  (dolist (pkg my/helm-external-pkgs)
    (unless (package-installed-p pkg)
      (package-install pkg)))
  )

(use-package helm-etags+
  :ensure helm-etags-plus
  :config
  (setq helm-etags+-use-short-file-name nil)
  (setq tags-table-list '("~/git/utilities/ruby/tags"))
  )
(use-package helm-elscreen
  :ensure t
  :config
  )
(use-package helm-swoop
  :ensure t
  :config
  )
(use-package helm-ghq
  :ensure t
  :config
  (if (file-executable-p "~/Development/golang/bin/ghq")
      (setq helm-ghq-command-ghq "~/Development/golang/bin/ghq"))
  (if (file-executable-p "/opt/local/bin/git")
      (setq helm-ghq-command-git "/opt/local/bin/git"))
  (if (file-executable-p "/opt/local/bin/hg")
      (setq helm-ghq-command-hg "/opt/local/bin/hg"))
  (if (file-executable-p "/opt/local/bin/svn")
      (setq helm-ghq-command-svn "/opt/local/bin/svn"))
  )
(use-package helm-c-yasnippet
  :ensure t
  :disabled t
  :config
  (setq helm-yas-space-match-any-greedy t)
  )
;; (require 'helm-config)
;; (require 'helm-bbdb)
