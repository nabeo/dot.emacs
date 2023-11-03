;;; 50-docker --- docker
;;; Commentary:

;;; Code:
(use-package docker
  :ensure t
  :bind
  :init
  :config
  )

(use-package dockerfile-mode
  :ensure t
  :mode
  ("Dockerfile\\'" . dockerfile-mode)
  ("Dockerfile.*\\'" . dockerfile-mode)
  :init
  :config
)

(use-package docker-compose-mode
  :ensure t)

(provide '50-docker)
;;; 50-docker.el ends here
