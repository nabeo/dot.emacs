;; Time-stamp: "Sun Feb 20 15:04:38 JST 2011"
(setq shell-mode-hock
	  (function (lambda ()
				  (define-key shell-mode-map [\C-p] 'comint-previous-input)
				  (define-key shell-mode-map [\C-n] 'comint-next-input)
				  (define-key shell-mode-map [up] 'comint-previous-input)
				  (define-key shell-mode-map [down] 'comint-next-input))))

;; コマンド出力後に改行を入れない
(setq system-uses-terminfo nil)

