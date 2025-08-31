;;; package --- scheme and other lisp code configuration
;;; Commentary:
;;; Tarffie custom configuration for LISP
;;; Code:

(setq-default geiser-guile-binary "/usr/bin/guile-3.0")

(use-package geiser
  :after
  (scheme-mode)
  :config
  (add-hook scheme-mode-hook 'smartparens-mode))

(provide 'tarffie-lisp)
;;; tarffie-lisp.el ends here
