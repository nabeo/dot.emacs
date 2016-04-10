(require 'helm-config)
(require 'helm-bbdb)
(require 'helm-elscreen)
(helm-mode 1)
(helm-autoresize-mode 1)

;; key bind config
(global-set-key [remap list-buffers] 'helm-buffers-list)
(global-set-key [remap find-file] 'helm-find-files)
(global-set-key [remap occur] 'helm-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
;; (define-key lisp-interaction-mode-map
;;   [remap indent-for-tab-command]
;;   'helm-lisp-completion-at-point-or-indent)
;; (define-key emacs-lisp-mode-map
;;   [remap indent-for-tab-command]
;;   'helm-lisp-completion-at-point-or-indent)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; helm-etags+
;; https://github.com/jixiuf/helm-etags-plus
(cond ((file-exists-p "~/site-lisp/cocoa/helm-ext/helm-etags+.el")
       (require 'helm-etags+)
       (setq helm-etags+-use-short-file-name nil)
       (global-set-key "\M-." 'helm-etags+-select-one-key)
       (global-set-key "\M-*" 'helm-etags+-history)
       (global-set-key "\M-," 'helm-etags+-history-action-go-back)
       (global-set-key "\M-/" 'helm-etags+-history-action-go-forward)
       (setq tags-table-list '("~/git/utilities/ruby/tags"))))

;; for infos
;; (setq helm-default-info-index-list
;;       (cons "magit"
;;             helm-default-info-index-list))
;; (setq helm-default-info-index-list
;;       (cons "bbdb"
;;             helm-default-info-index-list))
;; (setq helm-default-info-index-list
;;       (cons "auctex"
;;             helm-default-info-index-list))
;; (setq helm-default-info-index-list
;;       (cons "emacs-w3m-ja"
;;             helm-default-info-index-list))
;; (setq helm-default-info-index-list
;;       (cons "wl-ja"
;;             helm-default-info-index-list))

;; helm-sources
;; (setq helm-sources (list
;;                     helm-source-files-in-current-dir
;;                     helm-source-file-name-history
;;                     helm-source-file-cache
;;                     helm-source-buffers-list
;;                     helm-source-locate
;;                     helm-source-bbdb
;;                     helm-source-elscreen
;; ))

;; helm-elscreen
(eval-after-load "elscreen"
  '(progn
     (global-set-key (kbd "C-z SPC") 'helm-elscreen)))

;; helm-swoop
(cond ((locate-library "helm-swoop")
       (require 'helm-swoop)
       ;; basic key-bind
       (global-set-key (kbd "M-i") 'helm-swoop)
       (global-set-key (kbd "C-x M-i") 'helm-multi-swoop)
       ;; When doing isearch, hand the word over to helm-swoop
       (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
       ;; from helm-swoop to helm-multi-swoop-all
       (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)))

;; helm-ghq
(cond ((locate-library "helm-ghq")
       (require 'helm-ghq)
       (if (file-executable-p "~/Development/golang/bin/ghq")
           (setq helm-ghq-command-ghq "~/Development/golang/bin/ghq"))
       (if (file-executable-p "/opt/local/bin/git")
           (setq helm-ghq-command-git "/opt/local/bin/git"))
       (if (file-executable-p "/opt/local/bin/hg")
           (setq helm-ghq-command-hg "/opt/local/bin/hg"))
       (if (file-executable-p "/opt/local/bin/svn")
           (setq helm-ghq-command-svn "/opt/local/bin/svn"))
       ))
