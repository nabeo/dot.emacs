;; last update is ....
;; Time-stamp: "Mon Mar 30 10:52:04 JST 2009"

(if (eq window-system 'mac)
    (my-load-path "~/site-lisp/elscreen")
  )

;; (load "elscreen" "ElScreen" t)
;; (load "elscreen-gf" "ElScreen-GF" t)
;; (load "elscreen-dnd" t)
;; (load "elscreen-wl" t)

(require 'elscreen)
(require 'elscreen-gf)
(require 'elscreen-dnd)
(require 'elscreen-wl)
(require 'elscreen-howm)
(require 'elscreen-w3m)
(require 'elscreen-speedbar)

;; elscreen-gf
(setq elscreen-gf-grep-program-name "/usr/bin/grep")
(setq elscreen-gf-idutils-gid-program-name "/opt/local/bin/gid")
(setq elscreen-gf-idutils-mkid-program-name "/opt/local/bin/mkid")
(setq elscreen-gf-cscope-program-name "/opt/local/bin/cscope")
(setq elscreen-gf-global-program-name "/opt/local/bin/global")
(setq elscreen-gf-global-gtags-program-name "/opt/local/bin/gtags")

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
