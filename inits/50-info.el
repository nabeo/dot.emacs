(use-package info
  :config
  (defun add-info-path (path)
    "Info-default-directory-list に `path' を追加"
    (interactive "p")
    (if (file-exists-p path)
        (setq Info-default-directory-list
              (cons (expand-file-name path) Info-default-directory-list))))

  (add-info-path "~/local/emacs/info")    ; for my local infos
  (add-info-path "/opt/local/share/info") ; for macports infos
  (add-info-path "~/local/gtags/share/info") ; for local installed global
  (add-info-path "~/local/idutils/share/info") ; for local installed idutils
  )
