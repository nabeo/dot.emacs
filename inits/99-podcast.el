;;; 99-podcast
;;; Commentary

;;; Code
(use-package podcaster
  :ensure t
  :config
  (setq podcaster-mp3-player (executable-find "ffplay"))
  ;; load podcaster-feeds-urls
  (load-safe (expand-file-name
              (concat user-emacs-directory "data/podcast-urls.el")))
  )

(provide '99-podcast)
;;; 99-podcast.el ends here
