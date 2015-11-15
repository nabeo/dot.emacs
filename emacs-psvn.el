;; last update is ....
;; Time-stamp: "Fri Aug 21 21:17:59 JST 2009"

;; psvn.elのための設定

;; svn diffで呼ぶdiffの引数を設定する
;; デフォルトでは--ignore-eol-styleが指定されていてMac OS X付属のdiffでは使えなかった
(setq svn-status-default-diff-arguments "-x --ignore-all-space --ignore-blank-lines -Nau")