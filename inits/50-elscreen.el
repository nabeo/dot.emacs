(use-package elscreen
  :ensure t
  :disabled t
  :config
  (setq elscreen-prefix-key (kbd "C-z"))
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
  :after (elscreen)
  :disabled t
  :config
  (if (executable-find "grep")
      (setq elscreen-gf-grep-program-name (executable-find "grep")))
  (if (executable-find "cscope")
      (setq elscreen-gf-cscope-program-name (executable-find "cscope")))
  (if (executable-find "global")
      (setq elscreen-gf-global-program-name (executable-find "global")))
  (if (executable-find "gtags")
      (setq elscreen-gf-global-gtags-program-name (executable-find "gtags")))
  )

(use-package helm-elscreen :ensure t
  :after (helm elscreen)
  :disabled t
  :bind
  (("C-z SPC" . helm-elscreen))
  )

(use-package elscreen-dnd
  :disabled t
  )

(use-package elscreen-wl
  :disabled t
  )

(use-package elscreen-howm
  :after (elscreen howm)
  :disabled t
  :config
  (add-hook 'howm-mode-hook
            (lambda ()
              (define-key howm-mode-map
                (kbd "C-c C-c") nil)
              (define-key howm-mode-map
                (kbd "C-c C-s") 'howm-save-and-kill-buffer/screen)
              )))

(use-package elscreen-w3m
  :disabled t)

(use-package elscreen-speedbar
  :disabled t)

