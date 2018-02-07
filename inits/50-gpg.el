(use-package epa
  :config
  (epa-file-enable)
  ;; MacPortsでgnupg2をインストールしている場合
  ;; (setq epg-gpg-program "/opt/local/bin/gpg2")
  )

(use-package pinentry
  :init
  (setenv "INSIDE_EMACS" "t")
  :config
  (pinentry-start))
  
(use-package auth-source
  :init
  (setq auth-sources '("~/.emacs.d/secret/authinfo.gpg"))
  )

(use-package id-manager
  :ensure t
  :init
  ;; EasyPGで使うための設定
  ;; minibufferでパスワードを入力する場合
  (setenv "GPG_AGENT_INFO" nil)
  :config
  ;; パスワードを保存する
  ;; (setq epa-file-cache-passphrase-for-symmetric-encryption t)

  ;; パスワードの保存先(gpgで暗号化されている)
  (setq idm-database-file "~/.emacs.d/secret/idm-db.gpg")
  )
