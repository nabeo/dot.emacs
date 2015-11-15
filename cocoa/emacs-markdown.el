;; last update is ....
;; Time-stamp: "Sat Jan 12 22:49:29 JST 2013"
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.mdwn" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdt" . markdown-mode))

;; use with outline-minor-mode
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq outline-regexp (concat "[#*]+"))
            (setq outline-heading-alist
                  '(("#" . 1) ("##" . 2) ("###" . 3)
                    ("####" . 4) ("#####" . 5) ("######" . 6)))
            (outline-minor-mode)))
