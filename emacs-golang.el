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
(setq godef-command "/Users/nabeo/Development/golang/bin/godef")
(setq godoc-and-godef-command "/Users/nabeo/Development/golang/bin/godoc")

(cond ((locate-library "go-autocomplete")
       (require 'go-autocomplete)
       (require 'auto-complete-config)))
(cond ((locate-library "go-eldoc")
       (add-hook 'go-mode-hook 'go-eldoc-setup)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))
