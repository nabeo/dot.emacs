;; last update is ....
;; Time-stamp: "Mon Feb 15 19:13:44 JST 2010"

(my-load-path "~/site-lisp/anything")

;; (require 'yasnippet)
(require 'anything-config)
;; (require 'anything-c-yasnippet)
;; (yas/load-directory "~/.emacs.d/snippets")

;; (global-set-key "\C-cy" 'anything-c-yas-complete)

;; (setq anything-c-yas-space-match-any-greedy t)

(setq anything-sources (list anything-c-source-buffers
							 anything-c-source-file-name-history
                             ;;anything-c-source-recentf
							 anything-c-source-files-in-current-dir
							 anything-c-source-emacs-commands
							 anything-c-source-emacs-functions
                             ;;anything-c-source-bookmarks
							 anything-c-source-locate
							 anything-c-source-mac-spotlight
							 anything-c-source-bbdb
                             ;;anything-c-source-yasnippet
                             ))

(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "C-v") 'anything-previous-source)
(global-set-key (kbd "C-;") 'anything)

;; yasnippet特有の設定
;; (load "~/.emacs.d/emacs-yasnippet.el")

;; color-moccur.elの設定
;; http://www.bookshelf.jp/elc/color-moccur.el
(require 'color-moccur)
;; 複数の検索語や、特定のフェイスのいマッチ等の機能を有効にする
;; 詳細はhttp://www.bookshelf.jp/soft/meadow_50.html#SEC751
(setq moccur-split-word t)
;; migemoがrequireできる環境ならmigemoを使う
(when (require 'migemo nil t) ; 第三引数がnon-nilだとloadできなかった場合にエラーではなくnilを返す
  (setq moccur-use-migemo t))

;; anything-c-moccurの設定
;; http://d.hatena.ne.jp/IMAKADO/20080724/1216882563
(require 'anything-c-moccur)
(setq anything-c-moccur-anything-idle-delay 0.2 ; `anything-idle-delay'
      anything-c-moccur-higlight-info-line-flag t ; `anything-c-moccur-dmoccur'などのコマンドでバッファの表示をハイライト
      anything-c-moccur-enable-auto-lock-flag t ; 現在選択中の候補の位置を他のwindowに表示
      anything-c-moccur-enable-initial-pattern t) ; `anything-c-moccur-occur-by-moccur'の起動時にポイントの位置の単語を初期パターンにする

;; キーバインドの設定 for anything-c-moccur
(global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur) ; バッファ内検索
(global-set-key (kbd "C-M-o") 'anything-c-moccur-dmoccur) ; ディレクトリ内検索
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "O") 'anything-c-moccur-dired-do-moccur-by-moccur)))