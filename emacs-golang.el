;; http://emacs-jp.github.io/programming/golang.html

;; set GOPATH
(setq gopath-env (getenv "GOPATH"))
(if (and (eq gopath-env nil) (file-exists-p "~/Development/golang"))
    (setenv "GOPATH" (expand-file-name "~/Development/golang")))

;; set PATH
(if (file-exists-p (concat (getenv "GOPATH") "/bin"))
    (setq exec-path (cons (concat (getenv "GOPATH") "/bin") exec-path)))

(with-eval-after-load 'go-mode
  (require 'go-autocomplete)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (define-key go-mode-map (kbd "M-.") 'godef-jump)
  (define-key go-mode-map (kbd "M-,") 'pop-tag-mark))
