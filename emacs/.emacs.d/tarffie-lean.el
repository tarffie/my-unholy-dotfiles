;;; tarffie-lean.el --- handling lean4 mode
;;; Commentary:
;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(use-package lean4-mode
  :commands lean4-mode
  :vc (:url "https://github.com/leanprover-community/lean4-mode.git"
            :rev :last-release
            ;; Or, if you prefer the bleeding edge version of Lean4-Mode:
            ;; :rev :newest
            ))

(provide 'tarffie-lean)
;;; tarffie-lean.el ends here;
