;;; 30-ivy -- ivy/counsel
;;; Commentary:

;;; Code:
(use-package ivy
  :ensure t
  :bind
  (:map ivy-minibuffer-map
    ;; ESC でミニバッファを閉じる
    ("<escape>" . 'minibuffer-keyboard-quit))
  :custom
  (ivy-use-virutal-buffers t)
  (ivy-count-format "(%d/%d) ")
  :config
  ;; ミニバッファでコマンド発行を認める
  (when (setq enable-recursive-minibuffers t)
    (minibuffer-depth-indicate-mode 1))

  ;; magit
  (with-eval-after-load 'magit
    (setq magit-completing-read-function 'ivy-completing-read))
  )

(use-package counsel
  :ensure t
  :diminish ivy-mode counsel-mode
  :defines
  (projectile-completion-system magit-completing-read-function)
  :hook
  (after-init . ivy-mode)
  (ivy-mode . counsel-mode)
  :bind
  ("M-x" . 'counsel-M-x)
  ("M-y" . 'counsel-yank-pop)
  ("C-x b" . 'counsel-switch-buffer)
  ("C-M-z" . 'counsel-fzf)
  ("C-M-r" . 'counsel-recentf)
  ("C-x C-b" . 'counsel-ibuffer)
  ("C-M-f" . 'counsel-ag)
  ("C-x C-i" . 'counsel-semantic-or-imenu)
  :custom
  ;; `ivy-switch-buffer' (C-x b) のリストに recent files と bookmark を含める
  (ivy-use-virtual-buffers t)

  ;; プロンプトを折り返す
  (ivy-truncate-lines nil)

  ;; リスト先頭で `C-p' したらリストの最後に移動する
  (ivy-wrap t)

  ;; `counsel-find-file' で不要なファイルを表示しない
  (counsel-find-file-ignore-regexp (regexp-opt completion-ignored-extensions))
  :config
  )

(use-package ivy-hydra
  :ensure t
  :custom
  ;; M-o を ivy-hydra-read-action に割り当てる
  (ivy-read-action-function #'ivy-hydra-read-action)
  )

(use-package all-the-icons-ivy-rich
  :ensure t
  :init
  (all-the-icons-ivy-rich-mode 1)
  )

(use-package ivy-rich
  :ensure t
  :init
  (ivy-rich-mode 1)
  )

(use-package swiper
  :ensure t
  :bind
  ("C-s" . 'swiper)
  :custom
  (swiper-include-line-number-in-search t)
  :config
  ;; counsel-imenu で preview を有効にする
  (ivy-configure 'counsel-imenu
    :update-fn 'auto)
  )

(use-package avy
  :ensure t)

(use-package counsel-projectile
  :ensure t
  :init
  (counsel-projectile-mode 1)
  )

(use-package ivy-yasnippet
  :ensure t)

(use-package ivy-pass
  :ensure t)

(provide '30-ivy)
;;; 30-ivy ends here
