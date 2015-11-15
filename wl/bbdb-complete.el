;; Last update is ....
;; Time-stamp: "Sat Feb 05 00:37:13 JST 2011"

;; auto-completeとbbdbでメールのアドレス補完する
;; http://d.hatena.ne.jp/buzztaiki/20091110/1257863059
(defun wl-draft-turn-on-ac ()
  (setq ac-sources '(ac-source-bbdb))
  (auto-complete-mode 1))

(add-hook 'wl-draft-mode-hook 'wl-draft-turn-on-ac)

(defvar ac-bbdb-header-list '("to" "from" "cc" "bcc"))

(defun ac-bbdb-candidate ()
  (delete-dups
   (apply
    'append
    (mapcar (lambda (rec)
              (mapcar (lambda (n) (bbdb-dwim-net-address rec n))
                      (bbdb-record-net rec)))
            (bbdb-records)))))

(defun ac-bbdb-prefix ()
  (interactive)
  (let ((case-fold-search t))
    (when (and
           (< (point)
              (save-excursion
                (goto-char (point-min))
                (search-forward (concat "\n" mail-header-separator "\n") nil t)
                (point)))
           (save-excursion
             (beginning-of-line)
             (while (and (looking-at "^[ \t]")
                         (not (= (point) (point-min))))
               (forward-line -1))
             (looking-at (concat (regexp-opt ac-bbdb-header-list t) ":"))))
      (ac-prefix-symbol))))

(defvar ac-source-bbdb
  '((candidates . ac-bbdb-candidate)
    (match . substring)
    (prefix . ac-bbdb-prefix)))