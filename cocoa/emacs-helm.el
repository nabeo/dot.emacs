;; Last update is ....
;; Time-stamp: "Sun Nov 15 14:52:35 JST 2015"

;; https://github.com/emacs-helm/helm
;; (my-load-path "~/site-lisp/cocoa/helm")
;; -> ~/local/emacs/site-lisp/helm
;; (my-load-path "~/site-lisp/cocoa/helm-ext")
;; -> ~/local/emacs/site-lisp/helm-ext
(require 'helm-config)
(require 'helm-bbdb)
(require 'helm-elscreen)
(helm-mode 1)

;; from emacs-helm.sh
(define-key global-map [remap list-buffers] 'helm-buffers-list)
;; (define-key global-map [remap find-file] 'helm-find-files)
;; (define-key global-map [remap occur] 'helm-occur)
;; (define-key lisp-interaction-mode-map [remap indent-for-tab-command] 'helm-lisp-completion-at-point-or-indent)
;; (define-key emacs-lisp-mode-map       [remap indent-for-tab-command] 'helm-lisp-completion-at-point-or-indent)

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
(setq helm-sources (list helm-c-source-buffers-list
                         helm-c-source-files-in-current-dir
                         helm-c-source-file-name-history
                         helm-c-source-file-cache
                         helm-c-source-etags-select
                         ;; helm-c-source-locate
                         ;; helm-c-source-info-id-utils
                         ;; helm-c-source-info-pages
                         helm-source-bbdb
                         helm-c-source-elscreen))

;; keymap
(eval-after-load "elscreen"
  '(progn
     (define-key global-map (kbd "C-z SPC") 'helm-elscreen)))


;; override kdb
(eval-after-load "helm-files"
  '(progn
     (define-key helm-find-files-map (kbd "C-h C-b") nil)
     (define-key helm-find-files-map (kbd "C-h C-d") nil)
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))
(eval-after-load "helm"
  '(progn
     (define-key helm-map (kbd "C-h C-b") nil)
     (define-key helm-map (kbd "C-h C-h") nil)
     (define-key helm-map (kbd "C-h h") nil)
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))

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

;; anything-books.el
;; https://github.com/kiwanami/emacs-anything-books
;; http://d.hatena.ne.jp/kiwanami/20101117/1290015869
;; http://d.hatena.ne.jp/kiwanami/20101126/1290765338
     
;; (require 'anything-books)
;; (setq abks:books-dir "~/Documents/pdf") ; PDFファイルを格納しているディレクトリ
;; (global-set-key (kbd "M-8") 'helm-books-command)
;; (setq abks:cache-pixel "600")
;; (setq abks:mkcover-cmd '("qlmanage" "-t" pdf "-s" size "-o" dir))
;; (setq abks:mkcover-image-ext ".png")
;; (setq abks:open-command "open") ; 標準のプログラムを使う

;; howm と anything-books.el を連携させる
;; (eval-after-load "howm"
;;   '(progn
;;      (defvar abks:howm-title-format   '("BOOK " title))
;;      (defvar abks:howm-content-format '(">>>" file))
;;
;;      (defun abks:howm-open (file)
;;        (let* ((data `((title . ,(hbks:file-to-title file)) (file . ,file)))
;;               (howm-title (apply 'concat (abks:list-template abks:howm-title-format data)))
;;               (howm-content (apply 'concat (abks:list-template abks:howm-content-format data)))
;;               (howm-items (howm-folder-grep howm-directory (regexp-quote howm-title))))
;;          (cond
;;           ((null howm-items) ; create
;;            (howm-create-file-with-title howm-title nil nil nil howm-content))
;;           ((eql 1 (length howm-items)) ; open
;;            (howm-view-open-item (car howm-items)))
;;           (t ; list
;;            (howm-view-summary "Helm Books" howm-items)))))
;; 
     ;; register howm action
;;      (setq anything-books-actions 
;;            (append anything-books-actions
;;                    '(("Open a howm item" . (lambda (f) (abks:howm-open f))))))
;;      ))
