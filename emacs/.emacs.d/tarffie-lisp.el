;;; package --- scheme and other lisp code configuration
;;; Commentary:
;;; Tarffie custom configuration for LISP
;;; Code:

(use-package geiser
  :after
  (scheme-mode)
  :config
  (add-hook scheme-mode-hook 'smartparens-mode))

(provide 'tarffie-lisp)
;;; tarffie-lisp.el ends here
