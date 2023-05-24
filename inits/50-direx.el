;;; 50-direx --- direx-mode
;;; Commentary:

;;; Code:
;; http://cx4a.blogspot.jp/2011/12/popwineldirexel.html
;; https://github.com/m2ym/direx-el.git
(use-package direx
  :ensure t
  :after (popwin)
  :bind
  (("C-x C-j" . direx:jump-to-directory-other-window))
  :config
  ;; use with popwin
  (push '(direx:direx-mode :width 25 :dedicated t) popwin:special-display-config)
  )

(provide '50-direx)
;;; 50-direx.el ends here
