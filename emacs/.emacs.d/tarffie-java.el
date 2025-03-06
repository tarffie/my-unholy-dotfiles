;;; tarffie-java.el --- handling java mode
;;; Commentary:
;;; Code:

(use-package eglot
  :ensure t
  :config
  (electric-pair-mode t)
  :hook
  (java-ts-mode . eglot-ensure)
  (java-mode . eglot-ensure))

(use-package java-ts-mode
  :ensure t
  :after eglot
  :config
  (setq-default java-ts-basic-offset 2))

(require 'treesit-auto)
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(provide 'tarffie-java)
;;; tarffie-java.el ends here;
