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
  ;; https://ollama.com/library
  ;; デフォルトのプロバイダー
  (setopt ellama-provider
	    (make-llm-ollama
	     :chat-model "codestral:22b-v0.1-q3_K_S"
	     :embedding-model "codestral:22b-v0.1-q3_K_S"))
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
            ;; https://ollama.com/library/codestral/tags
             ("codestral" . (make-llm-ollama
                              :chat-model "codestral:22b-v0.1-q3_K_S"
                              :embedding-model "codestral:22b-v0.1-q3_K_S"))
             ("codellama" . (make-llm-ollama
                              :chat-model "codellama:13b-code-q4_K_S"
                              ))
             ;; https://ollama.com/library/gemma2/tags
             ("gemma2" . (make-llm-ollama
                           :chat-model "gemma2:27b-instruct-q4_K_S"
                           :embedding-model "gemma2:27b-instruct-q4_K_S"))
             ;; https://ollama.com/library/llama3.1/tags
             ("llama3.1" . (make-llm-ollama
                             :chat-model "llama3.1:8b"
                             :embedding-model "llama3.1:8b"))
             ("mistral" . (make-llm-ollama
                            :chat-model "mistral:7b"))
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
  (setq ellama-code-review-prompt-template "以下のコードのレビューと改善案をだして:\n```\n%s\n```")
  )

(provide '50-llm)
;;; 50-llm.el ends here
