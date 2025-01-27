;;; 50-llm --- local LLM for Emacs
;;; Commentary:

;;; Code:
(use-package ellama
  :ensure t
  ;; :if (executable-find "ollama")
  :bind ("C-c e" . ellama-transient-main-menu)
  :init
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
	     :chat-model "qwen2.5:3b"
	     :embedding-model "nomic-embed-text"
	     :default-chat-non-standard-params '(("num_ctx" . 32768))))
  ;; 翻訳用プロバイダー
  ;; https://ollama.com/library/aya
  (setopt ellama-translation-provider
	  (make-llm-ollama
	   :chat-model "aya:8b-23-q5_K_M"
	   :embedding-model "aya:8b-23-q5_K_M"))

  ;; ellama-provider-select で選択できる
  (setopt ellama-providers
	        '(
            ;; https://ollama.com/library/codestral/tags
            ("codestral" . (make-llm-ollama
                            :chat-model "codestral:22b-v0.1-q3_K_S"
                            :embedding-model "codestral:22b-v0.1-q3_K_S"))
            ;; https://ollama.com/library/gemma2/tags
            ("gemma2" . (make-llm-ollama
                         :chat-model "gemma2:27b-instruct-q4_K_S"
                         :embedding-model "gemma2:27b-instruct-q4_K_S"))
            ;; https://ollama.com/library/llama3.1/tags
            ("llama3.1" . (make-llm-ollama
                           :chat-model "llama3.1:8b"
                           :embedding-model "llama3.1:8b"))
            ;; https://ollama.com/incept5/llama3.1-claude
            ("llama3.1-claude" . (make-llm-ollama
                                  :chat-model "incept5/llama3.1-claude:latest"
                                  :embedding-model "incept5/llama3.1-claude:latest"))
            ))

  ;; Naming new sessions with llm
  (setopt ellama-naming-provider
	    (make-llm-ollama
	     :chat-model "llama3:8b-instruct-q8_0"
	     :embedding-model "nomic-embed-text"
	     :default-chat-non-standard-params '(("stop" . ("\n")))))
  (setopt ellama-naming-scheme 'ellama-generate-name-by-llm)
  )

(provide '50-llm)
;;; 50-llm.el ends here
