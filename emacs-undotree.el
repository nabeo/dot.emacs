;; last update is ....
;; Time-stamp: "Fri Feb 12 14:18:04 JST 2010"

;; http://www.dr-qubit.org/emacs.php#undo-tree
;; http://www.emacswiki.org/emacs/UndoTree
(require 'undo-tree)
(global-undo-tree-mode)

;; key-bind from undo-tree.el
;; C-_  C-/  (`undo-tree-undo')
;;   Undo changes.
;;
;; M-_  C-?  (`undo-tree-redo')
;;   Redo changes.
;;
;; `undo-tree-switch-branch'
;;   Switch undo-tree branch.
;;   (What does this mean? Better press the button and see!)
;;
;; C-x u  (`undo-tree-visualize')
;;   Visualize the undo tree.
;;   (Better try pressing this button too!)
;;
;; C-x r u  (`undo-tree-save-state-to-register')
;;   Save current buffer state to register.
;;
;; C-x r U  (`undo-tree-restore-state-from-register')
;;   Restore buffer state from register.
;;
;;
;; In the undo-tree visualizer:
;;
;; <up>  p  C-p  (`undo-tree-visualize-undo')
;;   Undo changes.
;;
;; <down>  n  C-n  (`undo-tree-visualize-undo')
;;   Undo changes.
;;
;; <left>  b  C-b  (`undo-tree-visualize-switch-branch-left')
;;   Switch to previous undo-tree branch.
;;
;; <right>  f  C-f  (`undo-tree-visualize-switch-branch-right')
;;   Switch to next undo-tree branch.
;;
;; t  (`undo-tree-visualizer-toggle-timestamps')
;;   Toggle display of time-stamps.
;;
;; q  C-q  (`undo-tree-visualizer-quit')
;;   Quit undo-tree-visualizer.
;;
;; ,  <
;;   Scroll left.
;;
;; .  >
;;   Scroll right.
;;
;; <pgup>
;;   Scroll up.
;;
;; <pgdown>
;;   Scroll down.
