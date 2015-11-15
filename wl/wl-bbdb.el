;; last update is ....
;; Time-stamp: "Sat Apr 19 21:41:32 JST 2014"
(my-load-path "~/site-lisp/wl-utils")
(my-load-path "~/site-lisp/vcard-utils")

(require 'bbdb-vcard-export)

;; from http://www4.big.or.jp/~kanai/unix/dot/emacs/_emacs-bbdb

;; Wanderlust用の設定
;; Mewだけ使う人は次の3行をコメントアウトしてください  
(setq mime-bbdb/use-mail-extr nil)
;;(eval-after-load "mail-extr" '(require 'mime-bbdb))
(require 'mime-bbdb)
(require 'bbdb-wl)
(bbdb-wl-setup)
(add-hook 'wl-mail-setup-hook 'bbdb-insinuate-sendmail)

;;; Mew用の設定
;;(autoload 'bbdb-insinuate-mew "bbdb-mew" "Hook BBDB into Mew")
;;(add-hook 'mew-init-hook 'bbdb-insinuate-mew)
;;(setq mew-use-bbdb t)
;;(require 'bbdb-mew)
;;(setq mew-cite-prefix-function (function mew-cite-prefix-bbdb))


(require 'bbdb)
(autoload 'bbdb         "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-name    "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-company "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-net     "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-notes   "bbdb-com" "Insidious Big Brother Database" t)
(autoload 'bbdb-insinuate-vm       "bbdb-vm"    "Hook BBDB into VM")
(autoload 'bbdb-insinuate-rmail    "bbdb-rmail" "Hook BBDB into RMAIL")
(autoload 'bbdb-insinuate-mh       "bbdb-mhe"   "Hook BBDB into MH-E")
(autoload 'bbdb-insinuate-gnus     "bbdb-gnus"  "Hook BBDB into GNUS")
(autoload 'bbdb-insinuate-sendmail "bbdb"       "Hook BBDB into sendmail")

(bbdb-initialize)
(setq bbdb-file-coding-system 'utf-8-mac)
(setq bbdb-file "~/.emacs.d/wl/bbdb-list") ;(concat TT:mule-save-dir "~/.bbdb")
(setq bbdb/mail-auto-create-p   'bbdb-ignore-some-messages-hook)
(setq bbdb-ignore-some-messages-alist
      '(("From" . "MAILER-DAEMON\\|iso-2022-jp\\|ISO-2022-JP\\|root\\|sysmgr\\|logwatch\\|infomail\\|notifications\\|notify")
        ("To" . "noreply\\.github\\.com")))
(setq bbdb-pop-up-elided-display        '(creation-date timestamp))
(setq bbdb-user-mail-names      "watanabe.michikazu@gmail\\.com")

;; BBDB windowの高さ
(setq bbdb-pop-up-target-lines 3)
;; ポップアップ表示
(setq bbdb-use-pop-up nil)
(setq signature-use-bbdb t)
(setq bbdb-north-american-phone-numbers-p nil)
;; サマリに bbdb の名前を表示 :-)。
;;(setq wl-summary-from-func 'bbdb-wl-from-func)
;; 自動的に ML フィールドを加える
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
;; wl-folder-suspendしたときにBBDBフィールドを消す
(defadvice wl-folder-suspend (after wl-bbdb-suspend activate compile)
  (interactive)
(bbdb-wl-exit))
(defadvice wl-exit (after wl-bbdb-suspend activate compile)
  (interactive)
(bbdb-wl-exit))
;; X-Faceを表示する
;;(require 'highlight-headers)

(setq bbdb-auto-notes-alist 
      '(
        ("X-ML-Name" (".*" ML 0))
        ("List-ID" (".*" ML 0))
        ("X-Mailer" (".*$" User-Agent 0))
        ("X-Newsreader" (".*$" User-Agent 0))
        ("User-Agent" (".*$" User-Agent 0))
                              ))
;; 日本の住所事情にあわせる
;; bbdbで郵便番号の整合性のチェックをしない
;;(setq bbdb-check-zip-codes-p 'nil)
; 日本の郵便番号のパターンをbbdb-legal-zip-codesに登録する
(setq bbdb-legal-zip-codes (
							cons (
								  concat "^[ \t\n]*\\([0-9][0-9][0-9]\\)[ \t\n]*-?[ \t\n]*"
										 "\\([0-9][0-9][0-9][0-9]\\)[ \t\n]*$")
								 bbdb-legal-zip-codes))
