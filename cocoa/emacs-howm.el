;; last update is ....
;; Time-stamp: "Mon Jan 14 00:40:06 JST 2013"

;; http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?OrgMode
;; (require 'org)
;; (add-hook 'org-mode-hook 'howm-mode)
;; (add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))
;; (setq howm-view-title-header "*")       ;; howmのロードより前に書く必要がある
;; howmのキーを「C-c, 」から「C-cC-c, 」に変更
;; (setq howm-prefix "\C-c\C-c")

(autoload 'howm-create "howm" "Hitori Otegaru Wiki Modoki." t)
(autoload 'howm-menu   "howm" "Hitori Otegaru Wiki Modoki." t)

(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)

;; リンクをTABでたどる
(eval-after-load "howm-mode"
  '(progn
     (define-key howm-mode-map [tab] 'action-lock-goto-next-link)
     (define-key howm-mode-map [(meta tab)] 'action-lock-goto-previous-link)))

;; 「最近のメモ」一覧時にタイトルを表示
(setq howm-list-recent-title t)
;; 全メモ一覧時にタイトルを表示
(setq howm-list-all-title t)
;; メニューを2時間キャッシュ
(setq howm-menu-expiry-hours 2)

;; メニューを自動更新しない
(setq howm-menu-refresh-after-save nil)
;; 下線を引き直さない
(setq howm-refresh-after-save nil)
;; howmのディレクトリをDropboxにする
(setq howm-directory "~/Dropbox/emacs/howm/")

;; howmの時はauto-fill
;; (add-hook 'howm-mode-on-hook 'auto-fill-mode)

;; RETでファイルを開き、一覧バッファを消す
;; C-u RETなら残る
(setq howm-view-summary-presistent nil)

;; メニューの予定表の表示範囲
;; 10日前から
(setq howm-menu-schedule-days-before 10)
;; 3日後まで
(setq howm-menu-schedule-days 3)

;; howmのファイル名
;; 1メモ、1ファイル (デフォルト)
(setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.howm")
;; 1日、1ファイル
;; (setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")

;; 検索しないファイルの正規表現
(setq howm-excluded-file-regexp
      "/\\.#\\|[~#]$\\|\\.bak$\\|/CVS/\\|\\.doc$\\|\\.pdf$\\|\\.ppt$\\|\\.xls$")

;; 内容が0ならファイルを削除
(if (not (memq 'delete-file-if-no-contents after-save-hook))
    (setq after-save-hook
          (cons 'delete-file-if-no-contents after-save-hook)))
(defun delete-file-if-no-contents ()
  (when (and
         (buffer-file-name (current-buffer))
         (string-match "\\.howm" (buffer-file-name (current-buffer)))
         (= (point-min) (point-max)))
    (delete-file
     (buffer-file-name (current-buffer)))))

;; markdown-modeと併用する
;; *.howm を markdown-mode で開く
(add-to-list 'auto-mode-alist '("\\.howm$" . markdown-mode))

;; outline-modeと併用する (使わない : 2013/01/14)
;; http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?OutlineMode
;; *.howm を outline-mode で開く
;; (add-to-list 'auto-mode-alist '("\\.howm$" . outline-mode))
;; (add-hook 'howm-mode-hook
;;           (function
;;            (lambda()
;;              (progn
;; ;; =で始まる行を outline の最上位にする
;;                (setq outline-heading-alist
;;                      '(("=" . 1) ("*" . 2) ("**" . 3)
;;                        ("***" . 4) ("****" . 5)))
;;                (setq outline-regexp
;;                      (concat "[*=]+"))
;;                ))))
