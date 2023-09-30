;;; 50-direnv -- emacs-direnv
;;; Commentary:

;;; Code:
(use-package envrc
  :ensure t
  :if (or (executable-find "direnv")
          (file-executable-p (concat (getenv "GOPATH") "/bin/direnv")))
  :hook
  (after-init . envrc-global-mode)
)

(provide '50-direnv)
;;; 50-direnv.el ends here
