;;; 20-shell --- setup shell mode
;;; Commentary:

;;; Code:
(setq shell-mode-hock
	  (function (lambda ()
				  (define-key shell-mode-map [\C-p] 'comint-previous-input)
				  (define-key shell-mode-map [\C-n] 'comint-next-input)
				  (define-key shell-mode-map [up] 'comint-previous-input)
				  (define-key shell-mode-map [down] 'comint-next-input))))

;; コマンド出力後に改行を入れない
(setq system-uses-terminfo nil)

(provide '20-shell)
;;; 20-shell.el ends here
