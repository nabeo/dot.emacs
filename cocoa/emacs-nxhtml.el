;; Last update is ....
;; Time-stamp: "Sat Feb 11 10:29:22 JST 2012"

;; 素直にautostart.elを読み込むだけ
;; (cond ((string-match "23.1.92.1" (emacs-version))
;;        (load "~/Applications/CocoaEmacs-23.1.92.app/Contents/Resources/site-lisp/nxhtml/autostart.el"))
;;       ((string-match "23.1.1" (emacs-version))
;;        (load "~/Applications/CocoaEmacs-23.1.app/Contents/Resources/site-lisp/nxhtml/autostart.el")))
(cond (emacs23.2-p
       (load "~/Applications/Emacs-23.2.app/Contents/Resources/site-lisp/nxhtml/autostart.el"))
      (emacs23.3-p
       (load "~/Applications/Emacs-23.3.app/Contents/Resources/site-lisp/nxhtml/autostart.el"))
      (emacs-bzr-p
       (load "~/local/emacs/site-lisp/nxhtml/autostart.el")))

;; How-to use
;; C-c s <RET> schemaname.rnc : schemaをロードする
;; schemea は Resources/etc/schema と Resources/site-lisp/nxhtml/etc/schema にある
;; C-<RET> : タグを記述
;; C-c i : 終了タグを挿入
;; C-c f : タグを閉じる

;; nxhtml-1.97 work well
;; nxhtml-1.98 work, but indent is worng?
;; nxhtml-1.99 work, but indent is worng?
;; nxhtml-2.00 is not work well. lisp error!
;; nxhtml-2.01 is not work well. lisp error!
;; nxhtml-2.05 work well? 
;; nxhtml-2.08 work well. <- i'm using now.

;; php-mode
(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist '("\\.php[s34]?\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;; php-imenu
;; Load the php-imenu index function
(autoload 'php-imenu-create-index "php-imenu" nil t)
;; Add the index creation function to the php-mode-hook
(add-hook 'php-mode-user-hook 'php-imenu-setup)
(defun php-imenu-setup ()
  (setq imenu-create-index-function (function php-imenu-create-index))
  ;; uncomment if you prefer speedbar:
  ;(setq php-imenu-alist-postprocessor (function reverse))
  (imenu-add-menubar-index))

;; Flex SDK
;; Multiple modes for mxml and Actionscript in Emacs
;; http://transfinite.wordpress.com/2009/04/24/multiple-modes-for-mxml-and-actionscript-in-emacs/
(autoload 'actionscript-mode "actionscript-mode" "Major mode for editing actionscript3." t)
(add-to-list 'auto-mode-alist '("\\.as?\\'" . actionscript-mode))

;; nxml-mode with as3-mode for Flex Development
(defun mumamo-chunk-mxml-script (pos min max)
  "Find `<![CDATA[', return range and as3-mode."
  (mumamo-quick-static-chunk pos min max "<![CDATA[" "]]>" nil 'actionscript-mode nil))

(define-mumamo-multi-major-mode mxml-actionscript-mumamo-mode
  "Turn on multiple major modes for MXML files with main mode `nxml-mode'.
This covers inlined Actionscript."
  ("MXML Actionscript Family" nxml-mode (mumamo-chunk-mxml-script)))

(add-to-list 'auto-mode-alist '("\\.mxml$" . mxml-actionscript-mumamo))

;; custom face
(custom-set-faces
 ;; background の色がひどい
 '(mumamo-backward-chunk-major ((((class color) (min-colors 8)) (:background "*"))))
 '(mumamo-backward-chunk-submode1 ((((class color) (min-colors 8)) (:background "*"))))
 '(mumamo-backward-chunk-submode2 ((((class color) (min-colors 8)) (:background "*"))))
 '(mumamo-backward-chunk-submode3 ((((class color) (min-colors 8)) (:background "*"))))
 '(mumamo-backward-chunk-submode4 ((((class color) (min-colors 8)) (:background "*")))))

 
;; nxhtml モードの場合は cua-mode を切っておく
;; C-<RET>がタグの候補表示にバッティングするため
;; (add-hook 'nxhtml-mode-hook
;;           (lambda()
;;             (cua-mode nil)))
