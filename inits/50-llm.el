;;; 50-llm --- local LLM for Emacs
;;; Commentary:

;;; Code:
(use-package ellama
  :ensure t
  :if (executable-find "ollama")
  :bind ("C-c e" . ellama-transient-main-menu)
  :init
  (require 'llm)
  ;; setup key bindings
  ;; (setopt ellama-keymap-prefix "C-c e")
  ;; language you want ellama to translate to
  (setopt ellama-language "Japanese")
  ;; could be llm-openai for example
  (require 'llm-ollama)
  (require 'llm-gemini)
  ;; https://ollama.com/library
  ;; デフォルトのプロバイダー
  (setopt ellama-provider
	    (make-llm-ollama
	      :chat-model "gemma4:26b-mlx"
	      :embedding-model "embeddinggemma:300m-bf16"
        :default-chat-non-standard-params '(("num_ctx" . 32768))))
  (setopt ellama-summarization-provider
	    (make-llm-ollama
	     :chat-model "gemma4:e4b-it-qat"
	     :embedding-model "nomic-embed-text"
	     :default-chat-non-standard-params '(("num_ctx" . 32768))))
  ;; 翻訳用プロバイダー
  (setopt ellama-translation-provider
	  (make-llm-ollama
	   :chat-model "gemma4:e4b-it-qat"
	   :embedding-model "embeddinggemma:300m-bf16"))

  ;; ellama-provider-select で選択できる
  (setopt ellama-providers
	  '(
       ;; https://ollama.com/library/gemma4
       ("gemma4:26b-mlx"
         (make-llm-ollama
           :chat-model "gemma4:26b-mlx"
           :embedding-model "embeddinggemma:300m-bf16"))
       ("gemma4:e4b-it-qat"
         (make-llm-ollama
           :chat-model "gemma4:e4b-it-qat"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/gpt-oss-safeguard
       ("gpt-oss-safeguard:20b" .
         (make-llm-ollama
           :chat-model "gpt-oss-safeguard:20b"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/gpt-oss/tags
       ("gpt-oss:20b" .
         (make-llm-ollama
           :chat-model "gpt-oss:20b"
           :embedding-model "embeddinggemma:300m-bf16"))
       ))

  ;; Naming new sessions with llm
  (setopt ellama-naming-provider
	    (make-llm-ollama
	     :chat-model "gemma4:e2b-it-qat"
	     :embedding-model "nomic-embed-text"
	     :default-chat-non-standard-params '(("stop" . ("\n")))))
  (setopt ellama-naming-scheme 'ellama-generate-name-by-llm)

  ;; templates
  (setq ellama-define-word-prompt-template "%s の定義を教えて")
  (setq ellama-summarize-prompt-template "Text:\n%s\n要約して")
  (setq ellama-generate-commit-message-template "あなたは熟練プログラマーです。後の変更点をもとに簡潔なコミットメッセージを書いてください。コミットメッセージの形式は、1行目は変更点の要約、2行目は空行、それ以降の行は変更全体の詳細な説明、です。出力はプロンプト無しで最終的なコミットメッセージだけにしてください。\n\n変更点:\n%s\n")
  (setq ellama-code-review-prompt-template "以下のコードのレビューと改善案を日本語で教えてください:\n```\n%s\n```")
  )

(use-package gptel
  :ensure t
  :if (executable-find "ollama")
  :config
  ;; MCP integration
  (require 'gptel-integrations)

  ;; default model
  (setq gptel-backend (gptel-make-ollama "ollama"
                        :host "localhost:11434"
                        :models '(
                                   ;; https://ollama.com/library/gemma4
                                   gemma4:26b-mlx
                                   ;; https://ollama.com/library/gpt-oss/tags
                                   gpt-oss:20b
                                   ;; https://ollama.com/library/gpt-oss-safeguard
                                   gpt-oss-safeguard:20b
                                   )
                        :request-params '(:options (:num_ctx 131072))
                        :stream t
                        ))

  (setq gptel-use-curl t)
  (setq gptel-use-tools t)
  (setq gptel-confirm-tool-calls 'always)
  (setq gptel-include-tool-results 'auto)
  (setq gptel--system-message (concat gptel--system-message " Make sure to Japanese langugage."))
  )

(use-package gptel-magit
  :ensure t
  :after (gptel magit)
  :hook (magit-mode . gptel-magit-install)
  )

(use-package mcp
  :ensure t
  :if (executable-find "ollama")
  :hook (after-init . mcp-hub-start-all-server)
  :custom
  (mcp-hub-servers
    `(
       ;; https://github.com/hashicorp/terraform-mcp-server
       ("terraform" .
         (:command "terraform-mcp-server" :args ("stdio")))

       ;; https://github.com/awslabs/mcp/tree/main/src/aws-documentation-mcp-server
       ("aws_documentation" .
         ( :command "awslabs.aws-documentation-mcp-server"
           :env ( :FASTMCP_LOG_LEVEL "ERROR"
                  :AWS_DOCUMENTATUION_PARTITION "aws")))

       ;; https://github.com/github/github-mcp-server/
       ;; ("github" . (:url "https://api.githubcopilot.com/mcp/"))
       ))
  :hook
  (after-init . mcp-hub-start-all-server)
  :config
  (require 'mcp-hub)
  )

;; 以下の外部コマンドを手動で導入しておくこと
;; (:ensure-system-package は system-packages が未導入だと黙って無視されるのでつかわない)
;;   claude           : npm install -g @anthropic-ai/claude-code
;;   claude-agent-acp : npm install -g @agentclientprotocol/claude-agent-acp
;;                      agent-shell と Claude Code をつなぐ ACP ブリッジで
;;                      agent-shell-anthropic-claude-acp-command の既定値
(use-package agent-shell
  :ensure t
  :if (executable-find "claude")
  :bind (:map agent-shell-mode-map
          ("<backtab>" . agent-shell-cycle-session-mode))
  :config
  ;; デフォルトでは claude-code を使用する
  (setq agent-shell-preferred-agent-config 'claude-code)
  ;; claude 本体のログインセッションをつかう
  (setq agent-shell-anthropic-authentication
    (agent-shell-anthropic-make-authentication :login t))

  ;; パーミッション要求時に通知音を鳴らす
  ;; claude-agent-acp は ~/.claude/settings.json のフックを読むので Stop などは発火するが、
  ;; 権限確認は ACP 側で処理されるため Notification/permission_prompt は発火しない。その穴埋め。
  ;; ターン完了の通知は settings.json の Stop に任せる (ここで鳴らすと二重になる)
  (setq agent-shell-permission-responder-function
    (lambda (_permission)
      (start-process "agent-shell-notify" nil
        (expand-file-name "~/.local/bin/claude-cli-hook.sh"))
      nil))
  )

(use-package agent-shell-workspace
  :ensure t
  :vc (:url "https://github.com/gveres/agent-shell-workspace")
  :init
  ;; サイドバーの各行にはバッファ名の " @ " より後ろ（プロジェクト名）が出る。
  ;; 既定の 24 桁だと長いリポジトリ名が切れるので少し広げる
  (setq agent-shell-workspace-sidebar-width 32)
  :bind (:map tab-prefix-map
          ;; C-z C-z で編集タブと Agents タブを行き来する
          ("C-z" . agent-shell-workspace-toggle)))

(use-package agent-shell-attention
  :ensure t
  :vc (:url "https://github.com/ultronozm/agent-shell-attention.el")
  :after agent-shell
  :demand t
  :bind (:map tab-prefix-map
          ;; 入力待ちのシェルにジャンプする
          ("j" . agent-shell-attention-jump))
  :config
  (agent-shell-attention-mode 1)
  )

(use-package agent-recall
  :ensure t
  :hook (agent-shell-mode . agent-recall-track-sessions)
  :bind (:prefix-map nabeo/agent-recall-map
          :prefix "C-c a"
          ("s" . agent-recall-consult-search)  ; 全文検索（トランスクリプトごとにまとめて表示）
          ("b" . agent-recall-browse)          ; プロジェクト×日時で一覧してプレビュー
          ("r" . agent-recall-resume)          ; 過去のセッションを再開
          ("i" . agent-recall-reindex))        ; 索引を作り直す
  :custom
  (agent-recall-search-paths '("~/src"))
  (agent-recall-index-file
    (expand-file-name "data/agent-recall-index.eld" user-emacs-directory))
  (agent-recall-metadata-file
    (expand-file-name "data/agent-recall-metadata.el" user-emacs-directory))
  (agent-recall-search-function 'consult-ripgrep)
  (agent-recall-browse-sort 'modified-desc))

(provide '50-llm)
;;; 50-llm.el ends here
