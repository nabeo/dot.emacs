(use-package dired
  :init
  (load "dired-x")
  :config
  ;; RETキーでバッファを新規に作成しない
  ;; http://www.pshared.net/diary/20071207.html#p02
  (put 'dired-find-alternate-file 'disabled nil)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map "a" 'dired-advertised-find-file)

  ;; 再帰コピーと再帰削除
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)

  ;; diredの代わりにdired-xを使う
  ;; (add-hook 'dired-load-hook
  ;; 		  (function (lambda ()
  ;; 					  (load "dired-x")
  ;; 					  ;; set global variables here.
  ;; 					  ;; ex)
  ;; 					  ;; (setq dired-guess-shell-gnutar "gtar")
  ;; 					  )))
  ;; (add-hook 'dired-mode-hook
  ;; 		  (function (lambda ()
  ;; 					  ;; set buffer-local variables here.
  ;; 					  ;; ex)
  ;; 					  ;; (dired-omit-mode 1)
  ;; 					  )))
  )
