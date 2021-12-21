;;; 50-jsonnet --- jsonnet
;;; Commentary:

;;; Code:
(use-package jsonnet-mode
  :ensure t
  :if (executable-find "jsonnet")
  :mode
  ("\\.jsonnet\\'" . jsonnet-mode)
  :hook
  :init
  :config
  (setq jsonnet-use-smie t)
  )

(provide '50-jsonnet)
;;; 50-jsonnet ends here
