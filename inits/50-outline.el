;; last update is ....
;; Time-stamp: "Sat Jan 12 22:39:10 JST 2013"

;; misc setting
(make-variable-buffer-local 'outline-level)
(setq-default outline-level 'outline-level)

;; outline-heading-alist
(setq outline-heading-alist
      '(("*" . 1) ("**" . 2) ("***" . 3)
        ("****" . 4) ("*****" . 5)))
(setq outline-regexp (concat "[*]+"))

;; outline-mode で imenu-tree を使って左側にアウトラインを表示させる
;; http://d.hatena.ne.jp/kitokitoki/20100517/p2
;; emacswikiから
;; windata.el, tree-mode.el, imenu-tree.el をダウンロードする
(add-hook 'outline-mode-hook
          (lambda ()
            (require 'imenu-tree))
          (global-set-key (kbd "M-h") 'imenu-tree))

;; just define a hook for the minor mode that just defines an additional prefix key.
;; http://emacswiki.org/emacs/OutlineMinorMode
(add-hook 'outline-minor-mode-hook
          (lambda ()
            (local-set-key "\C-c\C-c" outline-mode-prefix-map)))

;; http://www.emacswiki.org/emacs/download/outline-magic.el
;; http://www.emacswiki.org/emacs/OutlineMagic
(eval-after-load 'outline
  '(progn
    (require 'outline-magic)
    (define-key outline-minor-mode-map (kbd "<backtab>") 'outline-cycle)))

