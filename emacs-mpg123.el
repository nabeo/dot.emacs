;; last update is ....
;; Time-stamp: "Tue Jul 15 11:19:23 JST 2008"
(autoload 'mpg123  "mpg123" "A Front-end to mpg123/ogg123" t)
;(load "~/site-lisp/id3.el")

; mpg123コマンド (MacPortsから)
(setq mpg123-mpg123-command "/opt/local/bin/mpg123")
;(setq mpg123-mpg123-command "/opt/local/bin/mpg321")
; 起動時の音量
(setq mpg123-startup-volume 70)
; 繰り返し回数、-1で永遠にくり返し
(setq mpg123-default-repeat -1)
; 起動時のディレクトリ
(setq mpg123-default-dir
	  (expand-file-name "/Users/nabeo/Music/mp3"))
; id3タグの文字コード
(setq mpg123-mpg123-id-coding-system "utf-8")
(setq mpg123-process-coding-system "utf-8")
; ヘルプを英語表示にする
(setq mpg123-lang 0)

(setq mpg123-lazy-check "\\.mp3$")