;;; 30-poly --- poly-mode
;;; Commentary:
;;; https://polymode.github.io/
;;;
;;; poly-mode is  a framework for multiple major modes (MMM)
;;; inside a single Emacs buffer.  It is fast and has a simple
;;; but flexible object oriented design.

;;; Code:
(use-package polymode
  :ensure t)

(use-package poly-markdown
  :ensure t
  :mode
  (("\\.md\\'" . poly-markdown-mode))
  )

(provide '30-poly)
;;; 30-poly ends here
