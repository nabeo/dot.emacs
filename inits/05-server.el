;;; 05-server --- emacs server
;;; Commentary:

;;; Code:
(use-package server
  :if (window-system)
  :config
  (unless (eq (server-running-p) 't)
    (server-start)))

;;; 05-server.el ends here
