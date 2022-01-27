;;; 50-python --- python
;;; Commentary:

;;; Code:
(use-package pyenv-mode
  :ensure t
  :init
  (add-to-list 'exec-path (expand-file-name "~/.pyenv/shims"))
  (add-to-list 'exec-path (expand-file-name "~/.pyenv/bin"))
  (setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.pyenv/shims")))
  (setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.pyenv/bin")))
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto
  :ensure t
  :config
  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
        (pyenv-mode-unset))))

  (add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set))

(use-package py-yapf
  :ensure t
  :hook (python-mode . py-yapf-enable-on-save)
  )

(provide '50-python)
;;; 50-python ends here
