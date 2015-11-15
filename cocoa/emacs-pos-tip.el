;; Time-stamp: "Sun Feb 20 14:47:14 JST 2011"

;; pos-tip.elとpopup-pos-tip.elを使う
;; (auto-install-from-emacswiki "pos-tip.el")
;; (auto-install-from-emacswiki "popup-pos-tip.el")
;; http://www.emacswiki.org/emacs-en/PosTip#toc8
(require 'pos-tip)
(defun my-describe-function (function)
  "Display the full documentation of FUNCTION (a symbol) in tooltip."
  (interactive (list (function-called-at-point)))
  (if (null function)
      (pos-tip-show
       "** You didn't specify a function! **" '("red"))
    (pos-tip-show
     (with-temp-buffer
       (let ((standard-output (current-buffer))
             (help-xref-following t))
         (prin1 function)
         (princ " is ")
         (describe-function-1 function)
         (buffer-string)))
     nil nil nil 0)))
(define-key emacs-lisp-mode-map (kbd "C-;") 'my-describe-function)

(require 'popup-pos-tip)
(defadvice popup-tip
  (around popup-pos-tip-wrapper (string &rest args) activate)
  (if (eq window-system 'x)
      (apply 'popup-pos-tip string args)
    ad-do-it))
