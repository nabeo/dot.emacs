;;; 50-postgresql --- PostgreSQL
;;; Commentary:

;;; Code:
(use-package pg
  :ensure t
  :if (<= emacs-major-version 30)
  :vc (pg :url "https://github.com/emarsden/pg-el" :branch "main"))

(use-package pgmacs
  :ensure t
  :if (<= emacs-major-version 30)
  :vc (pgmacs :url "https://github.com/emarsden/pgmacs" :branch "main"))

(provide '50-postgresql)
;;; 50-postgresql.el ends here
