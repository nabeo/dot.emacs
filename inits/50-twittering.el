(use-package twittering-mode
  :ensure t
  :disabled t
  :config
  ;; for debuggin (ignore certficate file)
  ;; (setq twittering-allow-insecure-server-cert t)

  (setq twittering-use-master-password t)
  (setq twittering-private-info-file
        (expand-file-name "~/Dropbox/emacs/twittering-mode/twittering-mode-oauth.gpg"))

  (auto-compression-mode t)
  (setq twittering-icon-storage-file
        (expand-file-name "data/twittering-mode-icons.gz"
                          user-emacs-directory))
  (setq twittering-use-icon-storage t)
  )
