;;; 50-typescript --- typescript
;;; Commentary:

;;; Code:
(use-package typescript-mode
  :ensure t
  :mode
  ("\\.ts\\'" . typescript-ts-mode)
  ("\\.tsx\\'" . typescript-ts-mode)
  :custom
  (typescript-indent-level 2)
  )

;; for npm
(use-package npm
  :ensure t
  :disabled
  )

(provide '50-typescript)
;;; 50-typescript ends here
