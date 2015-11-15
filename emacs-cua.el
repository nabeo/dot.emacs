;; last update is ....
;; Time-stamp: "Thu May 20 17:25:16 JST 2010"

;; http://www.gnu.org/software/emacs/manual/html_node/emacs/CUA-Bindings.html

;; nxhtmlモードと激しくバッティングするのでデフォルトではオフにしておく
;; (cua-mode)
;; (setq cua-enable-cua-keys nil)

;; 短形選択
;; C-enterで選択を始める、enterを押したところで短形選択が終了

;; 文字の挿入
;; 短形選択した状態でenterを押すと文字を挿入する場所がカーソルの右側と左側と交互に変更する

;; 連番挿入
;; 短形選択した状態でM-nするとミニバッファが連番挿入モードになる
;; 初期値、増加量、書式(%dが数字になる)を定義
;; 短形選択した領域が連番に起き替わる