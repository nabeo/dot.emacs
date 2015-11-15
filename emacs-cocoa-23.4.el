

;; ~/local/emacs/site-lisp以下は再帰的にload-pathに追加する
(let ((default-directory (expand-file-name "~/local/emacs-23.4/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
