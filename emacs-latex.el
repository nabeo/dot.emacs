;; last update is ....
;; Time-stamp: "Wed Jun 25 15:15:53 JST 2008"

(add-hook 'LaTeX-mode-hook
		  (function (lambda () (outline-minor-mode t))))

(setq TeX-outline-extra
	  '(
		;("^\\\\begin{slide}" 0)
		))