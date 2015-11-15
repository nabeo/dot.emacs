;; Last update is ....
;; Time-stamp: "Sat Jan 19 21:55:56 JST 2013"

;; http://cx4a.blogspot.jp/2011/12/popwineldirexel.html
;; https://github.com/m2ym/direx-el.git
(require 'direx)

(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
;; use with popwin
(push '(direx:direx-mode :width 25 :dedicated t)
      popwin:special-display-config)
