;;; 50-highlight-indent-guides --- highlight-indent-guides.el
;;; Commentary:

;;; Code:
(use-package highlight-indent-guides
  :ensure t
  :diminish
  :hook
  ((prog-mode yaml-mode) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-auto-enabled t)
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'character)
  )

(provide '50-highlight-indent-guides)
;;; 50-highlight-indent-guides ends here
