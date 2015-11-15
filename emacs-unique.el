;; Last update is ....
;; Time-stamp: "Sat Jan 19 22:35:22 JST 2013"

;; http://d.hatena.ne.jp/sugyan/20100515/1273909863
;; http://www.bookshelf.jp/cgi-bin/goto.cgi?file=meadow&node=uniquify
;; buffer-name を unique で識別しやすくなるように設定する
(require 'uniquify)
(setq unique-buffer-name-sytle 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

(setq uniquify-min-dir-content t)
