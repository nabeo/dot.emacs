;; last update is ....
;; Time-stamp: "Tue Jun 03 12:59:41 JST 2008"

;;; emacs-mmm.el --- setting for mmm-mode

(require 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 0)
(set-face-background 'mmm-default-submode-face "gray")
(mmm-add-find-file-hook)

;; html + php
(mmm-add-classes
 '((html-php
	:submode php-mode
	:front "<\\?\\(php\\)?"
	:back "\\?>")))
(mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
(add-to-list 'auto-mode-alist '("\\.php?\\'" . xml-mode))

;; cakephp template mode
;(mmm-add-mode-ext-class nil "\\.thtml\\'" 'html-php)
;(mmm-add-classes
; '((html-php
;	:submode php-mode
;	:front "<\\?\\(php\\)?"
;	:back "\\?>")))
;(add-to-list 'auto-mode-alist '("\\.thtml?\\'" . sgml-mode))

;; html + javascript
;(mmm-add-mode-ext-class nil "\\.html?\\'" 'html-javascript)
;(mmm-add-classes
; '(
;   (js-script-cdata
;	:submode javascript
;	:face mmm-code-submode-face
;	:delimiter-mode nil
;	:front "<script[^>]*>[ \t\n]*<!\\[CDATA\\[[ \t]*\n?"
;	:back "[ \t]*]]>[ \t\n]*</script>")
;   (js-script
;	:submode javascript
;	:face mmm-code-submode-face
;	:delimiter-mode nil
;	:front "<script\[^>\]*\\(language=\"javascript\\([0-9.]*\\)\"\\|type=\"text/javascript\"\\)\[^>\]*>[ \t]*\n?"
;	:back "[ \t]*</script>"
;	:insert ((?j js-script nil @ "<script type=\"text/javascript\">"
;                 @ "\n" _ "\n" @ "</script>" @)))
;   (js-inline
;	:submode javascript
;	:face mmm-code-submode-face
;	:delimiter-mode nil
;	:front "on\\w+=\""
;	:back "\"")
;   (css-style-cdata
;	:submode css
;	:face mmm-code-submode-face
;	:delimiter-mode nil
;	:front "<style[^>]*>[ \t\n]*<!\\[CDATA\\[[ \t]*\n"
;	:back "[ \t]*]]>[ \t\n]*</style>")
;   (css-style
;	:submode css
;	:face mmm-code-submode-face
;	:delimiter-mode nil
;	:front "<style[^>]*[ \t]*\n?"
;	:back "[ \t]*</style>"
;	:insert ((?c css-style nil @ "<style type=\"text/css\">"
;				 @ "\n" _ "\n" @ "</style>" @)))
;   (css-inline
;	:submode css
;	:face mmm-code-submode-face
;	:delimter-mode nil
;	:front "style=\""
;	:back "\"")
;   (mxml-as3
;	:submode actionscript
;	:face mmm-mode-submode-face
;	:delimiter-mode nil
;	:front "<mx:Script>"
;	:back "</mx:Script>")
;   (php
;	:submode php
;	:face mmm-mode-submode-face
;	:delimiter-mode nil
;	:front "[ \t]*<?php"
;	:back "[ \t]*?>")
;   ))
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . xml-mode))

;; mxml + actionscript
;(mmm-add-mode-ext-class nil "\\.mxml?\\'" 'mxml-as3)
;(mmm-add-classes
; '((mxml-as3
;	:submode actionscript-mode
;	:front "<mx:Script>"
;	:back "</mx:Script>")))
;(add-to-list 'auto-mode-alist '("\\.mxml?\\'" . sgml-mode))
