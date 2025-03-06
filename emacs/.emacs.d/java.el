;;; java.el --- java files handling
;;; Commentary:
;;; Code:
(rc/require 'java-ts-mode)
(add-hook 'java-ts-mode-hook 'eglot-java-mode)
(add-hook 'java-mode-hook 'eglot-java-mode)


(rc/require 'eglot-java)
(define-key eglot-java-mode-map (kbd "C-c l n") #'eglot-java-file-new)
(define-key eglot-java-mode-map (kbd "C-c l x") #'eglot-java-run-main)
(define-key eglot-java-mode-map (kbd "C-c l t") #'eglot-java-run-test)
(define-key eglot-java-mode-map (kbd "C-c l N") #'eglot-java-project-new)
(define-key eglot-java-mode-map (kbd "C-c l T") #'eglot-java-project-build-task)
(define-key eglot-java-mode-map (kbd "C-c l R") #'eglot-java-project-build-refresh)

(add-hook 'java-mode-hook #'eglot)
(add-hook 'java-ts-mode-hook #'eglot)

(provide 'java)
;;; java.el ends here
