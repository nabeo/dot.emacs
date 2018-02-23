;; http://emacs-jp.github.io/programming/golang.html
(use-package go-mode
  :ensure t
  :if (executable-find "go")
  :init
  ;; set GOPATH
  (let ((my/gopath-env (getenv "GOPATH")))
    (if (and (eq my/gopath-env nil) (file-exists-p "~/Development/golang"))
        (setenv "GOPATH" (expand-file-name "~/Development/golang"))))

  ;; set PATH
  (cond ((file-exists-p (concat (getenv "GOPATH") "/bin"))
         (let ((my/gopath-bin (expand-file-name "bin" (getenv "GOPATH"))))
           (unless (member my/gopath-bin exec-path)
             (setq exec-path (cons my/gopath-bin
                                   exec-path))
             (setenv "PATH" (concat (getenv "PATH") ":" my/gopath-bin))))))
  :config
  ;; set commands
  (cond ((file-executable-p "/opt/local/bin/go")
         (setq go-command "/opt/local/bin/go")
         (setq godoc-command "/opt/local/bin/go doc")))
  (cond ((file-executable-p "/opt/local/bin/gofmt")
         (setq gofmt-command "/opt/local/bin/gofmt")))
  (cond ((file-executable-p "/opt/local/bin/godoc")
         (setq godoc-and-godef-command "/opt/local/bin/godoc")))
  ;; install by `go get github.com/rogpeppe/godef`
  (cond ((file-executable-p (concat (getenv "GOPATH") "/bin/godef"))
         (setq godef-command (concat (getenv "GOPATH") "/bin/godef"))))

  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "M-.") 'godef-jump)))
  )

(use-package go-snippets
  :ensure t
  :disabled t)

(use-package go-autocomplete
  :ensure t
  :config
  (require 'go-autocomplete))

(use-package go-eldoc
  :ensure t
  :config
  (cond ((file-executable-p (concat (getenv "GOPATH") "/bin/gocode"))
         (setq go-eldoc-gocode (concat (getenv "GOPATH") "/bin/gocode"))))
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package go-projectile
  :ensure t
  :if (locate-library "projectile")
  :config
  (with-eval-after-load 'projectile
    (require 'go-projectile)))

