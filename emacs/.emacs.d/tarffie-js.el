;;; tarffie-js.el --- configurations for javascript and typescript files
;;; Commentary:

;;; Code:
(use-package eglot
  :ensure t
  :config
  (electric-pair-mode)
  :hook
  (typescript-ts-mode . eglot-ensure)
  (tsx-ts-mode . eglot-ensure)
  (javascript-mode . eglot-ensure)
  (c-mode . eglot-ensure))

(setq-default js-indent-level 2)

(use-package typescript-ts-mode
  :ensure t
  :after eglot
  :config
  (setq typescript-ts-mode-indent-offset 2))

(require 'treesit-auto)
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;;; tarffie-js.el ends here;
