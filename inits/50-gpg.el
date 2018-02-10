(use-package epa
  :config
  (epa-file-enable)
  )

(use-package pinentry
  :init
  (setenv "INSIDE_EMACS" "t")
  :config
  (pinentry-start))
  
(use-package auth-source
  :init
  (add-to-list 'auth-sources
               (expand-file-name
                (concat user-emacs-directory "secret/authinfo.gpg")))
  )

(use-package id-manager
  :ensure t
  :init
  ;; パスワードの保存先(gpgで暗号化されている)
  (setq idm-database-file "~/.emacs.d/secret/idm-db.gpg")
  )

(use-package pass
  :ensure t
  :if (executable-find "pass")
  :init
  :config
  )

(use-package password-store
  :if (executable-find "pass")
  :init
  :config
  )

(use-package helm-pass
  :ensure t
  :if (executable-find "pass")
  :after (pass helm)
  :init
  :config
  )
