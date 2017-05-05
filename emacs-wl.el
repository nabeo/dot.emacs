; xcite.elを使う
;(load "~/.emacs.d/emacs-xcite.el")

;; tls.elを使う
;; (require 'tls)
;; (set-alist 'elmo-network-stream-type-alist "!opentls" '(opentls nil open-tls-stream))

;; htmlパートを表示しない
(setq mime-setup-enable-inline-html nil)
;; メッセージ中の text/html パートを w3m で表示する
;; (require 'mime-w3m)

;; semi
(load "mime-setup")
(setq mime-situation-examples-file
      (convert-standard-filename "~/.emacs.d/wl/mime-example.el"))
(setq mime-situation-examples-file-coding-system "utf-8-emacs")

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-util "wl-util" "utilities for Wanderlust." t)

;; メールアカウント関係
(cond ((or emacs23.4-p emacs24-p emacs25-p emacs-bzr-p)
       (load-safe "~/.emacs.d/wl/wl-account-tls.el"))
      (load-safe "~/.emacs.d/wl/wl-account.el"))

;; wl-icondirectory
(cond (emacs23.3-p
       (setq wl-icon-directory "~/Applications/Emacs-23.3.app/Contents/Resources/etc/wl/icons")))

;; 自分の環境にあわせる
;; .folders
(setq wl-folders-file "~/.emacs.d/wl/folders")
;; .addresses
(setq wl-address-file "~/.emacs.d/wl/addresses")
(setq mail-from-style 'angles)
;; elmo-prefix
(setq elmo-mialdir-forler-path "~/mail")

;; (setq wl-message-id-domain "graminc.co.jp")

;; (setq wl-default-spec "%")
;; (setq wl-default-folder "%inbox")
(setq elmo-cache-expire-by-size 10240000)

;; メールの受信
;; biff関係
(setq wl-biff-check-folder-list '("%inbox")
	  wl-biff-check-interval 300)

;; メールの送信
;; 大きいメッセージを分割しない
(setq mime-edit-split-message nil)
;; 送ったメールは指定するディレクトリに保存しておく
(setq wl-fcc "+backup")

;; メールの作成
;; Bccを自動的に付与する
;; (setq wl-bcc "watanabe.michikazu@gmail.com")
;; To,Ccから自分のメールアドレスを削除する
;; (setq wl-drat-always-delete-myself t)
(setq wl-drat-always-delete-myself nil)

;; 外部ファイルの読み込み
(load "~/.emacs.d/wl/ml-list.el") ; 参加しているMLのリスト
(load "~/.emacs.d/wl/wl-refile-rule.el") ; リファイルルール(wl-refile-rule.el)
;;(load "~/.emacs.d/wl/elmo-refile-rule.el") ; elmoを使ったリファイル

;;; Spam Filter
;; (require 'wl-spam)
;;; bogofilter
;; (setq elmo-spam-scheme 'bogofilter
;; 	  wl-spam-auto-check-folder-regexp-list '("\\+inbox")
;; 	  elmo-spam-bogofilter-debug 'nil)

;; メールの閲覧

;; HTMLファイルは表示しない
(setq mime-setup-enable-inline-html nil)

;; cp932の設定
;; (require 'cp5022x)
;; (add-to-list 'mime-charset-coding-system-alist '(shift_jis . cp932))
;; (add-to-list 'mime-charset-coding-system-alist '(iso-2022-jp . cp50220))

;; draft mode
(setq wl-draft-use-frame t)
;; signature
(setq signature-file-name "~/.emacs.d/wl/signature-gmail")
(setq signature-inset-at-eof t)
(setq signature-delete-blank-lines-at-eof t)

;; メッセージヘッダの表示
;;; ヘッダの表示はHでトグルする
;;; MIMEエンコードの有無はM
;;; 表示を戻すときは.
(setq wl-message-ignored-field-list
	  '(".*Received:" ".*Path:" "^References:"
		"^Delivered-To:" "^Received-SPF:"
		"^Replied:" "^Errors-To" "^Lines:" ".*Host:"
		"^Message-ID:" "^MIME-Version:"
		"^Authentication-Results:" "^DKIM-Signature:" 
		"^DomainKey-Signature:"
		"^Content-Type:"  "^Content-class:" "^Precedence:" "^Status:"
		"^X-Mozilla-.*:" "^X-Account-Key:" "^X-UIDL:"
		"^X-MLServer:" "^X-ML-Info:" "^X-Original-To:"
		"^X-Enigmail-Version" "^X-Distribute:"
		"^X-BeenThere:" "^X-Mailman-Version:"
		"^X-Nifty-.*:" "^X-MimeOLE:" "^X-MS-.*"
		"^X-IronPort.*" "^X-Spam.*" "^X-GDX-Token:" "^X-TimeCertificate:"
		"^X-ASJ" "^X-AntiAbuse:" "^X-Source:" "^X-Source-.*:"
        "^X-Accept-Language" "^X-AuditID:" "^X-Mailer:" "X-MIMETrack:"
        "^X-Brightmail-Tracker:"
        "^X-OriginalArrivalTime" "^X-Scanned-By-hitachihk.*"
        "^X-NetworkBox-BounceSign-.*" "^X-NetworkBox-HamSign"
        "^X-TM-AS-Product-Ver:" "^X-TM-AS-Result" "^X-imss-scan-details"
        "^X-Proofpoint-.*" "^X-Virus-.*" "^X-Google-DKIM-Signature"
		"^List-Software:" "^List-Post:" "^List-Owner:"
		"^List-Help:" "^List-Unsubscribe:" "^List-Archive:"
		"^List-Subscribe"))

;; 日本語の添付ファイルを扱えるようにする
(defvar my-mime-filename-coding-system-for-decode
  '(iso-2022-jp japanese-shift-jis japanese-iso-8bit))
(defun my-mime-decode-filename (filename)
  (let ((rest (eword-decode-string filename)))
    (or (when (and my-mime-filename-coding-system-for-decode
                   (string= rest filename))
          (let ((dcs (mapcar (function coding-system-base)
                             (detect-coding-string filename))))
            (unless (memq 'emacs-mule dcs)
              (let ((pcs my-mime-filename-coding-system-for-decode))
                (while pcs
                  (if (memq (coding-system-base (car pcs)) dcs)
                      (setq rest (decode-coding-string filename (car pcs))
                            pcs nil)
                    (setq pcs (cdr pcs))))))))
       rest)))

(eval-after-load "mime"
  '(defadvice mime-entity-filename (after eword-decode-for-broken-MUA activate)
    "Decode encoded file name for BROKEN MUA."
     (when (stringp ad-return-value)
       (setq ad-return-value (my-mime-decode-filename ad-return-value)))))
(require 'std11)

;; ファイル名が日本語の添付ファイルをエンコードする [semi-gnus-ja: 6046]
(eval-after-load "std11"
  '(defadvice std11-wrap-as-quoted-string 
     (before encode-string activate)
     "Encode a string."
     (require 'eword-encode)
     (ad-set-arg 0 (eword-encode-string (ad-get-arg 0)))))

;; summaryモードの各種設定
;; requres
(require 'wl-summary)

;; スレッドの表示関連
(setq wl-thread-indent-level 2)
(setq wl-thread-have-younger-brother-str "|")
(setq wl-thread-have-younger-child-str "`")
(setq wl-thread-youngest-child-str "`")
(setq wl-thread-vertical-str "|")
(setq wl-thread-horizontal-str "-")
(setq wl-thread-space-str " ")
(setq wl-summary-incorporate-marks '("N" "U" "!" "A" "F" "$"))

;;; 表示は切り詰めない
(setq wl-summary-width nil)
(setq wl-summary-length-limit nil)
;;; subjectが変ったら、スレッドを切る
;;(setq wl-summary-divide-thread-when-subject-changed t)

;; サマリの表示拡張
;;; 自分宛のメールには>を付ける (Gmail風)
(setq wl-user-mail-address-regexp
	  "watanabe\.michikazu@gmail\.com")
(defun wl-summary-line-for-me ()
  (if (catch 'found
		(let ((to (elmo-message-entity-field wl-message-entity 'to))
			  (cc (elmo-message-entity-field wl-message-entity 'cc)))
		  (when (or (stringp to) cc)
			(setq to
				  (append (if (stringp to) (list to) to)
						  (when cc
							(if (stringp cc) (list cc) cc)))))
		  (dolist (i to)
			(when (wl-address-user-mail-address-p (eword-decode-string i))
			  (throw 'found t)))))
	  ">"
	""))

;;; 添付ファイルがあるメールには@をつける
(setq elmo-msgdb-extra-fields
    (cons "content-type" elmo-msgdb-extra-fields))

;;; 拡張したサマリを反映
(require 'wl-vars)
(setq wl-summary-line-format-spec-alist
      (append wl-summary-line-format-spec-alist
              '((?@ (wl-summary-line-attached))
				(?> (wl-summary-line-for-me)))
              ))
(setq wl-summary-line-format 
      "%n%T%P%1@%1>%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %#%~%s")
;; (setq wl-summary-line-format 
;;       "%n%T%P%1@%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %#%~%s")

;; Spotlightでメールを検索可能にする -> うまく動かないからnamazuに切り替え(2008/3/26)
;;; http://www.heavenwolf.org/archives/2006/12/10/1224.php
;;(require 'elmo-search-spotlight)
;;(setq elmo-search-default-engine 'spotlight)

;; Namazuを使ったメールの検索
;;; namazuのパスを設定
;; (setq exec-path (cons "/usr/local/namazu/bin" exec-path))
;;; indexの指示
;; (setq elmo-search-namazu-index-alias-alist 
;; 	  '(("pict" . "~/.namazu/wanderlust")))
;; (setq elmo-search-namazu-default-index-path "~/.namazu/wanderlust")

;; bbdb
;; (load-file "~/.emacs.d/wl/wl-bbdb.el")

;; Summary モードで n,p で読み進めて最後か最初までいったとき
;; フォルダを抜けないようにする (2ch Wanderlust その5)
(add-hook 'wl-summary-mode-hook
  '(lambda ()
     (setq wl-summary-buffer-prev-folder-function 'ignore
           wl-summary-buffer-next-folder-function 'ignore)))

;; wl-summary-refile-prev-destinationのキーバインドを"M-o"から変更する
;;(define-key wl-summary-mode-map "" 'wl-summary-refile-prev-destination)

;; 新着レス順にソートする
;; Summaryモードでソート(S)した時の候補に reply-date がでる
;; http://gist.github.com/153020
(defun wl-summary-overview-entity-compare-by-reply-date (a b)
  "Compare entity X and Y by latest date of replies."
  (flet ((string-max2
          (x y)
          (cond ((string< x y) y)
                ('t x)))
         (elmo-entity-to-number
          (x)
          (elt (cdr x) 0))
         (thread-number-get-date
          (x)
          (timezone-make-date-sortable (elmo-msgdb-overview-entity-get-date (elmo-message-entity wl-summary-buffer-elmo-folder x))))
         (thread-get-family
          (x)
          (cons x (wl-thread-entity-get-descendant (wl-thread-get-entity x))))
         (max-reply-date
          (x)
          (cond ((eq 'nil x)
                 'nil)
                ((eq 'nil (cdr x))
                 (thread-number-get-date (car x)))
                ('t
                 (string-max2 (thread-number-get-date (car x))
                              (max-reply-date (cdr x)))))))
    (string<
     (max-reply-date (thread-get-family (elmo-entity-to-number a)))
     (max-reply-date (thread-get-family (elmo-entity-to-number b))))))
(add-to-list 'wl-summary-sort-specs 'reply-date)

;; 文字化け対策
;; http://d.hatena.ne.jp/kiwanami/20091103/1257243524
(add-to-list 'mime-charset-coding-system-alist '(iso-2022-jp . cp50220))
