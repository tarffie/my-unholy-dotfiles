;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remove uninteresting information from the mode line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(rc/require 'diminish)
(use-package diminish
  :config
  (diminish 'abbrev-mode)
  (diminish 'auto-fill-function)
  (diminish 'auto-revert-mode)
  (diminish 'command-log-mode)
  (diminish 'company-mode)
  (diminish 'company-search-mode)
  (diminish 'compilation-minor-mode)
  (diminish 'eclim-mode)
  (diminish 'flyspell-mode)
  (diminish 'slack-mode)
  (diminish 'slack-message-buffer-mode)
  (diminish 'slack-thread-mode)
  (diminish 'slack-thread-message-buffer-mode)
  (diminish 'undo-tree-mode)
  (diminish 'visual-line-mode)
  (diminish 'ws-butler-mode)
  (diminish 'yas-minor-mode)
  )
