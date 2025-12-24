;;; 50-llm --- local LLM for Emacs
;;; Commentary:

;;; Code:
(use-package ellama
  :ensure t
  ;; :if (executable-find "ollama")
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
	      :chat-model "gemma3n:e4b-it-q8_0"
	      :embedding-model "embeddinggemma:300m-bf16"
        :default-chat-non-standard-params '(("num_ctx" . 32768))))
  (setopt ellama-summarization-provider
	    (make-llm-ollama
	     :chat-model "mistral:7b"
	     :embedding-model "nomic-embed-text"
	     :default-chat-non-standard-params '(("num_ctx" . 32768))))
  ;; 翻訳用プロバイダー
  ;; https://ollama.com/library/aya-expanse
  (setopt ellama-translation-provider
	  (make-llm-ollama
	   :chat-model "aya-expanse:8b-q5_K_M"
	   :embedding-model "aya-expanse:8b-q5_K_M"))

  ;; ellama-provider-select で選択できる
  (setopt ellama-providers
	  '(
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
       ;; https://ollama.com/library/gemma3n/tags
       ("gemma3n:e4b-it-q8_0" .
         (make-llm-ollama
           :chat-model "gemma3n:e4b-it-q8_0"
           :embedding-model "embeddinggemma:300m-bf16"))
       ("gemma3n:e4b-it-fp16" .
         (make-llm-ollama
           :chat-model "gemma3n:e4b-it-fp16"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/codestral/tags
       ("codestral:22b-v0.1-q3_K_S" .
         (make-llm-ollama
           :chat-model "codestral:22b-v0.1-q3_K_S"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/codellama/tags
       ("codellama:13b-code-q4_K_S" .
         (make-llm-ollama
           :chat-model "codellama:13b-code-q4_K_S"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollaama.com/library/gemma3/tags
       ("gemma3:12b" .
         (make-llm-ollama
           :chat-model "gemma3:12b"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/gemma2/tags
       ("gemma2:27b-instruct-q4_K_S" .
         (make-llm-ollama
           :chat-model "gemma2:27b-instruct-q4_K_S"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/llama3.1/tags
       ("llama3.1:8b" .
         (make-llm-ollama
           :chat-model "llama3.1:8b"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/mistral/tags
       ("mistral:7b" .
         (make-llm-ollama
           :chat-model "mistral:7b"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/phi4/tags
       ("phi4:14b-q4_K_M" .
         (make-llm-ollama
           :chat-model "phi4:14b-q4_K_M"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; https://ollama.com/library/phi4-reasoning/tags
       ("phi4-reasoning:14b-plus-q8_0" .
         (make-llm-ollama
           :chat-model "phi4-reasoning:14b-plus-q8_0"
           :embedding-model "embeddinggemma:300m-bf16"))
       ;; Google Gemini
       ("Gemini 2.0 Flash" .
         (make-llm-gemini
           :chat-model "gemini-2.0-flash-exp"
           :key (auth-source-pick-first-password :host "gemini")))
       ))

  ;; Naming new sessions with llm
  (setopt ellama-naming-provider
	    (make-llm-ollama
	     :chat-model "llama3:8b-instruct-q8_0"
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
  :config
  ;; MCP integration
  (require 'gptel-integrations)

  ;; default model
  (setq gptel-mode 'gemini-3-pro-preview)
  (setq gptel-backend (gptel-make-gh-copilot "Copilot" :stream t))

  (setq gptel-use-curl t)
  (setq gptel-use-tools t)
  (setq gptel-confirm-tool-calls 'always)
  (setq gptel-include-tool-results 'auto)
  (setq gptel--system-message (concat gptel--system-message " Make sure to Japanese langugage."))

  ;; Ollama
  (gptel-make-ollama "ollama"
    :host "localhost:11434"
    :models '(
               ;; https://ollama.com/library/gemma3n/tags
               gemma3n:e4b-it-q8_0
               ;; https://ollama.com/library/gpt-oss/tags
               gpt-oss:20b
               )
    :request-params '(:options (:num_ctx 131072))
    :stream t
    )
  )

(use-package gptel-magit
  :ensure t
  :after (gptel magit)
  :hook (magit-mode . gptel-magit-install)
  )

(use-package mcp
  :ensure t
  :hook (after-init . mcp-hub-start-all-server)
  :custom
  (mcp-hub-servers
    `(
       ;; https://github.com/hashicorp/terraform-mcp-server
       ("terraform" .
         (:command "terraform-mcp-server" :args ("stdio")))

       ;; https://github.com/awslabs/mcp/tree/main/src/core-mcp-server
       ("aws_core" .
         ( :command "uvx" :args ("awslabs.core-mcp-server@latest")
           :env ( :FASTMCP_LOG_LEVEL "ERROR"
                  :aws-foundation "true"
                  :solutions-architect "true")))

       ;; https://github.com/awslabs/mcp/tree/main/src/terraform-mcp-server
       ("aws_terraform" .
         (:command "uvx" :args ("awslabs.terraform-mcp-server@latest") :env (:FASTMCP_LOG_LEVEL "ERROR")))

       ;; https://github.com/awslabs/mcp/tree/main/src/aws-documentation-mcp-server
       ("aws_documentation" .
         ( :command "uvx" :args ("awslabs.aws-documentation-mcp-server@latest")
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

(use-package agent-shell
  :ensure t
  :ensure-system-package
  ((cursor-agent-acp . "npm install -g @blowmage/cursor-agent-acp"))
  )

(provide '50-llm)
;;; 50-llm.el ends here
