;;; 05-load-path --- setup load-path
;;; Commentary:

;;; Code:
;; ~/local/emacs/site-lisp以下は再帰的にload-pathに追加する
(let ((default-directory (expand-file-name "~/local/emacs/site-lisp")))
  (if (file-exists-p default-directory)
      (progn
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path)))))

(provide '05-load-path)
;;; 05-load-path.el ends here
