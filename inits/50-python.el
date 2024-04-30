;;; 50-python --- python
;;; Commentary:

;;; Code:
(use-package py-yapf
  :ensure t
  :hook (python-mode . py-yapf-enable-on-save)
  )

(provide '50-python)
;;; 50-python.el ends here
