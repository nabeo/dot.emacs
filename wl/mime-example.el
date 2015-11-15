;;; mime-example.el

;; This file is generated automatically by SEMI MIME-View 1.14.6 (Maruoka)

;;; Code:

(setq mime-preview-situation-example-list
      '((((*body . invisible)
          (body-presentation-method . wl-mime-display-text/plain)
          (body . visible)
          (encoding . "7bit")
          ("charset" . "iso-2022-jp")
          (subtype . plain)
          (type . text)
          (entity-button . invisible)
          (header . visible)
          (major-mode . wl-original-message-mode))
         . 1)))
(setq mime-acting-situation-example-list
      '((((method . mime-save-content)
          (major-mode . wl-original-message-mode)
          (disposition-type . attachment))
         . 2)
        (((type . application)
          (subtype . octet-stream)
          (mode . "play")
          (method . mime-save-content)
          (major-mode . wl-original-message-mode)
          (disposition-type . attachment)
          (encoding . "base64"))
         . 256)
        (((type . application)
          (subtype . octet-stream)
          (mode . "play")
          (method . mime-save-content)
          (major-mode . wl-original-message-mode)
          (disposition-type . attachment)
          (encoding . "base64")
          (filename . "20Ann_Script0515.pdf")
          ("name" . "20Ann_Script0515.pdf"))
         . 0)
        (nil . 2)))

;;; mime-example.el ends here.
