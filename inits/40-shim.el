;;; 40-shim --- shim.el
;;; Commentary:

;;; Code:
;; https://github.com/twlz0ne/shim.el
;; git submodule add https://github.com/twlz0ne/shim.el site-lisp/shim
(use-package shim
  :load-path "~/.emacs.d/site-lisp/shim"
  :disabled t
  :hook
  (js-mode . shim-mode)
  (typescript-mode . shim-mode)
  :config
  (shim-init-node :major-modes
                  '(js-mode
                    js2-mode
                    typescript-mode))
  )

(provide '40-shim)
;;; 40-shim ends here
