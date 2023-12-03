;;; 50-term --- terminal emulator for emacs
;;; Commentary:

;;; Code:
(use-package vterm
  :ensure t
  :custom
  (vterm-max-scrollback 10000000)
  (vterm-buffer-name-string "vterm: %s")
  )

(provide '50-term)
;;; 50-term.el ends here
