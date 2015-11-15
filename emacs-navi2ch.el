;; last update is ....
;; Time-stamp: "Sun Jan 16 01:04:13 JST 2011"

(require 'navi2ch)
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)
(setq navi2ch-list-bbstable-url "http://menu.2ch.net/bbsmenu.html")

;; navi2chのデータはDropbox上に置いておく
(setq navi2ch-directory "~/Dropbox/emacs/navi2ch")
;; データを消さない
(setq navi2ch-board-expire-date nil)

;; IPA Mona フォントを使う
(setq navi2ch-mona-use-ipa-mona t)
(setq navi2ch-mona-ipa-mona-font-family-name "IPAMonaGothic")

;; Iしたときに少しでも早い時間で処理が完了できるように
(setq navi2ch-bookmark-fetch-mark-article-check-update t)
(setq navi2ch-net-enable-http11 t)

;; (require 'navi2ch-mona)
;; (add-hook 'navi2ch-article-arrange-message-hook
;;           'navi2ch-mona-arrange-message)
;; (setq navi2ch-mona-enable t)
;; (setq navi2ch-mona-face-variable 'navi2ch-mona16-face)

;; 画像のサムネイル表示 (navi2ch-thumbnail.el)
;; ImageMagickがインストールされていることが前提
;; 使い方、兼キーバインド
;;
;; URLにカーソルがある状態で','を押すとサムネイル挿入. サムネイルにカー
;; ソルがある状態で','を押すと外部ビューアーでオリジナル画像表示(本当は
;; enterキーでやるほうが奇麗な気もする)
;;
;; サムネイルにカーソルがある状態で'v'で画像を保存(サムネイルではなく、
;; 元の大きい画像)
;;
;; Esc+EnterでURLをブラウザで開く(既存機能に丸投げ)。画像ビューアーが指
;; 定されてると、そのURLを開くのでリモートなファイルを開けるビューアー
;; が必要(元々その動作)
;;
;; サムネイルにカーソルがある状態で'D'を押すとキャッシュ画像を削除. 既
;; にキーバインドがダブってるが、分かりやすさでオーバーライド(要検討)
;;
;; 'T'を押すとカーソルがあるレス1個のレス内のURLを全取得
(load "navi2ch-thumbnail")
(setq navi2ch-thumbnail-image-convert-program "/opt/local/bin/convert")
(setq navi2ch-thumbnail-image-identify-program "/opt/local/bin/identify")
(setq navi2ch-thumbnail-thumbnail-directory "~/Dropbox/emacs/navi2ch/thumbnails/")