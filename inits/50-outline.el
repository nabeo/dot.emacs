(use-package outline
  :init
  (add-hook 'outline-minor-mode-hook
            (lambda ()
              (local-set-key "\C-c\C-c" outline-mode-prefix-map)))
  :config
  (make-variable-buffer-local 'outline-level)
  (setq-default outline-level 'outline-level)
  ;; outline-heading-alist
  (setq outline-heading-alist
        '(("*" . 1) ("**" . 2) ("***" . 3)
          ("****" . 4) ("*****" . 5)))
  (setq outline-regexp
        (concat "[*]+"))
  )
