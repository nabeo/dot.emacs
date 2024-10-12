;;; 99-funcs --- My Functions
;;; Commentary:

;;; Code:
(defun nabeo/randomly-select-theme ()
  "randomly select doom-theme and font"
  (interactive)
  (nabeo/randomly-select-doom-theme)
  (nabeo/set-my-font)
  )

(provide '99-funcs)
;;; 99-funcs.el ends here
