(use-package yasnippet
  :ensure t
  :commands (yas-minor-mode yas-global-mode)
  :diminish yas-minor-mode
  :disabled t
  ;; :bind (:map
  ;;        yas-minor-mode-map
  ;;        ("C-x i i" . yas-insert-snippet)
  ;;        ("C-x i n" . yas-new-snippet)
  ;;        ("C-x i v" . yas-visit-snippet-file)
  ;;        ("C-x i l" . yas-describe-tables)
  ;;        ("C-x i g" . yas-reload-all)) 
  :init
  (progn
    (setq yas-snippet-dirs nil)
    (add-hook 'prog-mode-hook 'yas-minor-mode)
    (add-hook 'go-mode-hook 'yas-minor-mode)
    (add-hook 'emacs-lisp-mode-hook 'yas-minor-mode))
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"
                           yas-installed-snippets-dir))
  (yas-global-mode 1)
  (yas-reload-all)
  )  
