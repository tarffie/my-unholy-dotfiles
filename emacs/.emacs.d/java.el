(rc/require 'projectile)
(rc/require 'hydra)
(rc/require 'lsp-java)
(rc/require 'java-ts-mode)
(add-hook 'java-mode-hook #'lsp)
;; use packages 
(use-package projectile)
(use-package flycheck)
;; lsp-mode setup
(use-package lsp-mode :hook ((lsp-mode))
:config (setq lsp-completion-enable-additional-text-edit nil))

(use-package hydra)
(use-package lsp-java :config (add-hook 'java-mode-hook 'java-ts-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package lsp-treemacs)
