;; Time-stamp: <Thu Apr 28 09:24:19 JST 2011>

;; http://d.hatena.ne.jp/kiwanami/20110221/1298293727
;; http://d.hatena.ne.jp/kiwanami/20090914/1252949746

;; Require : GnuPG, EasyPG, anything.el

;; auto-installでインストールする
;; (auto-install-from-url "https://github.com/kiwanami/emacs-id-manager/raw/master/id-manager.el")

(autoload 'id-manager "id-manager" nil t)
;; EasyPGで使うための設定
;; minibufferでパスワードを入力する場合
(setenv "GPG_AGENT_INFO" nil)
;; パスワードを保存する
;; (setq epa-file-cache-passphrase-for-symmetric-encryption t)

;; パスワードの保存先(gpgで暗号化されている)
(setq idm-database-file "~/.emacs.d/id-manager/idm-db.gpg")

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
