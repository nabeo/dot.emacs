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

;; http://moyashi.air-nifty.com/hitori/2007/12/emacscarbon_ema_5f82.html
;; http://sakito.jp/mac/dictionary.html#emacs <- こっちを使っている
;; Mac OS Xの辞書.appで単語を調べる
(defun my-search-at-dictionary-app ()
  "dictionary.app" 
  (interactive)
  
  (let ((editable (not buffer-read-only))
        (pt (save-excursion (mouse-set-point last-nonmenu-event)))
        beg end)
    
    (if (and mark-active
             (<= (region-beginning) pt) (<= (region-end)) )
        (setq beg (region-beginning)
              end (region-end))
      (save-excursion
        (goto-char pt)
        (setq end (progn (forward-word) (point)))
        (setq beg (progn (backward-word) (point)))
        ))
    
    (browse-url
     (concat "dict://"
             (url-hexify-string (buffer-substring-no-properties beg end))))))
(global-set-key "\C-c\C-d" 'my-search-at-dictionary-app)

;; PATH の追加
(setenv "PATH" (concat (getenv "PATH") ":" "/opt/local/bin" ":" "/opt/local/sbin"))

;; 日本語入力時のちらつきを抑制する
;; http://qiita.com/takaxp/items/e07bb286d80fa9dd8e05
(cond ((boundp 'mac-ime-cursor-type)
       (setq mac-ime-cursor-type '(bar . 2))))

;; UTF-8
(prefer-coding-system 'utf-8)
