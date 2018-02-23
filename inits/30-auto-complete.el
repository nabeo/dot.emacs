(use-package auto-complete
  :ensure t
  :config
  (use-package auto-complete-config)
  (use-package go-autocomplete :ensure t)
  (setq ac-use-menu-map t)
  (global-auto-complete-mode nil)
  (setq ac-auto-start nil)
  (setq ac-dwim t)
  (ac-config-default)
  (setq ac-comphist-file (expand-file-name
                          "data/ac-comphist.data"
                          user-emacs-directory))
  (setq-default ac-sources '(ac-source-features
                             ac-source-functions
                             ac-source-yasnippet
                             ac-source-variables
                             ac-source-symbols
                             ac-source-abbrev
                             ac-source-dictionary
                             ac-source-words-in-same-mode-buffers
                             ac-source-filename))
  ;; hooks
  ;; emacs-lisp-mode for auto-complete
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (add-to-list 'ac-sources ac-source-symbols)
              (add-to-list 'ac-sources ac-source-imenu)
              (ac-emacs-lisp-mode-setup)))

  ;; ruby-mode for auto-complete
  (add-hook 'ruby-mode-hook
            (lambda()
              (add-to-list 'ac-sources ac-source-imenu)
              (ac-ruby-mode-setup)))

  ;; go-mode for auto-complete
  (add-hook 'go-mode-hook
            (lambda ()
              (add-to-list 'ac-sources ac-source-go)
              (add-to-list 'ac-sources ac-source-imenu)))

  ;; wanderlust for auto-complete
  (add-hook 'bbdb-mode-hook
            (lambda()
              (add-to-list 'ac-sources 'ac-source-bbdb)))
  )

(use-package ac-helm
  :ensure t
  :if (locate-library "helm")
  :commands (ac-complete-with-helm)
  :bind
  (([remap auto-complete] . ac-complete-with-helm))
  :config
  )

