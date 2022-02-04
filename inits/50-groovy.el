;;; 50-groovy --- groovy
;;; Commentary:

;;; Code:
(use-package groovy-mode
  :ensure t
  :mode
  ( ("\\.groovy\\'" . groovy-mode)
    ("\\.gradle\\'" . groovy-mode)
    ("Jenkinsfile\\'" . groovy-mode))
  :interpreter
  (("groovy" . groovy-mode))
  :config
  (add-hook 'groovy-mode-hook
    #'(lambda ()
       (require 'groovy-electric)
       (groovy-electric-mode)))
  )

(provide '50-groovy)
;;; 50-groovy.el ends here
