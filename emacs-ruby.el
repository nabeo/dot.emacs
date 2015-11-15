;; last update is ....
;; Time-stamp: "Wed Aug 19 23:03:14 JST 2015"

;; ruby用のlispファイルを格納している
;; (my-load-path "~/site-lisp/ruby")

;; ruby-mode.elの設定
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
	  (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist
	  (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
;; (autoload 'ruby-ruby "inf-ruby"
;;   "Run an inferiro Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;;   "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;; 		  '(lambda ()
;; 			 (inf-ruby-keys)))

;; inf-ruby.el for ruby193
;; (setq ruby-program-name "/Users/nabeo/local/ruby193/bin/irb193 --inf-ruby-mode")

;; refe.el
;; (require 'refe)

;; ruby-style.el
(require 'ruby-style)
(add-hook 'c-mode-hook 'ruby-style-c-mode)
(add-hook 'c++-mode-hook 'ruby-style-c-mode)

;; rubydb3x.el for ruby193
;; (autoload 'rubydb "rubydb3x")
;; (setq rubydb-command-name "/Users/nabeo/local/ruby193/bin/ruby193")

;; ruby-block
;; http://www.emacswiki.org/cgi-bin/wiki/ruby-block.el
;; wget http://www.emacswiki.org/emacs/download/ruby-block.el
(require 'ruby-block)
(ruby-block-mode t)
;; do overlay
;; (setq ruby-block-highlight-toggle 'overlay)
;; display to minibuffer
;; (setq ruby-block-highlight-toggle 'minibuffer)
;; do overlay and display to minibuffer
(setq ruby-block-highlight-toggle t)

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (ruby-electric-mode t)
             (if (eq emacs-bzr-p t)
                 (progn
                   (abbrev-mode 1)
                   (electric-pair-mode t)
                   (electric-indent-mode t)
                   (electric-layout-mode t)))))

;; ruby用のc-modeの設定
;; (c-add-style "ruby" '("bsd"
;; 					  (c-basic-offset . 4)
;; 					  (c-offsets-alist (class-label . 2)
;; 									   (label . 2)
;; 									   (statement-case-intro . 2)
;; 									   (statement-case-open . 2))))
;; (defun my-c-mode-for-ruby-hook ()
;;   (c-set-style "ruby"))
;; (add-hook 'c-mode-hook 'my-c-mode-for-ruby-hook)

;; hideshow.elを使ったアウトラインモード
;; http://www.bookshelf.jp/pukiwiki/pukiwiki.php?cmd=read&page=Elisp%2Fhideshow.el
;;   hs-hide-block                      C-c @ C-h
;;   hs-show-block                      C-c @ C-s
;;   hs-hide-all                        C-c @ C-M-h
;;   hs-show-all                        C-c @ C-M-s
;;   hs-hide-level                      C-c @ C-l
;;   hs-toggle-hiding                   C-c @ C-c
;;   hs-mouse-toggle-hiding             [(shift mouse-2)]
;;   hs-hide-initial-comment-block
(add-hook 'ruby-mode-hook
		  '(lambda ()
			 (hs-minor-mode t)))
(let ((ruby-mode-hs-info
	   '(ruby-mode
		 "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
		 "end"
		 "#"
		 ruby-move-to-block
         nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
	  (setq hs-special-modes-alist
			(cons ruby-mode-hs-info hs-special-modes-alist))))

;; rsense (ruby-1.9.2)
;; (my-load-path "~/site-lisp/rsense/etc")
;; (setenv "RSENSE_HOME" (expand-file-name "~/site-lisp/rsense"))
;; (setq rsense-home (expand-file-name (getenv "RSENSE_HOME")))
;; (setq rsense-rurema-home "~/site-lisp/rsense/doc/ruby-refm")
;; (require 'rsense)
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             ;; C-c , : ポイントしている式の型を表示
;;             (local-set-key (kbd "C-c d") 'rsense-type-help)
;;             ;; C-c j : 定義元ジャンプ
;;             (local-set-key (kbd "C-c j") 'rsense-jump-to-definition)))
;; auto-completeを使用しない場合
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             ;; C-c . : 補完を開始する
;;             (local-set-key (kbd "C-c .") 'rsense-complete)))
;; auto-completeを使用する場合
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             ;; C-c . : 補完を開始する
;;             (local-set-key (kbd "C-c .") ac-complete-rsense)
;;             ;; .や::を入力した直後に自動的に補完を開始する
;;             (add-to-list 'ac-sources 'ac-sources-rsense-method)
;;             (add-to-list 'ac-sources 'ac-sources-rsense-constant)))
