;; last update is ....
;; Time-stamp: "Thu Feb 04 18:45:42 JST 2010"

;; (load "rng-auto")
;; (load "autostart")
;; (require 'mumamo)

;; 必要に応じて読み込ませる
(mapc (lambda (list)
        (mapc (lambda (pair)
                (if (or (eq (cdr pair) 'html-mode)
                        (eq (cdr pair) 'php-mode))
                    (setcdr pair (lambda ()
                                   (require 'nxhtml-mode "/Applications/Emacs.app/Contents/Resources/site-lisp/nxhtml/autostart.el")
                                   (nxhtml-mumamo-mode)))))
              list))
      (list auto-mode-alist magic-mode-alist))

(setq nxhtml-skip-welcome t)
(setq rng-nxml-auto-validate-flag nil) ;; バリデートしない(必要なときはC-c C-vで切り替え)
(setq mumamo-chunk-coloring 'submode-colored)
(setq nxml-degraded t)
(setq indent-regent-mode t)

;; nxhtml-modeは文字コードの判別に難があるので使わない
;;(add-to-list 'auto-mode-alist '("\\.html\\" .html-mode))
;;(add-to-list 'auto-mode-alist '("\\.htm\\" .html-mode))

;; phpでのアウトラインモード (outline-mode)
(defun php-outline-level ()
  (save-excursion
	(looking-at outline-regexp)
	(let ((title (buffer-substring (match-beginning 1) (match-end 1))))
	  (cond ((equal (substring title 0 2) "<?") 0)
			((equal (substring title 0 2) "?>") 0)
			((equal (substring title 0 6) "public") 1)
			((equal (substring title 0 7) "private") 1)
			((equal (substring title 0 8) "function") 1)
			((equal (substring title 0 5) "class") 1)
			((equal (substring title 0 2) "**") 15)
			(t (length title))))))
;; pearのコーディング規約
(setq php-mode-force-pear t)

(add-hook 'php-mode-hook
          '(lambda ()
             (setq outline-level 'php-outline-level)
             (setq outline-regexp "^[ \t]*\\(<\\?\\|\\?>\\|public\\|private\\|class\\|function\\|/\\*\\*\\)")
             (outline-minor-mode t)
             ;; マニュアル類
             (setq php-manual-path "~/.emacs.d/php-doc-ja")
             (setq php-manual-url "http://jp2.php.net/manual/ja/index.php")
             ))

