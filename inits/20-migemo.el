;;; 20-migemo --- migemo
;;; Commentary:

;;; Code:
(use-package migemo
  :ensure t
  :if (file-executable-p "/usr/local/bin/cmigemo")
  :custom
  (migemo-pattern-alist-file (expand-file-name "~/.emacs.d/data/migemo-pattern"))
  (migemo-frequent-pattern-alist-file (expand-file-name "~/.emacs.d/data/migemo-frequent"))
  :config
  ;; cmigemoを使うための設定
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)

  ;; Emacs 側のキャッシュをクリアする
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)

  ;; migemoの初期化
  (load-library "migemo")
  (migemo-init)
  )

(use-package swiper-migemo
  :load-path "~/.emacs.d/site-lisp/swiper-migemo"
  :disabled t
  :config
  (migemo-kill)
  (migemo-init)
  (global-swiper-migemo-mode +1)
  )

(provide '20-migemo)
;;; 20-migemo ends here
