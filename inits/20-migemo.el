;;; 20-migemo --- migemo
;;; Commentary:

;;; Code:
(use-package migemo
  :ensure t
  :if (file-executable-p (concat  my/homebrew-prefix "/bin/cmigemo"))
  :custom
  (migemo-pattern-alist-file (expand-file-name "~/.emacs.d/data/migemo-pattern"))
  (migemo-frequent-pattern-alist-file (expand-file-name "~/.emacs.d/data/migemo-frequent"))
  :config
  ;; cmigemoを使うための設定
  (setq migemo-command (concat  my/homebrew-prefix "/bin/cmigemo"))
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary (concat my/homebrew-prefix "/share/migemo/utf-8/migemo-dict"))
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

(provide '20-migemo)
;;; 20-migemo ends here
