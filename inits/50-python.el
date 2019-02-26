;;; 50-python --- python
;;; Commentary:

;;; Code:
(use-package pyenv-mode
  :init
  (add-to-list 'exec-path (expand-file-name "~/.pyenv/shims"))
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto
  :config
  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
        (pyenv-mode-unset))))

  (add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set))

(provide '50-python)
;;; 50-python ends here