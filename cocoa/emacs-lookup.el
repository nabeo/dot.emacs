;; Last update is ....
;; Time-stamp: "Thu Apr 08 16:33:05 JST 2010"

;; 初回起動時のロゴを消す
(setq lookup-enable-splash nil)

(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)

;; lookup用の辞書を登録する
(setq lookup-search-agents 
      '((ndeb "/Users/nabeo/.emacs.d/lookup-dic/EDICT")
        ))

;; キーバインドの設定
(global-set-key "\C-c\C-l" 'lookup)
(global-set-key "\C-cl" 'lookup-word)
(global-set-key "\C-cy" 'lookup-region)
(global-set-key "\C-c\C-y" 'lookup-pattern)

;; (lookup-set-dictionary-option "agent:DICT" ':stemmer 'stem-english)