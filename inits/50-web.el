;;; 50-web --- web-mode
;;; Commentary:

;;; Code:
;; http://web-mode.org/
(use-package "web-mode"
  :ensure t
  :hook
  (web-mode . lsp)
  :mode
  ("\\.html?\\'" . web-mode)
  ("\\.phtml\\'" . web-mode)
  ("\\.tmpl\\.php\\'" . web-mode)
  ("\\.jsp\\'" . web-mode)
  ("\\.as[cp]x\\'" . web-mode)
  ("\\.erb\\'" . web-mode)
  ("\\.mustache\\'" . web-mode)
  ("\\.djhtml\\'" . web-mode)
  ("\\.ts[x]?\\'" . web-mode)
)

(provide '50-web)
;;; 50-web.el ends here
