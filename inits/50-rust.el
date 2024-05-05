;;; 50-rust --- rust-mode
;;; Commentary:

;;; Code:
(use-package rust-mode
  :ensure t
  :mode
  (("\\.rs\\'" . rust-mode))
  :init
  (cond ((file-exists-p "~/.cargo")
         (let ((my/cargo-bin (expand-file-name "~/.cargo/bin")))
           (unless (member my/cargo-bin exec-path)
             (setq exec-path (cons my/cargo-bin exec-path))
             (setenv "PATH" (concat my/cargo-bin ":" (getenv "PATH"))))))
        )
  :config
  (add-hook 'racer-mode-hook 'eldoc-mode)
  )

(use-package cargo
  :commands (cargo-minor-mode)
  :if (executable-find "cargo")
  :after (rust-mode)
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  :config
  (setq cargo-process--command-bench "cargo bench")
  (setq cargo-process--command-build "cargo build")
  (setq cargo-process--command-clean "cargo clean")
  (setq cargo-process--command-doc "cargo doc")
  (setq cargo-process--command-doc-open "cargo doc --open")
  (setq cargo-process--command-new "cargo new")
  (setq cargo-process--command-init "cargo init")
  (setq cargo-process--command-run "cargo run")
  (setq cargo-process--command-run-bin "cargo run --bin")
  (setq cargo-process--command-run-example "cargo run --example")
  (setq cargo-process--command-search "cargo search")
  (setq cargo-process--command-test "cargo test")
  (setq cargo-process--command-current-test "cargo test")
  (setq cargo-process--command-current-file-tests "cargo test")
  (setq cargo-process--command-update "cargo update")
  (if (and (executable-find "cargo-fmt") (executable-find "rustfmt"))
      ;; cargo install rustfmt
      (setq cargo-process--command-fmt "cargo fmt"))
  (if (and (executable-find "cargo-check"))
      ;; cargo install cargo-check
      (setq cargo-process--command-check "cargo check"))
  (if (and (executable-find "cargo-clippy") (executable-find "clippy-driver"))
      ;; cargo install clippy
      (setq cargo-process--command-clippy "cargo clippy"))
  )

(use-package racer
  :commands (racer-mode)
  :if (executable-find "racer")         ; cargo install racer
  :after (rust-mode)
  :init
  (add-hook 'rust-mode-hook 'racer-mode)
  :config
  ;; rustup component add rust-src
  (setq racer-cmd (executable-find "racer"))
  (setq racer-rust-src-path
        ;; installed by rustup component add rust-src
        (concat (expand-file-name "~/.rustup/toolchains/")
                (cond ((eq darwin-p t)
                       "stable-x86_64-apple-darwin/")
                      ((eq linux-p t)
                       "stable-x86_64-unknown-linux-gnu/"))
                "lib/rustlib/src/rust/src"))
  )

(provide '50-rust)
;;; 50-rust ends here
