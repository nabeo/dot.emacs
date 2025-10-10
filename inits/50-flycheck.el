;;; 50-flycheck --- flycheck
;;; Commentary:

;;; Code:
(use-package flycheck
  :ensure t
  :commands (global-flycheck-mode)
  :bind
  :init
  (push '("*Flycheck errors*") popwin:special-display-config)
  :config
  ;; https://www.emacswiki.org/emacs/CfnLint
  (flycheck-define-checker cfn-lint
    "AWS CloudFormation linter using cfn-lint.

Install cfn-lint first: pip install cfn-lint

See `https://github.com/aws-cloudformation/cfn-python-lint'."
    :command ("cfn-lint" "-f" "parseable" source)
    :error-patterns ((warning line-start (file-name) ":" line ":" column
                       ":" (one-or-more digit) ":" (one-or-more digit) ":"
                       (id "W" (one-or-more digit)) ":" (message) line-end)
                      (error line-start (file-name) ":" line ":" column
                        ":" (one-or-more digit) ":" (one-or-more digit) ":"
                        (id "E" (one-or-more digit)) ":" (message) line-end))
    :modes (cfn-json-mode cfn-yaml-mode))
  (add-to-list 'flycheck-checkers 'cfn-lint)

  ;; textlint
  ;; flycheck-textlint-executable の設定
  ;; パスに textlint があればそれを使い、なければ mise 経由で探す
  (cond
    ((executable-find "textlint")
      (setq flycheck-textlint-executable "textlint"))
    ((executable-find "mise")
      (setq flycheck-textlint-executable
        (string-trim
          (shell-command-to-string
            (mapconcat #'shell-quote-argument (list "mise" "which" "textlint") " ")))))
    (t "textlint"))
  ;; Emacs 向けの textlintrc を指定する
  (setq flycheck-textlint-config (concat user-emacs-directory "data/textlintrc.json"))
  ;; https://github.com/textlint-ja/textlint-rule-preset-ja-technical-writing
  (add-to-list 'flycheck-textlint-plugin-alist
    '(t . "textlint-rule-preset-ja-technical-writing"))
  ;; https://github.com/textlint-ja/textlint-rule-ja-unnatural-alphabet
  (add-to-list 'flycheck-textlint-plugin-alist
    '(t . "textlint-rule-ja-unnatural-alphabet"))
  ;; https://github.com/textlint-ja/textlint-rule-ja-no-redundant-expression
  (add-to-list 'flycheck-textlint-plugin-alist
    '(t . "textlint-rule-ja-no-redundant-expression") )
  )

(use-package flycheck-inline
  :ensure t
  :after (flycheck)
  :hook
  (flycheck-mode . flycheck-inline-mode))

(provide '50-flycheck)
;;; 50-flycheck.el ends here
