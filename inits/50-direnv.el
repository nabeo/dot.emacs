(use-package direnv
  :ensure t
  :if (file-executable-p (concat (getenv "GOPATH") "/bin/direnv"))
  :config
  (direnv-mode)
  (setq direnv-always-show-summary t))
