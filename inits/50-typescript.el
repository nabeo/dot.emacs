;;; 50-typescript --- typescript
;;; Commentary:

;;; Code:
(use-package typescript-mode
  :ensure t
  :mode
  ("\\.ts\\'" . typescript-mode)
  ("\\.tsx\\'" . typescript-mode)
  )

;; brew install nodenv
(use-package nodenv
  :ensure t
  :hook
  (js-mode . nodenv-mode)
  (typescript-mode . nodenv-mode)
  :init
  (add-to-list 'exec-path (expand-file-name "~/.nodenv/shims"))
  )

(provide '50-typescript)
;;; 50-typescript ends here
