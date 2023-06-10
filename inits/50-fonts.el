;;; 50-fonts --- setup font
;;; Commentary:

;;; Code:
(let* 
  (
    (asciifont "Monaco")
    ;; (asciifont "Source Han Mono-12:weight=normal:slant=normal")
    (jpfont "Hiragino Kaku Gothic ProN")
    ;; (jpfont "Hiragino Maru Gothic ProN")
    ;; (jpfont "Source Han Mono-12:weight=normal:slant=normal")
    )

  ;; ASCII フォントをベースにしてフォントセットを作る
  (create-fontset-from-ascii-font
    asciifont
    nil
    "myfontset")

  ;; unicode を丸ごと jpfont で設定する
  (set-fontset-font
    "fontset-myfontset"
    'unicode
    jpfont
    nil
    'append)

  ;; 組み上げたフォントセットをデフォルトフレームに設定する
  (add-to-list 'default-frame-alist '(font . "fontset-myfontset"))
  )

;; カーソル位置のフォントを判別する
;; https://qiita.com/j8takagi/items/01aecdd28f87cdd3cd2c
(defun xlfd-at (pos)
  "Return X logical font description (XLFD) of the font at POS in the current buffer."
  (if (not (display-graphic-p))
      (message "Display is not graphic. So font is not used.")
    (font-xlfd-name (font-at pos))))

(defun xlfd-cursor-position (pos)
  "Return X logical font description (XLFD) of the font at the point."
  (interactive "d")
  (message (xlfd-at pos)))

(provide '50-fonts)
;;; 50-fonts.el ends here
