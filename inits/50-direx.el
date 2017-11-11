;; http://cx4a.blogspot.jp/2011/12/popwineldirexel.html
;; https://github.com/m2ym/direx-el.git
(use-package direx
  :ensure t
  :bind
  (("C-x C-j" . direx:jump-to-directory-other-window))
  :config
  ;; use with popwin
  (with-eval-after-load 'popwin
    (push '(direx:direx-mode :width 25 :dedicated t)
          popwin:special-display-config))
  )
