;; last update is ....
;; Time-stamp: "Thu Feb 28 10:26:15 JST 2008"

; yatex-mode
(setq auto-mode-alist
	  (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;(defvar YaTeX-dvi2-command-ext-alist
;  '(("xdvi" . ".dvi")
;	("ghostview\\|gv" . "ps")
;	("acroread\\|pdf\\|Preview\\|TeXShop" . ".pdf")))
; MxDVIをつかってdviファイルを閲覧
(setq dvi2-command "open -a Mxdvi")
; \usepackage{amsmath}はAMS-LaTeXを使う
(setq YaTeX-use-AMS-LaTeX t)
; section型補完でミニバッファから入力しない
(setq YaTeX-skip-default-reader t)
;; yatexでのアウトラインモード
(make-variable-buffer-local 'outline-regexp)
(make-variable-buffer-local 'outline-level)
(setq-default outline-level 'outline-level)
(defun latex-outline-level ()
  (save-excursion
	(looking-at outline-regexp)
	(let ((title (buffer-substring (match-beginning 1) (match-end 1))))
	  (cond ((equal (substring title 0 4) "docu") 15)
			((equal (substring title 0 4) "chap") 0)
			((equal (substring title 0 4) "appe") 0)
			(t (length title))))))
(add-hook 'yatex-mode-hook
		  '(lambda () (outline-minor-mode t)))
(add-hook
 'yatex-mode-hook
 (function
  (lambda ()
	(progn
	  (setq outline-level 'latex-outline-level)
	  (setq outline-regexp
		  (concat "[ \t]*\\\\\\(documentstyle\\|documentclass\\|"
				  "chapter\\|section\\|subsection\\|subsubsection\\)"
				  "\\*?[ \t]*[[{]")
		  )))))

; yahtml-mode
;(setq auto-mode-alist
;	  (append '(("\\.html$"  . yahtml-mode)
;				("\\.htm$" . yathml-mode))
;			  auto-mode-alist))
;(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
(setq yahtml-www-browser "Firefox.app")
(setq yahtml-template-file 
	  (expand-file-name "~/.emacs.d/template-files/template.html"))
