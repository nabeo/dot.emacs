;; last update is ....
;; Time-stamp: "Fri Feb 04 23:38:08 JST 2011"

;; ~/.emacs.d/cocoa/emacs-fonts.el だとうまく行かない
(setq fixed-width-use-QuickDraw-for-ascii t)
(setq mac-allow-anti-aliasing t)
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 140)
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0208
 '("TakaoExGothic" . "iso10646-1"))
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0212
 '("TakaoExGothic" . "iso10646-1"))
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0213.2004-1
 '("TakaoExGothic" . "iso10646-1"))
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0213-2
 '("TakaoExGothic" . "iso10646-1"))
 ;;; Unicode フォント
(set-fontset-font
 (frame-parameter nil 'font)
 'mule-unicode-0100-24ff
 '("monaco" . "iso10646-1"))
