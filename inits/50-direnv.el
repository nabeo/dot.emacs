;;; 50-direnv -- emacs-direnv
;;; Commentary:

;;; Code:
(use-package direnv
  :ensure t
  :if (or (executable-find "direnv")
        (file-executable-p (concat (getenv "GOPATH") "/bin/direnv")))
  :custom
  (direnv-always-show-summary t)
  :config
  (direnv-mode))

(provide '50-direnv)
;;; 50-direnv.el ends here
