(use-package helm
  :ensure t
  :bind
  (("C-h" . delete-backward-char)
   ("M-x" . helm-M-x)
   ([remap list-buffers] . helm-buffers-list)
   ([remap find-file] . helm-find-files)
   ([remap occur] . helm-occur)
   :map lisp-interaction-mode-map
   ([remap completion-at-point] . helm-lisp-completion-at-point)
   :map emacs-lisp-mode-map
   ([remap completion-at-point] . helm-lisp-completion-at-point))
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  )

(use-package helm-etags+
  :ensure t
  :bind
  (("M-." . helm-etags+-select-one-key)
   ("M-*" . helm-etags+-history)
   ("M-," . helm-etags+-history-action-go-back)
   ("M-/" . helm-etags+-history-action-go-forward))
  :config
  (setq helm-etags+-use-short-file-name nil)
  (setq tags-table-list '("~/git/utilities/ruby/tags"))
)
(use-package helm-elscreen
  :ensure t
  :config
  (eval-after-load "elscreen"
  '(progn
     (global-set-key (kbd "C-z SPC") 'helm-elscreen)))
  )
(use-package helm-swoop
  :ensure t
  :bind
  (;; basic key-bind
   ("M-i" . helm-swoop)
   ("C-x M-i" . helm-multi-swoop)
   ;; When doing isearch, hand the word over to helm-swoop
   ("M-i" . helm-swoop-from-isearch)
   ;; from helm-swoop to helm-multi-swoop-all
   ("M-i" . helm-multi-swoop-all-from-helm-swoop))
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
  :bind
  (("C-c y" . helm-yas-complete))
  :config
  (setq helm-yas-space-match-any-greedy t)
  )

;; (require 'helm-config)
;; (require 'helm-bbdb)
