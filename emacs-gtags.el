;; last update is ....
;; Time-stamp: "Tue Jul 15 15:53:51 JST 2008"

(autoload 'gtags-mode "gtags" "" t)

(global-set-key "\M-g" 'gtags-find-tag) ; 関数の定義元へジャンプ
(global-set-key "\M-r" 'gtags-find-rtag) ; 関数の参照先へジャンプ
(global-set-key "\M-s" 'gtags-find-symbol) ; 関数の定義元/参照先へジャンプ
(global-set-key "\M-p" 'gtags-find-pattern)
;(global-set-key "\M-f" 'gtags-find-file) ; ファイルにジャンプ
;(global-set-key "\C-," 'gtags-pop-stack) ; 前のバッファに戻る