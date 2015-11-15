;; Last update is ....
;; Time-stamp: "Sun Dec 09 21:17:27 JST 2012"

;; elispを読み込み
;; (require 'anything-config)
(require 'anything-startup)
;; (require 'anything)

;; anything-books.el
;; http://d.hatena.ne.jp/kiwanami/20101117/1290015869
;; http://d.hatena.ne.jp/kiwanami/20101126/1290765338
;; install by auto-install.el
;; (auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/deferred.el")
;; (auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/concurrent.el")
;; (auto-install-from-url "https://github.com/kiwanami/emacs-anything-books/raw/master/anything-books.el")
     
(require 'anything-books)
(setq abks:books-dir "~/Documents/pdf") ; PDFファイルを格納しているディレクトリ
(global-set-key (kbd "M-8") 'anything-books-command)
(setq abks:cache-pixel "600")
(setq abks:mkcover-cmd '("qlmanage" "-t" pdf "-s" size "-o" dir))
(setq abks:mkcover-image-ext ".png")
(setq abks:open-command "open") ; 標準のプログラムを使う

;; howm と anything-books.el を連携させる
(eval-after-load "howm"
  '(progn

     (defvar abks:howm-title-format   '("BOOK " title))
     (defvar abks:howm-content-format '(">>>" file))

     (defun abks:howm-open (file)
       (let* ((data `((title . ,(abks:file-to-title file)) (file . ,file)))
              (howm-title (apply 'concat (abks:list-template abks:howm-title-format data)))
              (howm-content (apply 'concat (abks:list-template abks:howm-content-format data)))
              (howm-items (howm-folder-grep howm-directory (regexp-quote howm-title))))
         (cond
          ((null howm-items) ; create
           (howm-create-file-with-title howm-title nil nil nil howm-content))
          ((eql 1 (length howm-items)) ; open
           (howm-view-open-item (car howm-items)))
          (t ; list
           (howm-view-summary "Anything Books" howm-items)))))

     ;; register howm action
     (setq anything-books-actions 
           (append anything-books-actions
                   '(("Open a howm item" . (lambda (f) (abks:howm-open f))))))
     ))

;; 以下、不要な設定
;; anything-sourcesで使用する外部elispファイルへのload-path
;; (my-load-path "~/site-lisp/cocoa/anything-sources")

;; anything-sourcesで使用する外部elispファイルを読み込む
;; (require 'anything-c-source-goto-line)

;; キーバインドの設定
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "C-v") 'anything-previous-source)
;; (global-set-key (kbd "C-;") 'anything)

;; anything-sourcesの登録
;; (setq anything-sources (list anything-c-source-buffers
;; 							 anything-c-source-file-name-history
;;                              ;; anything-c-source-recentf
;; 							 anything-c-source-files-in-current-dir
;; 							 anything-c-source-emacs-commands
;; 							 anything-c-source-emacs-functions
;;                              ;; anything-c-source-bookmarks
;; 							 anything-c-source-locate
;; 							 anything-c-source-mac-spotlight
;; 							 anything-c-source-bbdb
;;                              ;; anything-c-source-goto-line ; anything-c-source-goto-line.elc
;; 							 ;; anything-c-source-yasnippet
;;                              ))
