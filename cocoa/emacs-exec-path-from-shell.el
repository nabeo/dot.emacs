;; Last update is ....
;; Time-stamp: "Sun Mar 03 21:38:32 JST 2013"
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(exec-path-from-shell-copy-env "PATH")
(exec-path-from-shell-copy-env "MANPATH")

;; for perlbrew

;; for rbenv
