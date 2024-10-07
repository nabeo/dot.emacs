;;; 50-fonts --- setup font
;;; Commentary:

;;; Code:

(defun nabeo/set-my-font ()
  "set my font"
  (interactive)
  (progn
    (let* ((my/fontfamilies
            '(;; HackGen
              ;; https://github.com/yuru7/HackGen
              "HackGen Console NF"
              ;; Moralerspace
              ;; https://github.com/yuru7/moralerspace
              "Moralerspace Neon HWNF"
              "Moralerspace Argon HWNF"
              "Moralerspace Xenon HWNF"
              "Moralerspace Krypton HWNF"
              ;; Cica
              ;; https://github.com/miiton/Cica
              "Cica"
              ;; M PLUS 1 Code
              ;; https://mplusfonts.github.io/
              "M PLUS 1 Code Medium"
              ;; UDEV Gothic
              ;; https://github.com/yuru7/udev-gothic
              "UDEV Gothic NF"
              ))
           (my/fontfamily (elt my/fontfamilies (abs (% (random t) (length my/fontfamilies))))))
      (if (find-font (font-spec :name my/fontfamily))
          (set-face-attribute 'default nil :family my/fontfamily :height 140)
        (progn
          (message "font not found: `%s'" my/fontfamily)
          (create-fontset-from-ascii-font "Monaco" nil "fallback")
          (set-fontset-font "fontset-fallback" 'unicode "Hiragino Kaku Gothic ProN" nil 'append)
          (add-to-list 'default-frame-alist '(font . "fontset-fallback")))))))

(nabeo/set-my-font)
(setq-default line-spacing 0)

;; カーソル位置のフォントを判別する
;; https://qiita.com/j8takagi/items/01aecdd28f87cdd3cd2c
(defun xlfd-at (pos)
  "Return X logical font description (XLFD) of the font at POS in the current buffer."
  (if (not (display-graphic-p))
      (message "Display is not graphic. So font is not used.")
    (font-xlfd-name (font-at pos))))

(defun xlfd-cursor-position (pos)
  "Return X logical font description (XLFD) of the font at the point."
  (interactive "d")
  (message (xlfd-at pos)))

(provide '50-fonts)
;;; 50-fonts.el ends here
