;; http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?OrgMode
(use-package howm
  :ensure t
  :commands (howm-create howm-menu)
  :bind
  (("C-c , ," . howm-menu)
   ;; リンクをTABでたどる
   :map howm-mode-map
   (([tab] . action-lock-goto-next-link)
    ([(meta tab)] . action-lock-goto-previous-link)))
  :config
  (setq howm-menu-lang 'ja)
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
  )
