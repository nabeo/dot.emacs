;; last update is ....
;; Time-stamp: "Wed Apr 28 11:01:05 JST 2010"

(my-load-path "~/site-lisp/bbdb")
(my-load-path "~/site-lisp/wl-utils")
(require 'bbdb-wl)
(bbdb-wl-setup)

;; ポップアップ表示
(setq bbdb-use-pop-up t)

;; 自動収集
(setq bbdb/mail-auto-create-p t)

;; アドレスと自動で追加
(setq bbdb-always-add-address t)

;; 自動収集しないフォルダ
(setq bbdb-wl-ignore-folder-regexp "^@\\|^\\/\\|^\\[\\|^\\+\\(Trash\\|err-mail\\|spam\\|newspam\\|inbox\\|outbox\\|draft\\|template\\|Bcc\\|net\\|virus\\)")

(setq signature-use-bbdb t)
(setq bbdb-north-american-phone-numbers-p nil)

;; 自動的にMLフィードを加える
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)

(setq bbdb-auto-notes-alist
	  (append bbdb-auto-notes-alist '(("X-ML-Name" (".*$" ML)))))

(setq bbdb-auto-notes-alist
	  (append bbdb-auto-notes-alist
			  `(("x-face"
				 (,(concat
					"[[:blank:]\n]*\\([^[:blank:]\n]*\\)"
					"\\(?:[[:blank:]\n]+\\([^[:blank:]\n]+\\)\\?"
					"\\(?:[[:blank:]\n]+\\([^[:blank:]\n]+\\)\\?"
					"\\(?:[[:blank:]\n]+\\([^[:blank:]\n]+\\)\\?"
					"\\(?:[[:blank:]\n]+\\([^[:blank:]\n]+\\)\\?"
					)
				  face
				  "\\1\\2\\3\\4\\5")))))
(setq x-face-bbdb-display t)
(setq bbdb-offer-save "without-asking")