;;; 50-ediff --- ediff
;;; Commentary:

;;; Code:
(use-package diff
  :commands (ediff-file)
  :config
  ;; 追加された行は緑
  (set-face-attribute 'diff-added nil
    :foreground "white" :background "dark green")
  ;; ;; 削除された行は赤
  (set-face-attribute 'diff-removed nil
    :foreground "white" :background "dark red")
  ;; 文字単位での変更箇所は色を反転して強調
  ;; (set-face-attribute 'diff-refine-change nil
  ;;   :foreground nil :background nil
  ;;   :weight 'bold :inverse-video t)
  ;; diffを表示したらすぐに文字単位での強調表示も行う
  (defun diff-mode-refine-automatically ()
    (diff-auto-refine-mode t))
  )

(use-package smerge-mode
  :hook (diff-mode . diff-mode-refine-automatically))

(provide '50-ediff)
;;; 50-ediff ends here
