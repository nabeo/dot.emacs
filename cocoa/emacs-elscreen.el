;; last update is ....
;; Time-stamp: "Sat Jun 01 18:58:58 JST 2013"

(require 'elscreen)
(require 'elscreen-gf)
(require 'elscreen-dnd)
(require 'elscreen-wl)
(require 'elscreen-howm)
(require 'elscreen-w3m)
(require 'elscreen-speedbar)

;; elscreen-gf
(setq elscreen-gf-grep-program-name "/usr/bin/grep")
(setq elscreen-gf-idutils-gid-program-name "/Users/nabeo/local/idutils/bin/gid")
(setq elscreen-gf-idutils-mkid-program-name "/Users/nabeo/local/idutils/bin/mkid")
(setq elscreen-gf-cscope-program-name "/opt/local/bin/cscope")
(setq elscreen-gf-global-program-name "/Users/nabeo/local/gtags/bin/global")
(setq elscreen-gf-global-gtags-program-name "/Users/nabeo/local/gtags/bin/gtags")

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
