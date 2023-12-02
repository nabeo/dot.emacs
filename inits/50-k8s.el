;;; 50-k8s --- k8s
;;; Commentary:

;;; Code:
(use-package k8s-mode
    :ensure t
    :hook
    (k8s-mode . yas-minor-mode)
    )

(provide '50-k8s)
;;; 50-k8s.el ends here
