;; last update is ....
;; Time-stamp: "Fri Oct 15 12:38:11 JST 2010"

;; 使えるフォントのリストを調べる 
;; (insert (prin1-to-string (x-list-fonts "*")))

;; フォントが使用可能か調べる
;; (find-font (font-spec :family "ヒラギノ角ゴ ProN"))

;; http://blog.iwa-ya.net/2010/02/20/091647

;; Osakaを等幅で使う
;; (set-face-attribute 'default nil
;;                     :family "Monaco"
;;                     :height 120)
;; (set-fontset-font "fontset-default"
;;                   'japanese-jisx0208
;;                   '("Osaka" . "iso10646-1"))
;; (set-fontset-font "fontset-default"
;;                   'katakana-jisx0201
;;                   '("Osaka" . "iso10646-1"))
;; (setq face-font-rescale-alist
;;       '((".*Monaco-bold.*" . 1.0)
;;         (".*Monaco-medium.*" . 1.0)
;;         (".*Osaka-bold.*" . 1.2)
;;         (".*Osaka-medium.*" . 1.2)
;;         ("-cdac$" . 1.4)))

(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; fontsetを定義する
;; http://sakito.jp/emacs/emacs23.html#id15
;; Inconsalata Fontとタカオ Fontの組み合わせ (fontset-myinconsolata)
(create-fontset-from-ascii-font 
 "Inconsolata:weight=normal:slant=normal:size=14"
 nil
 "myinconsolata")
(set-fontset-font "fontset-myinconsolata"
                  'japanese-jisx0208
                  (font-spec :family "TakaoExGothic" :size 14)
                  nil
                  'append)
(set-fontset-font "fontset-myinconsolata"
                  'katakana-jisx0201
                  (font-spec :family "TakaoExGothic" :size 14)
                  nil
                  'append)

;; Monaco と MigMix の組み合わせ (fontset-mymigmix)
(create-fontset-from-ascii-font
 "Monaco:weight=normal:slant=normal"
 nil
 "mymigmix")
(set-fontset-font "fontset-mymigmix"
                  'japanese-jisx0208
                  '("MigMix_1M" . "iso10646-1"))
(set-fontset-font "fontset-mymigmix"
                  'katakana-jisx0201
                  '("MigMix_1M" . "iso10646-1"))

;; デフォルトの fontset を定義
;; http://macemacsjp.sourceforge.jp/matsuan/FontSettingJp.html#3
(add-to-list 'default-frame-alist '(font . "fontset-myinconsolata"))
;; デフォルトの fontset を再定義(上書き)
;; (setcdr (assoc 'font default-frame-alist) "fontset-inconsolata")
;; アクティブなフレームのみに適用する
;; (set-frame-font "fontset-mymigmix")
