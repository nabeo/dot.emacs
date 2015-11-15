;; last update is ....
;; Time-stamp: "Wed Aug 12 23:30:00 JST 2015"

;; http://d.hatena.ne.jp/tarao/20150221/1424518030
;; El-Get でインストールしたパッケージ : ~/.emacs.d/`emacs-version'/el-get
;; package.el でインストールしたパッケージ : ~/.emacs.d/`emacs-version'/elpa
(let ((versioned-dir (locate-user-emacs-file emacs-version)))
  (setq el-get-dir (expand-file-name "el-get" versioned-dir)
        package-user-dir (expand-file-name "elpa" versioned-dir)))

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously 
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-point-last-sexp)))
