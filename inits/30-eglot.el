;;; 30-eglot --- eglot
;;; Commentary:

;;; Code:
(use-package eglot
  :hook
  (prog-major-mode . eglot-ensure)
  (go-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (typescript-mode . eglot-ensure)
  (javascript-mode . eglot-ensure)
  (rust-mode . eglot-ensure)
  (json-mode . eglot-ensure)
  (terraform-mode . eglot-ensure)
  (yaml-mode . eglot-ensure)
  )

(provide '30-eglot)
;;; 30-eglot.el ends here
