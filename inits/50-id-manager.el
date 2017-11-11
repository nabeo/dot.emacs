(use-package id-manager
  :ensure t
  :config
  ;; EasyPGで使うための設定
  ;; minibufferでパスワードを入力する場合
  (setenv "GPG_AGENT_INFO" nil)
  ;; パスワードを保存する
  ;; (setq epa-file-cache-passphrase-for-symmetric-encryption t)

  ;; パスワードの保存先(gpgで暗号化されている)
  (setq idm-database-file "~/.emacs.d/id-manager/idm-db.gpg")
  )
;; keybind
;; n,p,j,k : 上下
;; a,+     : エントリの追加
;; u,r     : 再読み込み
;; e,m     : エントリ編集
;; d,-     : エントリ削除
;; Enter   : パスワードをクリップボードにコピー
;; S       : パスワード表示のトグル
;; T       : 更新日時でソート
;; N       : アカウント名でソート
;; I       : アカウントIDでソート
;; M       : メモでソート
;; q       : 変更があれば保存して終了
;; Q       : 保存せずに終了
