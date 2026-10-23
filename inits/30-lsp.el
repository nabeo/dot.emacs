;;; 30-lsp --- lsp-mode  -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(use-package lsp-mode
  :ensure t
  :custom
  ;; (create-lockfiles nil)
  (lsp-auto-guess-root t)
  ;; brew install python-lsp-server
  (lsp-pyls-server-command (expand-file-name (concat my/homebrew-prefix "/bin/pylsp")))
  ;; brew install llvm
  (lsp-clients-clangd-executableb (expand-file-name (concat my/homebrew-prefix "/opt/llvm/bin/clangd")))
  ;; https://github.com/emacs-lsp/lsp-mode/issues/3713
  (create-lockfiles nil)
  ;; semantic tokens
  (lsp-semantic-tokens-enable t)
  (lsp-semantic-tokens-honor-refresh-requests t)
  ;; Link to documentation
  (lsp-enable-links t)
  ;; completion provider
  (lsp-completion-provider :capf)
  ;; auto format on save by lsp
  (lsp-format-buffer-on-save t)
  (lsp-format-buffer-on-save-list '("kotlin-mode" "kotlin-ts-mode"))

  ;; hover のドキュメントは lsp-ui-doc の child frame だけに表示する
  ;; lsp-eldoc-function が minibuffer (echo area) に出す分を止める
  ;; lsp-ui-doc は eldoc を経由せず自前で textDocument/hover を投げるので child frame の表示には影響しない
  (lsp-eldoc-enable-hover nil)
  ;; lsp-eldoc-render-all は lsp-eldoc-function 専用なので上記により無効
  ;; (lsp-eldoc-render-all t)
  :init
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ; 1mb
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (prog-major-mode . lsp-prog-major-mode-enable)
  ;; brew install gopls
  (go-mode . lsp)
  ;; pip install 'python-language-server[all]'
  (python-mode . lsp)
  ;; https://emacs-lsp.github.io/lsp-mode/page/lsp-typescript/#installation
  (typescript-mode . lsp)
  (javascript-mode . lsp)
  ;; gem install ruby-lsp
  (ruby-mode . lsp)
  (ruby-ts-mode . lsp)
  ;; rustup component add rls rust-analysis rust-src
  (rust-mode . lsp)
  ;; for C/C++
  (c++-mode . lsp)
  (c-mode . lsp)
  ;; for Json
  ;; npm -g --prefix ~/.emacs.d/.cache/lsp/npm/vscode-langservers-extracted install vscode-langservers-extracted
  (json-mode . lsp)
  ;; for Terraform
  ;; brew install terraform-ls
  ;; https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#emacs
  (terraform-mode . lsp)
  ;; for yaml
  (yaml-mode . lsp)
  ;; for kotlin
  (kotlin-mode . lsp)
  (kotlin-ts-mode . lsp)
  ;; for lua (lua-language-server)
  (lua-mode . lsp)
  (lua-ts-mode . lsp)
  ;; use with which-key
  (lsp-mode . lsp-enable-which-key-integration)
  :bind
  (:map lsp-mode-map
    ("C-c r" . lsp-rename))
  :commands (lsp lsp-deferred)
  :config
  ;; lsp-copilot
  (setq lsp-copilot-enabled nil)

  ;; lsp-terraform-ls
  ;; https://emacs-lsp.github.io/lsp-mode/page/lsp-terraform-ls/#server-note
  ;; disable terraform-lsp
  (add-to-list 'lsp-disabled-clients 'tfls)
  (setq lsp-terraform-ls-enable-show-reference t)
  (setq lsp-terraform-ls-prefill-required-fields t)

  ;; kotlin-lsp
  ;; https://github.com/Kotlin/kotlin-lsp/blob/main/scripts/lsp-kotlin-emacs-lsp-mode.el
  (setq kotlin-lsp-bin (concat my/homebrew-prefix "/bin/kotlin-lsp"))
  (defun kotlin-lsp-server-fun ()
    (list kotlin-lsp-bin "--stdio"))
  ;; kotlin-language-server は使わない
  (add-to-list 'lsp-disabled-clients 'kotlin-ls)
  (cond ((file-executable-p kotlin-lsp-bin)
          ;; inlay hint 系の設定
          ;; 設定可能なオプションは kotlin-vscode/package.json を見る
          (lsp-register-custom-settings
            `(("jetbrains.kotlin"
                ,(lsp-ht
                   ("hints.settings.types.property" t)
                   ("hints.settings.types.variable" t)
                   ("hints.type.function.return" t)
                   ("hints.type.function.parameter" t)
                   ("hints.settings.lambda.return" t)
                   ("hints.lambda.receivers.parameters" t)
                   ("hints.settings.value.ranges" t)
                   ("hints.value.kotlin.time" t)
                   ("hints.parameters" t)
                   ("hints.parameters.compiled" t)))))
          ;; lsp-clients に kotlin-lsp を追加
          (lsp-register-client
            (make-lsp-client
              :new-connection (lsp-stdio-connection #'kotlin-lsp-server-fun)
              :activation-fn (lsp-activate-on "kotlin")
              :priority 1
              :server-id 'kotlin-lsp
              ))))

  ;; textDocument/inlayHint
  (setq lsp-inlay-hint-enable t)
  )
(use-package lsp-ui
  :ensure t
  ;; :commands lsp-ui-mode
  ;; :after lsp-mode
  :custom
  ;; (scroll-margin 0)
  ;; lsp-ui-doc
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  ;; (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  ;; (lsp-ui-doc-max-width 150)
  ;; (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  ;; webkit (xwidget) 経路は使わない
  ;; lsp-ui-doc--make-frame が make-xwidget した xwidget に 'callback を
  ;; 設定せず current-global-map に [xwidget-event] を bind しているが、
  ;; special-event-map の xwidget-event-handler が先に処理して javascript-callback を捨ててしまう。
  ;; その結果 lsp-ui-doc--webkit-resize-callback が呼ばれず、child frame が
  ;; 9x16px のまま可視化されない
  (lsp-ui-doc-use-webkit nil)
  (lsp-ui-doc-alignment 'window) ;; window or frame
  (lsp-ui-doc-show-with-cursor t)
  ;; (lsp-ui-doc-show-with-mouse nil)
  ;; (lsp-ui-doc-delay 0.5)
  ;; lsp-ui-flycheck
  ;; (lsp-ui-flycheck-enable nil)
  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
  ;; (lsp-ui-sideline-ignore-duplicate t)
  ;; (lsp-ui-sideline-show-symbol t)
  ;; (lsp-ui-sideline-show-hover t)
  ;; (lsp-ui-sideline-show-diagnostics nil)
  ;; (lsp-ui-sideline-show-code-actions nil)
  ;; lsp-ui-imenu
  ;; (lsp-ui-imenu-enable nil)
  ;; (lsp-ui-imenu-kind-position 'top)
  ;; lsp-ui-peek
  ;; (lsp-ui-peek-enable t)
  ;; (lsp-ui-peek-peek-height 20)
  ;; (lsp-ui-peek-list-width 50)
  ;; (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
  :hook
  (lsp-mode . lsp-ui-mode)
  :bind
  (:map lsp-mode-map
    ("C-c C-r" . lsp-ui-peek-find-references)
    ("C-c C-j" . lsp-ui-peek-find-definitions)
    ("C-c i" . lsp-ui-peek-find-implementation)
    ("C-c m" . lsp-ui-imenu)
    ("C-c s" . lsp-ui-sideline-mode)
    ("C-c d" . lsp-ui-doc-show)
    ;; child frame にフォーカスを移す (戻るときは child frame 内で q)
    ("C-c D" . lsp-ui-doc-focus-frame)
    )
  (:map lsp-ui-mode-map
    ([remap xref-find-definitions] . #'lsp-ui-peek-find-definitions)
    ([remap xref-find-references] . #'lsp-ui-peek-find-references)
    )
  :config
  ;; default-frame-alist にある (alpha . (95 . 75)) が child frame にも継承される。
  ;; child frame はフォーカスを持たないので非アクティブ側の 75% が適用されて半透明になるため、doc の child frame だけ不透明にする
  (add-to-list 'lsp-ui-doc-frame-parameters '(alpha . 100))

  ;; child frame 内のコードブロックが判読不能になる問題への対処
  ;; lsp-mode は hover の markdown をコードブロックごと font-lock するので、
  ;; コード部分の face は (font-lock-*-face markdown-code-face) になる。
  ;; doom-themes は markdown-code-face に default とは別の明るい背景を
  ;; 割り当てるため、そこに font-lock-comment-face などが載って潰れる
  ;; (doom-challenger-deep でコントラスト比 1.03、
  ;;  doom-winter-is-coming-dark-blue で 1.36 = ほぼ同色)。
  ;; child frame ではコードブロックの追加背景を消して地色に揃える
  (defun nabeo/lsp-ui-doc-remap-code-faces (&rest _)
    "doc の child frame でコードブロックの追加背景を消す。"
    (lsp-ui-doc--with-buffer
      (setq-local face-remapping-alist
                  (append face-remapping-alist
                          '((markdown-code-face lsp-ui-doc-background)
                            (markdown-inline-code-face lsp-ui-doc-background))))))
  (advice-add 'lsp-ui-doc--render-buffer :after #'nabeo/lsp-ui-doc-remap-code-faces)

  ;; 地色そのものもテーマ任せにせず default を一律で少し暗くしたものにする。
  ;; doom-winter-is-coming-dark-blue の lsp-ui-doc-background (#062e5a) は
  ;; default (#011627) より明るく、コメント色が沈んでしまうため
  (defun nabeo/lsp-ui-doc-adjust-background (&rest _)
    "`lsp-ui-doc-background' を default 背景より少し暗い色に揃える。"
    (when (fboundp 'doom-darken)
      (set-face-background 'lsp-ui-doc-background
                           (doom-darken (face-attribute 'default :background nil t) 0.15))))
  (nabeo/lsp-ui-doc-adjust-background)
  ;; テーマ切り替え時にも追従させる
  (add-hook 'enable-theme-functions #'nabeo/lsp-ui-doc-adjust-background)
  )

(use-package lsp-treemacs
  :ensure t
  :after lsp-mode
  :config
  (lsp-treemacs-sync-mode 1)
  )

(use-package consult-lsp
  :ensure t
  :after (consult)
  :bind
  (:map lsp-mode-map
    ([remap xref-find-apropos] . #'consult-lsp-symbols))
  )

;; https://github.com/emacs-lsp/dap-mode
(use-package dap-mode
  :ensure t
  :after (lsp-treemacs)
  :config
  (dap-auto-configure-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (require 'dap-dlv-go)

  ;; dap-kotlin は fwcd/kotlin-debug-adapter 専用なので使わない
  (defun my/dap-kotlin-lsp-guess-main-class ()
    (when-let* ((file (buffer-file-name))
                 ((string-suffix-p ".kt" file)))
      (let ((package (save-excursion
                       (goto-char (point-min))
                       (when (re-search-forward "^[ \t]*package[ \t]+\\([[:alnum:]_.]+\\)" nil t)
                         (match-string-no-properties 1))))
             (class (concat (capitalize (substring (file-name-base file) 0 1))
                      (substring (file-name-base file) 1)
                      "Kt")))
        (if package (concat package "." class) class))))

  (defvar my/dap-kotlin-gradle-debug-timeout 120
    "Seconds to wait for the JDWP listening line of `gradle --debug-jvm'.")

  (defvar my/dap-kotlin-gradle-stop-timeout 30
    "Seconds to wait for the previous `gradle --debug-jvm' to exit.")

  (defvar my/dap-kotlin-gradle-process nil)

  (defun my/dap-kotlin-gradle-stop (proc)
    (when (process-live-p proc)
      (interrupt-process proc)))

  (defun my/dap-kotlin-gradle-stop-and-wait (proc)
    (when (process-live-p proc)
      (interrupt-process proc)
      (let ((deadline (+ (float-time) my/dap-kotlin-gradle-stop-timeout)))
        (while (and (process-live-p proc) (< (float-time) deadline))
          (accept-process-output proc 0.5)))
      (when (process-live-p proc)
        (kill-process proc)
        (let ((deadline (+ (float-time) 5)))
          (while (and (process-live-p proc) (< (float-time) deadline))
            (accept-process-output proc 0.5))))))

  ;; :cleanup-function を使わないのは、dap-mode が dap--refresh-breakpoints の後に呼ぶので、そこでエラーになると Gradle が残るため
  (defun my/dap-kotlin-gradle-stop-on-terminated (session)
    (when-let* ((id (plist-get (dap--debug-session-launch-args session) :gradleDebugId))
                 (proc my/dap-kotlin-gradle-process)
                 ((equal id (process-get proc 'my/dap-kotlin-gradle-debug-id))))
      (my/dap-kotlin-gradle-stop proc)))

  (add-hook 'dap-terminated-hook #'my/dap-kotlin-gradle-stop-on-terminated)

  (defun my/dap-kotlin-gradle-stop-on-start-failure (start launch-args)
    (if-let* ((id (plist-get launch-args :gradleDebugId)))
      (condition-case err
        (funcall start launch-args)
        ((error quit)
          (when-let* ((proc my/dap-kotlin-gradle-process)
                       ((equal id (process-get proc 'my/dap-kotlin-gradle-debug-id))))
            (my/dap-kotlin-gradle-stop-and-wait proc))
          (signal (car err) (cdr err))))
      (funcall start launch-args)))

  (advice-add 'dap-start-debugging-noexpand :around #'my/dap-kotlin-gradle-stop-on-start-failure)

  (defun my/dap-kotlin-gradle-find-port (buffer)
    (with-current-buffer buffer
      (save-excursion
        (goto-char (point-min))
        (when (re-search-forward "Listening for transport dt_socket at address: \\([0-9]+\\)\r?\n" nil t)
          (string-to-number (match-string 1))))))

  (defun my/dap-kotlin-gradle-start (conf root id)
    (unless (or (listp (plist-get conf :gradleArgs)) (vectorp (plist-get conf :gradleArgs)))
      (user-error ":gradleArgs must be a list or vector of strings, not %S" (plist-get conf :gradleArgs)))
    ;; 空いているポートを選ばずに前の Gradle を止めるのは、--debug-jvm の JDWP のポートが 5005 で固定で、前の JVM が残ると次の起動が bind に失敗するため
    (my/dap-kotlin-gradle-stop-and-wait my/dap-kotlin-gradle-process)
    (let* ((default-directory root)
            (gradlew (expand-file-name "gradlew" root))
            (buffer (let ((buffer (get-buffer-create "*kotlin-gradle-debug*")))
                      (if (get-buffer-process buffer)
                        (generate-new-buffer "*kotlin-gradle-debug*")
                        buffer)))
            (proc (progn
                    (with-current-buffer buffer
                      (erase-buffer)
                      (setq default-directory root))
                    (make-process :name "kotlin-gradle-debug"
                      :buffer buffer
                      :command (append (list (if (file-executable-p gradlew) gradlew "gradle")
                                         (or (plist-get conf :gradleTask) "run"))
                                 (plist-get conf :gradleArgs)
                                 (list "--debug-jvm"))
                      :connection-type 'pipe
                      :noquery t)))
            (_ (progn
                 (process-put proc 'my/dap-kotlin-gradle-debug-id id)
                 (setq my/dap-kotlin-gradle-process proc)))
            (deadline (+ (float-time) my/dap-kotlin-gradle-debug-timeout))
            port)
      (unwind-protect
        (progn
          (while (and (not (setq port (my/dap-kotlin-gradle-find-port buffer)))
                   (process-live-p proc)
                   (< (float-time) deadline))
            (accept-process-output proc 0.5))
          (unless port
            (display-buffer buffer)
            (user-error (if (process-live-p proc)
                          "Gradle did not print the JDWP port within %s seconds"
                          "Gradle exited before printing the JDWP port")
              my/dap-kotlin-gradle-debug-timeout)))
        (unless port
          (my/dap-kotlin-gradle-stop proc)))
      (cons proc port)))

  (defun my/dap-kotlin-lsp-check-attach (conf)
    (let* ((port (plist-get conf :port))
            (port (if (and (stringp port) (string-match-p "\\`[0-9]+\\'" port))
                    (string-to-number port)
                    port))
            (host (plist-get conf :host)))
      (unless (and (natnump port) (<= 1 port 65535))
        (user-error "Attach needs :port of the JDWP agent between 1 and 65535, not %S" (plist-get conf :port)))
      ;; JDWP の接続先のホストを渡さないのは、kotlin-lsp 263.7084.0 の AttachRequestArguments が port と restart しか受け取らないため
      (unless (member host '(nil "127.0.0.1" "localhost"))
        (user-error ":host is the address of the kotlin-lsp DAP server and kotlin-lsp cannot attach to a JDWP agent on %s" host))
      (plist-put (copy-sequence conf) :port port)))

  (defun my/dap-kotlin-lsp-provider (conf)
    (when (and (equal (plist-get conf :type) "intellij_jvm")
            (equal (plist-get conf :request) "attach"))
      (setq conf (my/dap-kotlin-lsp-check-attach conf)))
    (let* ((root (or (lsp-workspace-root) default-directory))
            (port (lsp-request "workspace/executeCommand"
                    (list :command "start_debug_server"
                      :arguments (vector (lsp--path-to-uri root))))))
      (cond
        ((and (equal (plist-get conf :type) "intellij_jvm")
           (equal (plist-get conf :request) "attach"))
          ;; mainClass の確認と intellij.java.resolveLaunch を使わないのは、起動済みの JVM に JDWP で接続するだけなので起動の設定が要らないため
          conf)
        ((equal (plist-get conf :type) "intellij_gradle")
          ;; buildToolTarget (intellij.java.resolveBuildToolLaunch) を使わないのは、起動するクラスを mainClass で毎回指定する必要があるため
          (pcase-let* ((id (format "%d-%s" (emacs-pid) (format-time-string "%s.%N")))
                        (`(,_gradle . ,jdwp-port) (my/dap-kotlin-gradle-start conf root id)))
            (setq conf (copy-sequence conf))
            (setq conf (plist-put conf :request "attach"))
            (setq conf (plist-put conf :port jdwp-port))
            (setq conf (plist-put conf :gradleDebugId id))))
        (t
          (unless (plist-get conf :mainClass)
            (setq conf (plist-put conf :mainClass
                         (read-string "mainClass: " (my/dap-kotlin-lsp-guess-main-class)))))
          (unless (plist-get conf :cwd)
            (setq conf (plist-put conf :cwd root)))
          ;; JAVA_HOME を先に使わないのは、VS Code 拡張と同じくモジュールの JDK とクラスパスをサーバーに決めさせるため
          (let ((resolved (lsp-request "workspace/executeCommand"
                            (list :command "intellij.java.resolveLaunch"
                              :arguments (vector (list :uri (lsp--buffer-uri)
                                                   :mainClass (plist-get conf :mainClass)))))))
            (pcase-dolist (`(,key . ,resolved-key) '((:javaExec . :javaExec)
                                                      (:classPaths . :classpath)
                                                      (:modulePaths . :modulePath)
                                                      (:moduleContentPaths . :moduleContentPaths)
                                                      (:moduleName . :moduleName)
                                                      (:vmArgs . :vmArgs)))
              (when-let* (((not (plist-get conf key)))
                           (value (lsp-get resolved resolved-key)))
                (setq conf (plist-put conf key value)))))
          (unless (plist-get conf :javaExec)
            (setq conf (plist-put conf :javaExec
                         (or (when-let* ((java-home (getenv "JAVA_HOME"))
                                          (java (expand-file-name "bin/java" java-home))
                                          ((file-executable-p java)))
                               java)
                           (executable-find "java")))))))
      (unless (plist-get conf :host)
        (setq conf (plist-put conf :host "127.0.0.1")))
      (plist-put conf :debugServer port)))

  (dap-register-debug-provider "intellij_jvm" #'my/dap-kotlin-lsp-provider)
  (dap-register-debug-provider "intellij_gradle" #'my/dap-kotlin-lsp-provider)
  (dap-register-debug-template "Kotlin Launch (mainClass)"
    (list :type "intellij_jvm"
      :request "launch"
      :name "Kotlin Launch (mainClass)"))
  (dap-register-debug-template "Kotlin Launch via Gradle (--debug-jvm)"
    (list :type "intellij_gradle"
      :request "launch"
      :name "Kotlin Launch via Gradle (--debug-jvm)"))
  (dap-register-debug-template "Kotlin Attach (5005)"
    (list :type "intellij_jvm"
      :request "attach"
      :name "Kotlin Attach (5005)"
      :port 5005))
  )

(provide '30-lsp)
;;; 30-lsp.el ends here
