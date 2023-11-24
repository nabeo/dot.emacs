;;; 50-tab-bar --- tab-bar-mode
;;; Commentary:

;;; Code:
(use-package tab-bar
  :init
  (setq tab-bar-show nil)
  (setq tab-bar-new-tab-choice "*scratch*")
  (setq tab-bar-tab-name-function #'tab-bar-tab-name-all)
  :bind-keymap ("C-z" . tab-prefix-map)
  :bind
  (:map tab-prefix-map
    ("c" . tab-new)
    ("C-c" . tab-new)
    ("SPC" . tab-bar-select-tab-by-name)
    ("n" . tab-bar-switch-to-next-tab)
    ("C-n" . tab-bar-switch-to-next-tab)
    ("p" . tab-bar-switch-to-prev-tab)
    ("C-p" . tab-bar-switch-to-prev-tab)
    ("k" . tab-bar-close-tab-by-name)
    ("C-k" . tab-bar-close-tab-by-name)
    ("a" . tab-bar-switch-to-last-tab)
    ("C-a" . tab-bar-switch-to-last-tab)
    )
  :config
  (tab-bar-mode)
  )

(provide '50-tab-bar)
;;; 50-tab-bar.el ends here
