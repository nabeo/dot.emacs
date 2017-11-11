;; Last update is ....
;; Time-stamp: "Tue Sep 07 13:23:11 JST 2010"

;; Carbon Emacsで使用していたmac-print-bufferを使えるようにする

(my-load-path "~/site-lisp/cocoa/mac")

;; Carbon Emacs由来のelisp
;; (require 'htmlize)
;;(require 'mac-print-mode)

;; (mac-print-mode 1)
;; http://hmdt.jp/coral
;; (setq mac-print-coral-program "/Applications/coral.app/Contents/MacOS/coral")

(when (require 'mac-print-mode nil t)
  (mac-print-mode 1)
  ;; (global-set-key (kbd "M-p") 'mac-print-buffer-with-faces))
  (setq mac-print-coral-program "/Applications/coral.app/Contents/MacOS/coral"))