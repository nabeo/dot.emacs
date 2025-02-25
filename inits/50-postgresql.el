;;; 50-postgresql --- PostgreSQL
;;; Commentary:

;;; Code:

(cond
  ;; Emacs 30 以降では use-package に組み込まれている
  ((<= emacs-major-version 30)
    (use-package pg
      :ensure t
      :vc (pg :url "https://github.com/emarsden/pg-el" :branch "main"))
    (use-package pgmacs
      :ensure t
      :vc (pgmacs :url "https://github.com/emarsden/pgmacs" :branch "main")))
  ;; Emacs 30 以前の環境では vc-use-package を利用する
  ((package-installed-p 'vc-use-package)
    (use-package pg
      :vc (pg :type git :host github :repo "emarsden/pg-el"))
    (use-package pgmacs
      :vc (pgmacs :type git :host github :repo "emarsden/pgmacs"))
    ))

(provide '50-postgresql)
;;; 50-postgresql.el ends here
