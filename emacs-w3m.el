(require 'w3m)

(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a www browser to show a URL." t)
(setq w3m-default-display-inline-images t)
(setq w3m-use-cookies t)

(global-set-key "\C-xm" 'browse-url-at-point)
(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)

(autoload 'w3m-search "w3m-search" "Search QUERY using SEARCH-ENGIN." t)
(setq w3m-search-defalut-engin "google-ja")

;; (defadvice browse-url-at-point
;; 	(around change-browse-url-browser-function activate)
;; 	"Use Netscape only when it is invoked in an emacs-wem buffer."
;; 	(let ((browse-url-browser-function
;; 		(if (eq major-mode 'w3m-mode)
;; 			'browse-url-netscape
;; 		'w3m-browse-url)))
;; 	ad-do-it))

;; (eval-after-load "dired"
;; 	'(define-key dired-mode-map "\C-xm" 'dired-w3m-find-file))
;; (defun dired-w3m-find-file ()
;; 	(interactive)
;; 	(require 'w3m)
;; 	(let ((file (dired-get-filename)))
;; 		(if (y-or-n-p (format "Use emacs-w3m to browse %s? "
;; 				(file-name-nondirectory file)))
;; 			(w3m-find-file file))))
;; (add-hook 'dired-mode-hook
;; 	(lambda
;; 		(define-key dired-mode-map "\C-xm" 'dired-w3m-find-file)))
;; (defun dired-w3m-find-file ()
;; 	(interactive)
;; 	(rquire 'w3m)
;; 	(let ((file (dired-get-filename)))
;; 		(if (y-or-n-p (format "Open 'w3m' %s " (file-name-nondirectory file)))
;; 			(w3m-find-file file))))

;; (autoload 'w3m-weather "w3m-weather" "Display weather report." t)
;; (autoload 'w3m-antenna "w3m-antenna" "Report change of WEB site." t)
;; (autoload 'w3m-namazu "w3m-namazu" "Search files with Namazu." t)
