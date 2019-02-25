;;; 30-company --- company-mode
;;; Commentary:

;;; Code:
(use-package company
  :ensure t
  :bind
  (:map company-active-map
    ;; C-n, C-pで補完候補を次/前の候補を選択
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous)
    ;; C-sで絞り込む
    ("C-s" . company-filter-candidates)
    ;; TABで候補を設定
    ("C-i" . company-complete-selection))
  (:map company-search-map
    ;; C-n, C-pで補完候補を次/前の候補を選択
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous))
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-echo-delay 0)

  (use-package company-quickhelp
    :ensure t
    :init
    (company-quickhelp-mode)
    :config
    (setq company-quickhelp-delay nil))
  )

(provide '30-company)
;;; 30-company ends here
