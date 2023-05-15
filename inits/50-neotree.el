;; source : https://github.com/jaypei/emacs-neotree
(use-package neotree
  :ensure t
  :disabled t
  :after (all-the-icons)
  :bind (("<f8>" . neotree-toggle))
  :config
  ;; 隠しファイルをデフォルトで表示
  (setq neo-show-hidden-files t)

  ;; neotree でファイルを新規作成した後、自動的にファイルを開く
  (setq neo-create-file-auto-open t)

  ;; delete-other-window で neotree ウィンドウを消さない
  (setq neo-persist-show t)

  ;; キーバインドをシンプルにする (default は prefix として C-c が必要)
  ;; C ルートディレクトリの変更
  ;; c,+,p ファイル作成
  ;; d ファイル削除
  ;; r ファイル名変更
  ;; e ディレクトリを開く
  (setq neo-keymap-style 'concise)

  ;; vc-mode integration
  (setq neo-vc-integration '(face char))

  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))

  (when neo-persist-show
    (add-hook 'popwin:before-popup-hook
              (lambda () (setq neo-persist-show nil)))
    (add-hook 'popwin:after-popup-hook
              (lambda () (setq neo-persist-show t))))
  )
