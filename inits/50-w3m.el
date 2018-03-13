(use-package w3m
  :ensure t
  :commands (w3m-find-file w3m-browse-url w3m-search)
  :disabled t
  :bind
  (("C-x m" . browse-url-at-point))
  :config
  (setq browse-url-browser-function 'w3m-browse-url)
  (setq w3m-default-display-inline-images t)
  (setq w3m-use-cookies t)
  (setq w3m-search-defalut-engin "google-ja")
)
