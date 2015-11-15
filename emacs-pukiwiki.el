;; last update is ....
;; Time-stamp: "Tue Jun 03 20:14:04 JST 2008"
(my-load-path "~/site-lisp/pukiwiki-mode")

; 各モードを有効にする
(setq pukiwiki-auto-insert t)
(autoload 'pukiwiki-edit "pukiwiki-mode" "pukiwiki-mode." t)
(autoload 'pukiwiki-index "pukiwiki-mode" "pukiwiki-mode." t)
(autoload 'pukiwiki-edit-url "pukiwiki-mode" "pukiwiki-mode." t)

; 編集するサイトのリスト
(setq pukiwiki-site-list
	  '(
		("Gram Wiki"
		 "http://storage00.lan.graminc.co.jp/pwiki/index.php"
		 nil utf-8)
	  ))


; バックアップデータを作っておく
(setq pukiwiki-save-post-data t)
(setq pukiwiki-directory "~/.emacs.d/pukiwiki-mode.backup")

