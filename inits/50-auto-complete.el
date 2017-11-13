;; 本家
;; http://cx4a.org/software/auto-complete/index.ja.html
;; emacswiki
;; http://www.emacswiki.org/emacs/AutoComplete
;; 「Emacsのトラノマキ」連載第9回「auto-completeを使おう」(松山智大)
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part9

;; auto-complete v 1.3.1
(use-package auto-complete
  :ensure t
  :bind
  (("C-c TAB" . auto-complete))
  :config
  (use-package auto-complete-config)
  ;; (add-to-list 'ac-dictionary-directories
  ;;              "/Users/nabeo/local/emacs/site-lisp/auto-complete/ac-dict")
  (ac-config-default)

  ;; グローバルでauto-completeを使用
  (global-auto-complete-mode t)

  ;; 自動的に開始しない
  ;; (setq ac-auto-start nil)
  ;; 4文字以上をしたら自動補完を開始
  (setq ac-auto-start 4)
  ;; コンテキストに応じてTABで補完
  (ac-set-trigger-key "TAB")
  ;; 空気を読む
  (setq ac-dwim t)
  ;; 補完メニューが表示されているときは候補をC-n、C-pで選択
  (setq ac-use-menu-map t)                ; auto-complete v 1.3 から実験的に入った
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)

  ;; 曖昧マッチ
  (use-package fuzzy
    :ensure t
    :config
    (setq ac-use-fuzzy t))

  ;; 補完推測機能用の辞書
  (setq ac-comphist-file "~/.emacs.d/cache/ac-comphist.data")

  ;; my config
  ;; (setq ac-sources 
  ;;       '(;; start of default ac-sources
  ;;         ;; ac-source-filename
  ;;         ac-source-features
  ;;         ac-source-functions
  ;;         ;; ac-source-yasnippet
  ;;         ac-source-variables
  ;;         ac-source-symbols
  ;;         ac-source-abbrev
  ;;         ac-source-dictionary
  ;;         ;; ac-source-words-in-same-mode-buffers

  ;;         ;; start of added sources to default
  ;;         ac-source-gtags
  ;;         ac-source-css-property))

  ;; ruby-modeでendを入力したら補完を中止する
  (add-hook 'ruby-mode-hook
            (lambda ()
              (make-local-variable 'ac-ignores)
              (add-to-list 'ac-ignores "end")))
  )

