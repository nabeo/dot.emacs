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
  ;; :mode
  ;; (("\\.md\\'" . poly-markdown-mode))
  :config
  (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode)))

(use-package poly-ansible
  :ensure t)

(use-package poly-ruby
  :ensure t)

(use-package poly-rst
  :ensure t)

(use-package poly-erb
  :ensure t)

(provide '30-poly)
;;; 30-poly.el ends here
