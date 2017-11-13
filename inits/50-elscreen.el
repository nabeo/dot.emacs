(use-package elscreen
  :ensure t
  :init
  (setq elscreen-prefix-key (kbd "C-z"))
  :config
  ;; elscreen
  (setq elscreen-display-tab nil)

  ;; 自動でスクリーンを作成する
  (defmacro elscreen-create-automatically (ad-do-it)
    `(if (not (elscreen-one-screen-p))
         ,ad-do-it
       (elscreen-create)
       (elscreen-notify-screen-modification 'force-immediately)
       (elscreen-message "New screen is automatically created")))
  (defadvice elscreen-next (around elscreen-create-automatically activate)
    (elscreen-create-automatically ad-do-it))
  (defadvice elscreen-previous (around elscreen-create-automatically activate)
    (elscreen-create-automatically ad-do-it))
  (defadvice elscreen-toggle (around elscreen-create-automatically activate)
    (elscreen-create-automatically ad-do-it))

  (add-hook 'howm-mode-hook
            (lambda ()
              (define-key howm-mode-map (kbd "C-c C-s") 'howm-save-and-kill-buffer/screen)
              ))
  (elscreen-start)
  )

(use-package elscreen-gf
  :disabled t                           ; apel is required
  :config
  ;; elscreen-gf
  (if (file-executable-p "/usr/bin/grep")
      (setq elscreen-gf-grep-program-name "/usr/bin/grep")
    (setq elscreen-gf-grep-program-name "grep"))
  (if (file-executable-p "/opt/local/bin/cscope")
      (setq elscreen-gf-cscope-program-name "/opt/local/bin/cscope")
    (setq elscreen-gf-cscope-program-name "cscope"))
  (if (file-executable-p (expand-file-name "~/local/idutils/bin/gid"))
      (setq elscreen-gf-idutils-gid-program-name
            (expand-file-name "~/local/idutils/bin/gid"))
    (setq elscreen-gf-idutils-gid-program-name "gid"))
  (if (file-executable-p (expand-file-name "~/local/idutils/bin/mkid"))
      (setq elscreen-gf-idutils-mkid-program-name
            (expand-file-name "~/local/idutils/bin/mkid"))
    (setq elscreen-gf-idutils-mkid-program-name "mkid"))
  (if (file-executable-p (expand-file-name "~/local/gtags/bin/global"))
      (setq elscreen-gf-global-program-name (expand-file-name "~/local/gtags/bin/global"))
    (setq elscreen-gf-global-program-name "global"))
  (if (file-executable-p (expand-file-name "~/local/gtags/bin/gtags"))
      (setq elscreen-gf-global-gtags-program-name
            (expand-file-name "~/local/gtags/bin/gtags"))
    (setq elscreen-gf-global-gtags-program-name "gtags"))
  )

(use-package elscreen-dnd)

(use-package elscreen-wl)

(use-package elscreen-howm)

(use-package elscreen-w3m)

(use-package elscreen-speedbar)

