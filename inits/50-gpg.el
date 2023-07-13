;;; 50-gpg --- GnuPG
;;; Commentary:

;;; Code:
(use-package epa
  :config
  (epa-file-enable)
  (setq epa-pinentry-mode 'loopback)
  )

(use-package pinentry
  :ensure t
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
  (push '("ID-Password List") popwin:special-display-config)
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
(use-package auth-password-store
  :ensure t
  :if (executable-find "pass")
  :disabled t
  :after (pass)
  :init
  :config
  (auth-pass-enable)
  )

(provide '50-gpg)
;;; 50-gpg.el ends here
