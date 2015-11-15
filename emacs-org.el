;; last update is ....
;; Time-stamp: "Mon Jan 05 15:38:19 JST 2009"

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; TODOやスケジュールのある項目を検索するファイル
(setq org-agenda-files (list "/Users/nabeo/Documents/graminc/todo/todo-2009.org"
                             "/Users/nabeo/Documents/graminc/todo/schedule.org"))

;; TODOリストの書式
;; 第1階層 : 大分類
;; 第2階層 : プロジェクト
;; 第3階層 : 次にやるべきこと(NextAction)

;; TODOのタスクの種類として「待ち:Wait」を追加する
;; C-c C-tでTODO Wait Doneと切り替わる
(setq org-todo-keywords '("TODO" "Wait" "Done")
      org-todo-interpretation 'sequence)

;; Stuck Project
;;; 各プロジェクトでNextActionが設定されていないものを抽出 (C-c a #)
;;; Someday, Material, Schedule以外のタグでTODO, Waitのタスクが
;;; その下に存在しない、第2階層のタスクを抽出
(setq org-stuck-projects '("+LEVEL=2" 
                           ("TODO" "Wait") 
                           ("Someday" "Material" "Schedule")))