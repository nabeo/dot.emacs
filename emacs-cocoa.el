;; cocoa用のload-pathを追加
(my-load-path "~/site-lisp/cocoa")

;; (my-load-path "~/site-lisp/cocoa/auto-install") ; いつの日かコメントアウトする!!
(cond ((or emacs-bzr-p emacs24-p)
       (load-safe "~/.emacs.d/emacs-cocoa-bzr.el"))
      (emacs23.4-p
       (load-safe "~/.emacs.d/emacs-cocoa-23.4.el")))

;; 日本語の設定
(load-safe "~/.emacs.d/cocoa/emacs-japanese.el")

;; パッケージ管理
(load-safe "~/.emacs.d/cocoa/emacs-cask.el")
;; (cond ((or emacs24-p emacs25-p emacs-bzr-p)
;;        (load-safe "~/.emacs.d/cocoa/emacs-package.el"))
;;       ((or emacs23-p emacs22-p)
;;        (load-safe "~/.emacs.d/cocoa/emacs-auto-install.el")))

;; 共通で使用する
;; (load-safe "~/.emacs.d/emacs-pukiwiki.el")
(load-safe "~/.emacs.d/emacs-migemo.el")
(load-safe "~/.emacs.d/emacs-shell.el")
(load-safe "~/.emacs.d/emacs-javascript.el")

(load-safe "~/.emacs.d/emacs-wl.el")
(load-safe "~/.emacs.d/emacs-dired.el")
(load-safe "~/.emacs.d/emacs-ruby.el")
(load-safe "~/.emacs.d/emcas-golang.el")
(load-safe "~/.emacs.d/emacs-view.el")
(load-safe "~/.emacs.d/emacs-w3m.el")
;; (load-safe "~/.emacs.d/emacs-unique.el") ; 何かおかしい

;; Cocoa Emacsで使用する各種elispパッケージの設定
(if (memq window-system '(ns mac))
    (load-safe "~/.emacs.d/cocoa/emacs-themes.el"))
(load-safe "~/.emacs.d/cocoa/emacs-info.el")
(load-safe "~/.emacs.d/cocoa/emacs-helm.el")
(load-safe "~/.emacs.d/cocoa/emacs-auto-complete.el")
;; (load-safe "~/.emacs.d/cocoa/emacs-nxhtml.el")
(load-safe "~/.emacs.d/cocoa/emacs-web.el")
(load-safe "~/.emacs.d/cocoa/emacs-popwin.el") ; もしかしてたら、バグがあるかも
(if (locate-library "popwin")
    (load-safe "~/.emacs.d/cocoa/emacs-direx.el"))
;; emacs 23.2 と emacs 23.1でフォントの設定を分ける
(cond ((and window-system emacs23.1-p)
       (load-safe "~/.emacs.d/cocoa/emacs-fonts.el"))
      ((and window-system emacs23.2-p)
       (load-safe "~/.emacs.d/cocoa/emacs-fonts-for-23.2.el"))
      ((and window-system (or emacs23.3-p emacs23.4-p emacs24-p emacs-bzr-p))
       (load-safe "~/.emacs.d/cocoa/emacs-fonts-macemacsjp.el")))
(load-safe "~/.emacs.d/cocoa/emacs-auctex.el")
(load-safe "~/.emacs.d/cocoa/emacs-print.el")
(load-safe "~/.emacs.d/cocoa/emacs-howm.el")
(load-safe "~/.emacs.d/cocoa/emacs-lookup.el")
(load-safe "~/.emacs.d/cocoa/emacs-markdown.el")
(load-safe "~/.emacs.d/cocoa/emacs-outline.el")
(load-safe "~/.emacs.d/cocoa/emacs-epa.el") ; gnupg でないと動かない
(if (eq nox-p 'nil)
    (load-safe "~/.emacs.d/cocoa/emacs-elscreen.el"))
(load-safe "~/.emacs.d/cocoa/emacs-recentf.el")
(cond ((or emacs24-p emacs23.4-p emacs-bzr-p)
       (load-safe "~/.emacs.d/cocoa/emacs-magit.el")))
(if (file-exists-p "~/local/gtags")
    (load-safe "~/.emacs.d/cocoa/emacs-gtags.el"))
(load-safe "~/.emacs.d/cocoa/emacs-eshell.el")
;;(when (memq window-system '(mac ns))
;;  (load-safe "~/.emacs.d/cocoa/emacs-exec-path-from-shell.el"))
;; auto-install を使ってインストールしたパッケージ
;; (load-safe "~/.emacs.d/cocoa/emacs-speedbar.el")
;; (load-safe "~/.emacs.d/cocoa/emacs-pos-tip.el")
(load-safe "~/.emacs.d/cocoa/emacs-id-manager.el")
(load-safe "~/.emacs.d/cocoa/emacs-projectile.el")

;; ネットワークに接続しているときに読み込む
;; (if (eq (have-network-interface-p '("en0" "en1" "en2" "ppp0")) t)
;;     (progn
;;       (load-safe "~/.emacs.d/emacs-navi2ch.el")
;;       (load-safe "~/.emacs.d/emacs-twittering.el")
;;       (load-safe "~/.emacs.d/cocoa/emacs-auto-install.el")))

;; have-network-interface-pが使えない
;; (load-safe "~/.emacs.d/emacs-navi2ch.el")
(load-safe "~/.emacs.d/emacs-twittering.el")
;; auto-installは使わない
;; (load-safe "~/.emacs.d/cocoa/emacs-auto-install.el")

;; 全てのelispのloadが終了したあとに読み込む外部ファイル
(when (and (locate-library "wl")
           (locate-library "bbdb")
           (locate-library "auto-complete"))
  (load-safe "~/.emacs.d/wl/bbdb-complete.el"))

;; Cocoa Emacs 特有の設定

;; キーバインドの変更 (CommandキーをMetaキーに変更)
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; ショートカットキーをシステムに取られないようにする
(setq mac-pass-control-to-system nil)
(setq mac-pass-command-to-system nil)
(setq mac-pass-option-to-system nil)

;; D'n'Dでファイルを開く
(define-key global-map [ns-drag-file] 'ns-find-file)
;; D'n'Dでファイルを開くときに新しい窓を開かない
(setq ns-pop-up-frames nil)

;; yank したときに属性を保持しない
;; 完全版
(defadvice kill-new (around my-kill-ring-disable-text-property activate)
  (let ((new (ad-get-arg 0)))
    (set-text-properties 0 (length new) nil new)
    ad-do-it))
;; kill-ringには属性を保持させる
;; (setq yank-excluded-properties t)
 
;; ウィンドウサイズの設定
(if window-system 
    (progn
      (setq initial-frame-alist 
            '((width . 90) (height . 50)
              (top . 0) (left . 0)))))

;; browse-urlをopenに割り当てる
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program
      (if (file-exists-p "/usr/bin/open")
          "/usr/bin/open"))

;; emacs 23.2からの機能
(when (>= emacs-minor-version 2)
  (setq default-file-name-coding-system "utf-8-hfs")
  ;; Shift+何かを入力したときにShiftキーをIMに渡す
  ;; (mac-add-key-passed-to-system 'shift)
  )

;; Quartz 2Dのアンチエイリアスを利用する
(setq mac-allow-anti-aliasing t)

;; customize file for cocoa emacs
(setq custom-file "~/.emacs.d/cocoa/my-customize.el")
