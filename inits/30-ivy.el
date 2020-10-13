;;; 30-ivy -- ivy/counsel
;;; Commentary:

;;; Code:
(use-package ivy
  :ensure t
  :bind
  (:map ivy-minibuffer-map
    ;; ESC でミニバッファを閉じる
    ("<escape>" . 'minibuffer-keyboard-quit))
  :init
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
  ("C-M-z" . 'counsel-fzf)
  ("C-M-r" . 'counsel-recentf)
  ("C-x C-b" . 'counsel-ibuffer)
  ("C-M-f" . 'counsel-ag)
  :custom
  ;; M-o を ivy-hydra-read-action に割り当てる
  (ivy-read-action-function #'ivy-hydra-read-action)

  ;; `ivy-switch-buffer' (C-x b) のリストに recent files と bookmark を含める
  (ivy-use-virtual-buffers t)

  ;; プロンプトを折り返す
  (ivy-truncate-lines nil)

  ;; リスト先頭で `C-p' したらリストの最後に移動する
  (ivy-wrap t)

  :config
  )

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1)
  )

(use-package ivy-yasnippet
  :ensure t)

(use-package ivy-pass
  :ensure t)

(use-package perspective
  :bind-keymap
  ("C-z" . perspective-map)
  :bind
  ("C-x b" . 'persp-ivy-switch-buffer)
  ("C-x C-M-b" . 'persp-bs-show)
  (:map perspective-map
    ("SPC" . persp-switch)
    ("k" . persp-kill)
    ("C-k" . persp-kill)
    ("M-k" . persp-kill)
    ("C-p" . persp-prev)
    ("C-n" . persp-next)
    ("a" . persp-switch-last)
    ("C-a" . persp-switch-last)
    )
  :custom
  (persp-state-default-file "~/.emacs.d/data/persp-state-file")
  :hook
  (kill-emacs . persp-state-save)
  :config
  (persp-mode)
  )

(provide '30-ivy)
;;; 30-ivy ends here
