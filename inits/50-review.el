;;; 50-review --- Re:VIEW mode
;;; Commentary:

;;; Code:
(use-package review-mode
  :ensure t
  :hook
  (review-mode .
    (lambda ()
      (flycheck-add-mode 'textlint 'review-mode)))
  )

(provide '50-review)
;;; 50-review.el ends here
