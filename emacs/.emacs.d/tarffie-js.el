(use-package eglot
  :ensure t
  :config
  (electric-pair-mode)
  :hook
  (typescript-ts-mode . eglot-ensure)
  (tsx-ts-mode . eglot-ensure)
  (c-mode . eglot-ensure))

(use-package typescript-ts-mode
  :ensure t
  :after eglot
  :config
  (setq typescript-ts-mode-indent-offset 2))

(rc/require 'treesit-auto)
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

