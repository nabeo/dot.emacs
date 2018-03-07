(use-package direnv
  :ensure t
  :if (or (executable-find "direnv")
          (file-executable-p (concat (getenv "GOPATH") "/bin/direnv")))
  :config
  (direnv-mode)
  (setq direnv-always-show-summary t))
