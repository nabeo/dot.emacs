(use-package auctex
  :ensure t
  :disabled t
  :config
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
  )
