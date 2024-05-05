;;; 30-mise -- mise
;;; Commentary:

;;; Code:
(use-package mise
  :ensure t
  :if (and
       (executable-find "mise")
       (file-exists-p "~/.local/share/mise/shims"))
  :hook
  (after-init . global-mise-mode)
  :init
  (setenv "PATH" (concat (expand-file-name "~/.local/share/mise/shims") ":" (getenv "PATH")))
  (add-to-list 'exec-path (expand-file-name "~/.local/share/mise/shims"))
)

(provide '30-mise)
;;; 30-mise.el ends here
