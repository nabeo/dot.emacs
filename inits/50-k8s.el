;;; 50-k8s --- k8s
;;; Commentary:

;;; Code:
(use-package k8s-mode
  :ensure t
  :hook
  (k8s-mode . yas-minor-mode)
  )

(use-package kubedoc
  :ensure t)

(use-package kubel
  :ensure t
  :if (executable-find "kubectl")
  :after (vterm)
  :config
  (kubel-vterm-setup)
  )

(provide '50-k8s)
;;; 50-k8s.el ends here
