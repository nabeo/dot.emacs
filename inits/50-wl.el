(use-package mime-setup
  :ensure semi
  :init
  :config
  )

(use-package mime
  :ensure flim
  :init
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
  :config
  (defadvice mime-entity-filename (after eword-decode-for-broken-MUA activate)
    "Decode encoded file name for BROKEN MUA."
    (when (stringp ad-return-value)
      (setq ad-return-value (my-mime-decode-filename ad-return-value))))
  )

(use-package std11
  :ensure flim
  :config
  (defadvice std11-wrap-as-quoted-string
      (before encode-string activate)
    "Encode a string."
    (require 'eword-encode)
    (ad-set-arg 0 (eword-encode-string (ad-get-arg 0))))
  )

(use-package wl-summary
  :ensure wanderlust
  :init
  ;; メッセージ番号で並び替えする
  (defun wl-summary-overview-entity-compare-by-reply-number (a b)
    "Compare entity A and B by latest number of replies."
    (let ((fx #'(lambda (x)
                  (setq x (elmo-message-entity-number x))
                  (apply 'max x (wl-thread-entity-get-descendant
                                 (wl-thread-get-entity x))))))
      (< (funcall fx a) (funcall fx b))))
  (setq wl-summary-divide-thread-when-subject-changed t)
  (setq wl-summary-indent-length-limit nil)
  (setq wl-summary-width nil)
  (setq wl-auto-select-first nil)
  (setq wl-auto-select-next nil)
  (setq wl-summary-move-order 'unread)
  ;; 全てのメッセージをプリフェッチする (オフラインアクセス用)
  (setq wl-summary-incorporate-marks '("N" "U" "!" "A" "F" "$"))
  ;; thread face
  (setq wl-thread-indent-level 2)
  (setq wl-thread-have-younger-brother-str "|")
  (setq wl-thread-youngest-child-str       "`")
  (setq wl-thread-vertical-str             "|")
  (setq wl-thread-horizontal-str           "-")
  (setq wl-thread-space-str                " ")

  ;; 自分宛のメールには>をつける (GMail風)
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

  ;; n, pで読み進めて最後か最初までいったとき、フォルダを抜けないようにする
  (add-hook 'wl-summary-mode-hook
            '(lambda ()
               (setq wl-summary-buffer-prev-folder-function 'ignore)
               (setq wl-summary-buffer-next-folder-function 'ignore)))
  :config
  (add-to-list 'wl-summary-sort-specs 'reply-number)
  ;; summaryモードの拡張
  (setq wl-summary-line-format-spec-alist
        (append wl-summary-line-format-spec-alist
                '((?> (wl-summary-line-for-me)))))
  (setq wl-summary-line-format "%T%P%1@%M/%D(%W)%h:%m %t[%17(%c %f%) %] %#%~%s")
  )

(use-package wl-folder
  :ensure wanderlust
  :init
  (setq wl-folder-check-async t)
  (setq wl-folder-buffer-name "Folder")
  :config
  )

(use-package wl
  :ensure wanderlust
  :commands (wl-other-frame wl-draft wl-util wl-e21)
  :after (auth-source)
  :init
  ;; for mime-setup
  (setq mime-view-text/html-preview 'shr)
  (setq mime-situation-examples-file
        (expand-file-name (concat user-emacs-directory "wl/mime-example.el")))
  (setq mime-edit-split-message nil)
  (setq mime-view-text/html-score 0)

  (setq elmo-passwd-storage-type 'auth-source)
  (setq wl-folders-file (expand-file-name
                         (concat user-emacs-directory "wl/folders")))
  (setq wl-address-file (expand-file-name
                         (concat user-emacs-directory "wl/address")))
  (setq elmo-maildir-folder-path "~/mail")
  ;; 転送メールのsubjectの先頭につける文字列を変更する
  (setq wl-forward-subject-prefix "Fwd: ")
  ;; 送ったメールは指定するディレクトリに保存しておく
  (setq wl-fcc "+backup")
  ;; Fcc: で保存したメッセージを既読にする
  (setq wl-fcc-force-as-read t)
  ;; 自分あてのメールに返信する場合は To と Cc から自分のメールアドレスを削除
  (setq wl-draft-always-delete-myself t)
  :config
  ;; message mode
  (setq wl-message-ignored-field-list
        '("^Received-SPF:" "Authentication-Results:" "^In-Reply-To:"
          "^Repied:" "^Errors-To" "^Lines:" "^Sender:" ".*Host:"
          "^Deleiverd-To" "^Message-Id:" "^Content-Transfer-Encoding:"
          "^X-Mailman-Version:" "^X-Sequence:" "^X-BeenThere:"
          "^Return-Path:" "^Received:" "^MIME-Version:"
          "^X-Old-From:" "^X-HopMx-Name:" "^X-Spam:" "^X-MAIL-FROM:"
          "^X-Virus-.*" "^X-Priority:" "^X-MSMail-Priority:" "^X-MIMEOLE:"
          "^X-SOURCE-IP:" "^X-AnalysisOut:" "^Precedence:"
          "^References:" "^Content-Disposition:" "^Reply-To:" "^Content-Type:"
          "^X-Spam.*" "^X-BigFish:" "^X-Forefront-Antispam-Report:"
          "^Thread-.*" "^Accept-Language:" "^Content-Language:" "^X-MS-.*"
          "^X-Microsoft.*" "^X-Exchange" "^SpamDiagnosticOutput:"
          "^SpamDiagnosticMetadata:"
          "^acceptlanguage:" "^X-OriginatorOrg:" "^X-MIME-Autoconverted:"
          "^X-Trac-.*" "^Auto-Submitted:" "^X-URL:" "^X-TERRACE-.*"
          "^List-Unsubscribe:" "^List-Post:" "^List-Help:" "^List-Subscribe:"
          "^X-Proofpoint-Virus-Version:" "^X-Proofpoint-Spam-Details:"
          "^X-Submit-.*" "^X-Referer:" "^X-LANG:" "^X-Proxy:" "^X-MIME:"
          "^X-Query:"
          "^X-OriginalArrivalTime:" "^X-TM-AS-Product-Ver:" "^X-TM-AS-Result:"
          "^X-imss-scan-details:" "^X-TMASE-MatchedRID:" "^X-Brightmail-Tracker:"
          "^X-post-Received:" "^Sun-Java-System-SMTP-Warning" "^X-vs"
          "^X-Received:" "^X-Gm-Message-State:" "^X-Google-Group-Id:"
          "^X-Forefront-Antispam-Report-Untrusted:" "^x-securitypolicycheck:"
          "^x-shieldmailcheckerpolicyversion:" "^x-originating-ip:"
          "^x-forefront-prvs:" "^X-FOPE-CONNECTOR:" "^X-PlayBackID:"
          "^X-Google-Sender-Auth:" "^X-Google-Smtp-Source:" "^X-Google-DKIM-Signature:"
          "^X-Cybozu-Notify-App-.*:" "^X-Cybozu-Notify-Date:" "^X-Cybozu-Notify-Name:"
          "^X-Cybozu-Notify-Digest:"
          "^X-Iguazu-Qid:"
          "^X-CTCH-RefID:" "^X-VR-Cause:" "^X-CMAE-Analysis:" "^X-CMAE-Envelope:"
          "^X-Auto-Response-Suppress:" "^X-SMTPAPI:"
          "^X-SG-EID:"
          ;; DKIM
          "^DKIM-Signature:"
          "^ARC-Seal:" "^ARC-Message-Signature:" "^ARC-Authentication-Results:"
          ;; AWS
          "^X-MSFBL:" "^X-PVIQ:" "^X-PVIQ:" "^X-Binding:" "^X-MarketoID:"
          "^X-MktArchive:" "^X-Mailfrom:" "^X-MSYS-API:" "^X-AMAZON-MAIL-RELAY-REDIR:"
          "^X-SES-Outgoing:" "^Feedback-ID:"
          ))
  (setq wl-message-visible-field-list '("^To:" "^Subject:" "^Cc:" "^Date:"))
  (setq wl-message-auto-reassemble-message/partial t)

  ;; user-agentを変更
  (defun my-wl-generate-user-agent-string ()
    "yet another wl-generate-user-agent-string"
    (concat (product-string-1 'wl-version t) " "
            (wl-extended-emacs-version3 "/" t)))
  (setq wl-generate-mailer-string-function 'my-wl-generate-user-agent-string)
  (setq wl-generate-user-agent-string 'my-wl-generate-user-agent-string)

  ;; accounts
  (load-safe (expand-file-name
              (concat user-emacs-directory "wl/wl-account-tls.el")))
  ;; Bcc に自分のアドレスを追加する
  (unless (and wl-bcc)
    (setq wl-bcc (and user-mail-address (concat user-mail-address))))

  ;; 参加している ML のリスト
  (load-safe (expand-file-name
              (concat user-emacs-directory "wl/ml-list.el")))

  ;; 振り分け
  (load-safe (expand-file-name
              (concat user-emacs-directory "wl/wl-refile-rule.el")))
  )
