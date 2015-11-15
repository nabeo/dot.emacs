;; Last update is ....
;; Time-stamp: "Mon Dec 06 12:35:43 JST 2010"

(require 'tex-site)
(require 'tex)

(setq TeX-default-mode 'japanese-LaTex-mode)
(setq japanese-LaTeX-default-style "jsarticle")
(setq japanese-LaTeX-command-default "pLaTeX")
(setq kinsoku-limit 10)
(setq LaTeX-indent-level 2)
(setq LaTeX-item-indent 2)

(add-hook 'LaTeX-mode-hook
          (function (lambda () (outline-minor-mode t))))

;; PATHの設定 (TeXLive 2010をisoからインストール)
(setq exec-path (cons "/usr/local/texlive/2010/bin/universal-darwin" exec-path))
