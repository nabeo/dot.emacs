;;; 50-highlight-indent --- highlight-indent.el
;;; Commentary:

;;; Code:
(use-package highlight-indent-guides
  :ensure t
  :disabled (>= emacs-major-version 29)
  :diminish
  :hook
  ((prog-mode yaml-mode) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-auto-enabled t)
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'character)
  )

(provide '50-highlight-indent)
;;; 50-highlight-indent-guides.el ends here
