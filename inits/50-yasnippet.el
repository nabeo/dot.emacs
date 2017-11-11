(use-package yasnippet
  :ensure t
  :disabled t
  :init
  (setq yas-snippet-dirs nil)
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'go-mode-hook 'yas-minor-mode)
  (add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
)  
