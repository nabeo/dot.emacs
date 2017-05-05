(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'go-mode-hook 'yas-minor-mode)

(cond ((locate-library "helm-c-yasnippet")
       (setq helm-yas-space-match-any-greedy t)
       (global-set-key (kbd "C-c y") 'helm-yas-complete)
       ))
