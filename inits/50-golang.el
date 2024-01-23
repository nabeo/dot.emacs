;;; 50-golang --- golang
;;; Commentary:

;;; Code:
;; http://emacs-jp.github.io/programming/golang.html
(use-package go-mode
  :ensure t
  :if (executable-find "go")
  :init
  ;; set GOPATH
  (let ((my/gopath-env (getenv "GOPATH")))
    (if (and (eq my/gopath-env nil) (file-exists-p "~/Development/golang"))
      (setenv "GOPATH" (expand-file-name "~/Development/golang"))))
  (if (eq (member (expand-file-name "~") (s-split ":" (getenv "GOPATH"))) nil)
      (setenv "GOPATH" (concat (getenv "GOPATH") ":" (expand-file-name "~"))))

  :hook
  (( before-save . gofmt-before-save ))

  :config
  )

(use-package go-snippets
  :ensure t
  :disabled t)

(use-package go-eldoc
  :ensure t
  :hook (go-mode . go-eldoc-setup))

(use-package go-projectile
  :ensure t
  :if (locate-library "projectile")
  :after (projectile)
)

(provide '50-golang)
;;; 50-golang.el ends here
