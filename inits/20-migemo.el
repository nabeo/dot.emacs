(use-package migemo
  :ensure t
  :if (file-executable-p "/usr/local/bin/cmigemo")
  :config
  ;; cmigemoを使うための設定
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-ditionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)

  ;; Emacs 側のキャッシュをクリアする
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)

  ;; migemoの初期化
  (migemo-init)
  )
