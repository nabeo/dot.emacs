;; (require 'tls)
;; (set-alist 'elmo-network-stream-type-alist "!opentls" '(opentls nil open-tls-stream))

;; ;; https://pki.google.com/

;; メールアカウント関係
(setq wl-user-mail-address-list
      (list (wl-address-header-extract-address wl-from)
            "you@example.com"))
(setq user-mail-address "you@example.com")
(setq user-full-name "Your Full Name")
(setq wl-local-domain "example.com")
(setq wl-from "you@example.com")
(setq wl-envelope-from "you@example.com")
(setq wl-organization "Organization")

;; SMTP for GMail
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "you@example.com")
(setq wl-smtp-posting-server "smtp.gmail.com")

;; IMAP for GMail
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-authenticate-type 'clear)
(setq elmo-imap4-default-stream-type 'ssl)
(setq elmo-imap4-default-port 993)
(setq elmo-imap4-default-use-cache t)
(setq elmo-imap4-default-user "you@example.com")
(setq elmo-imap4-use-modified-utf7 t)

(setq wl-trash-folder "%[Gmail]/すべてのメール")
(setq wl-fcc          "%[Gmail]/送信済みメール")
(setq wl-default-spec "%INBOX")
