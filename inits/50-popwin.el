;; http://d.hatena.ne.jp/m2ym/20110120/1295524932
;; https://github.com/m2ym/popwin-el.git
(use-package popwin
  :ensure t
  :config
  (setq display-buffer-function 'popwin:display-buffer)
  (setq popwin:popup-window-height 10)

  (setq helm-samewindow nil)
  (setq anything-samewindow nil)
  (push '("*anything*" :height 20) popwin:special-display-config)
  (push '("*markdown-output" :height 20) popwin:special-display-config)
  ;; (push '("*BBDB*" :height 20) popwin:special-display-config)
  )


