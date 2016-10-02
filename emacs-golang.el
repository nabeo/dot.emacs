;; http://emacs-jp.github.io/programming/golang.html

;; set GOPATH
(setq gopath-env (getenv "GOPATH"))
(if (and (eq gopath-env nil) (file-exists-p "~/Development/golang"))
    (setenv "GOPATH" (expand-file-name "~/Development/golang")))

;; set PATH
(cond ((file-exists-p (concat (getenv "GOPATH") "/bin"))
       (setq exec-path (append exec-path '((concat (getenv "GOPATH") "/bin"))))
       (setenv "PATH" (concat (getenv "PATH") ":" (concat (getenv "GOPATH") "/bin")))
       ))

;; set commands
(setq go-command "/opt/local/bin/go")
(setq gofmt-command "/opt/local/bin/gofmt")
(setq godoc-command "/opt/local/bin/go doc")
(setq godoc-and-godef-command "/opt/local/bin/godoc")
;; install by `go get github.com/rogpeppe/godef`
(cond ((file-executable-p (concat (getenv "GOPATH") "/bin/godef"))
       (setq godef-command (concat (getenv "GOPATH") "/bin/godef"))))

(cond ((locate-library "go-autocomplete")
       (require 'go-autocomplete)
       (require 'auto-complete-config)))
(cond ((locate-library "go-eldoc")
       (cond ((file-executable-p (concat (getenv "GOPATH") "/bin/gocode"))
              (setq go-eldoc-gocode (concat (getenv "GOPATH") "/bin/gocode"))))
       (add-hook 'go-mode-hook 'go-eldoc-setup)))

(with-eval-after-load 'projectile
  (require 'go-projectile))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))
