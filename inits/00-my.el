; load-pathを追加するための関数
;; http://d.hatena.ne.jp/kazu-yamamoto/20080219/1203423707
;;; ex) (my-load-path "foo")
(defun my-load-path (path)
  "load-path を追加するための関数。"
  (let ((epath (expand-file-name path)))
    (unless (member epath load-path)
      (setq load-path (cons epath load-path)))))

;; emacsの環境を調べるための変数
;; http://d.hatena.ne.jp/tomoya/20090807/1249601308
(defun x->bool (elt) (not (not elt)))
;; emacsのバージョン
(setq emacs22-p (string-match "^22" emacs-version)
      emacs23-p (string-match "^23" emacs-version)
      emacs24-p (string-match "^24" emacs-version)
      emacs25-p (string-match "^25" emacs-version)
      emacs26-p (string-match "^26" emacs-version)
      emacs23.0-p (string-match "^23\.0" emacs-version)
      emacs23.1-p (string-match "^23\.1" emacs-version)
      emacs23.2-p (string-match "^23\.2" emacs-version)
      emacs23.3-p (string-match "^23\.3" emacs-version)
      emacs23.4-p (string-match "^23\.4" emacs-version)
      emacs24.1-p (string-match "^24\.1" emacs-version)
      emacs24.2-p (string-match "^24\.2" emacs-version)
      emacs24.3-p (string-match "^24\.3" emacs-version)
      emacs24.4-p (string-match "^24\.4" emacs-version)
      emacs24.5-p (string-match "^24\.5" emacs-version)
      emacs25.0-p (string-match "^25\.0" emacs-version)
      emacs25.1-p (string-match "^25\.1" emacs-version)
      emacs25.2-p (string-match "^25\.2" emacs-version)
      emacs25.3-p (string-match "^25\.3" emacs-version)
      emacs26.1-p (string-match "^26\.1" emacs-version)
      emacs-bzr-p (string-match "^2.\..\.50" emacs-version))
;; emacsのsystem-type
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p)
      nox-p     (eq window-system nil))

;; http://www.sodan.org/~knagano/emacs/dotemacs.html
(defmacro exec-if-bound (sexplist)
  "関数が存在する時だけ、実行する。(car の fboundp を調べるだけ)"
  `(if (fboundp (car ',sexplist))
       ,sexplist))
(defmacro defun-add-hook (hookname &rest sexplist)
  "add-hook のエイリアス。引数を関数にバックして hook に追加する。"
  `(add-hook ,hookname
             (function (lambda () ,@sexplist))))
(defun load-safe (loadlib)
  "安全な load。読み込みに失敗してもそこで止まらない。"
  (let ((load-status (load loadlib t)))
    (or load-status
        (message (format "[load-safe] failed %s" loadlib)))
    load-status))

;; ネットワークインターフェースにアドレスが付いているかチェックする
(defun have-network-interface-p (network-interface-names)
  "Return t if at least one NETWORK-INTERFACE-NAMES has a network address."
  (interactive "p")
  (dolist (i network-interface-names)
    (if (car (network-interface-info i))
     (return t))))

;; load-pothの追加設定
(my-load-path "/opt/local/share/emacs/site-lisp")

;; デフォルトの窓の大きさを変更する
;;(setq default-frame-alist
;;      (append
;;       '((width . 300))
;;       '((height . 100))
;;       default-frame-alist))


;;(keyboard-translate ?\C-h ?\C-?)

;; キーの割当(global-set-key)
(progn
  (global-set-key "\C-h" 'delete-backward-char)
  (global-set-key "\M-g" 'goto-line)
  (global-set-key "\M-r" 'replace-string))

;; 日本語の設定
;;(set-language-environment "japanese")
;;(prefer-coding-system 'utf-8-unix)
;;(if (eq emacs-version '22.0.50.1)
;;	(utf-translate-cjk-mode t)
;;)

;; 圧縮されたファイルも編集できるようにする
(auto-compression-mode t)

;; ビジブル・ベルを使う
;; (setq visible-bell t)

;; タブは4文字
;; (setq default-tab-width 4)
(setq-default tab-width 4)
;; C-nで新しい行を追加しない
(setq next-line-add-newlines nil)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; 画像ファイルを表示する
(auto-image-file-mode t)
;; 圧縮されたファイルも編集できるようにしておく
(auto-compression-mode t)
;; 対応した括弧のハイライトを括弧内も含むようにする
(show-paren-mode t)
(setq show-paren-style 'expression)
;; バックアップファイルを作らない
(setq make-backup-files nil)
;; auto-saveしない
(setq auto-save-default t)

(setq transient-mark-mode t)

;; インデントはスペース
(setq-default indent-tabs-mode nil)
;; 長い行は折り返して表示する
(setq truncate-partial-width-windows nil)
;; *scratch*の文字列をなくす
(setq initial-scratch-message nil)

(setq default-directory "~/")

;; モードラインの設定
;; 時間を表示
(setq display-time-24hr-format t)
(display-time)
;; カーソル位置の表示
(setq column-number-mode t)
(setq line-number-mode t)

;; タイトルバーにファイル名を表示
(setq frame-title-format
	  (format "emacs@%s: %%f" (system-name)))

;; メニューバーとツールバーの表示設定
(tool-bar-mode 0)
;;(menu-bar-mode 0)

;; pathの設定
(dolist (i '("/opt/local/bin"
             "/opt/local/sbin"
             "/usr/local/bin"
             "/usr/local/sbin"
             "/usr/local/opt/openssl/bin"
             "/usr/local/opt/curl/bin"
             "/usr/local/opt/llvm/bin"))
  (unless (member i exec-path)
    (setq exec-path (cons i exec-path)))
  (unless (member i (split-string (getenv "PATH")))
    (setenv "PATH" (concat (getenv "PATH") ":" i)))
    )

;; スケスケ窓
;; (setq default-frame-alist
;; 	  (append
;; 	   (list
;; 		; スケスケ度は0.0〜1.0で設定
;; 		'(active-alpha . 0.95) ; 窓が最前列にあるときはスケスケにならない
;; 		'(inactive-alpha . 0.2) ; 窓が後列にあるときはスケスケになる
;; 		) default-frame-alist)
;; 	  )

;; アンチアンチエイリアス
;;(setq mac-allow-anti-aliasing nil)

;; 最終更新日の自動挿入
;; ファイルの先頭から8行以内にTime-stamp: <>か
;; Time-stamp: " "と書いてあればセーブ時に自動的に日付を挿入する
(require 'time-stamp)
;; 英語表記で日付を挿入
(defun time-stamp-with-locale-c ()
  (let ((system-time-locale "C"))
	(time-stamp)
	nil))
(if (not (memq 'time-stamp-with-locale-c write-file-hooks))
	(add-hook 'write-file-hooks 'time-stamp-with-locale-c))
(setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %Z %:y")

;; 画面がちらつくのでダブルバッファリングを無効にしてみる
;; https://www.reddit.com/r/emacs/comments/9jm1az/emacs_rendering_is_broken_in_macos_mojave/e6sg9ei/
;; (setq default-frame-alist
;;       (append default-frame-alist '((inhibit-double-buffering . t))))
