;;; 10-japanese --- language
;;; Commentary:

;;; Code:
(set-language-environment 'Japanese)

;; http://nijino.homelinux.net/emacs/emacs23-ja.html
;; https://github.com/awasira/cp5022x.el
;; encode-translation-table の設定
(coding-system-put 'euc-jp :encode-translation-table
                   (get 'japanese-ucs-cp932-to-jis-map 'translation-table))
(coding-system-put 'iso-2022-jp :encode-translation-table
                   (get 'japanese-ucs-cp932-to-jis-map 'translation-table))
(coding-system-put 'cp932 :encode-translation-table
                   (get 'japanese-ucs-jis-to-cp932-map 'translation-table))
;; charset と coding-system の優先度設定
;; (set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
;;                       'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
;; (set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)
;; PuTTY 用の terminal-coding-system の設定
;; (apply 'define-coding-system 'utf-8-for-putty
;;        "UTF-8 (translate jis to cp932)"
;;        :encode-translation-table 
;;        (get 'japanese-ucs-jis-to-cp932-map 'translation-table)
;;        (coding-system-plist 'utf-8))
;; (set-terminal-coding-system 'utf-8-for-putty)

; 機種依存文字
(use-package cp5022x
  :ensure t
  :init
  :config
  (set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
                        'katakana-jisx0201 'iso-8859-1 'unicode)
  (set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)
)

(prefer-coding-system 'utf-8)
(if (eq emacs24-p 'nil)
    (setq default-input-method "MacOSX"))

(provide '10-japanese)
;;; 10-japanese.el ends here
