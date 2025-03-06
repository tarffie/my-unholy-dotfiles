;;; Tarffie-files ---  Tarffie emacs configuration for everything related to files and backups
;;; Commentary:
;;; easy way to organize my file prefferences and what loads what

;;; Code:

;; backups were disabled before, but felt the sudden (/s) urge to change it back
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(setq backup-by-copying t)

(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'" filename (file-name-nondirectory new-name))))))))

(global-set-key (kbd "C-x C-r") 'rename-this-buffer-and-file)

;; I'm normally just interested in the file listings (ls, not ls -l so
;; to speak)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; Try to be smart about which target directory to use for dired
;; operations (cp, mv)
(setq-default dired-dwim-target t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Associate different modes with different file types.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq auto-mode-alist
      (append
       '(("\\.awk\\'" . awk-mode)
         ("ChangeLog" . change-log-mode)
         ("\\.bashrc\\'" . sh-mode)
         ("\\.bib\\'" . bibtex-mode)
         ("\\.blockdiag\\'" . perl-mode)
         ("\\.c\\'" . c-mode)
         ("\\.cgi\\'" . python-mode)
         ("\\.conf\\'" . conf-mode)
         ("\\.config\\'" . conf-mode)
         ("config" . conf-mode)
         ("\\.cpp\\'" . c++-mode)
         ("\\.css\\'" . css-mode)
         ("Dockerfile" . dockerfile-mode)
         ("\\.diff\\'" . diff-mode)
         ("\\.dtd\\'" . sgml-mode)
         ("\\.ebk\\'" . nxml-mode)
         ("\\.el\\'"  . emacs-lisp-mode)
         ("\\.emacs\\'" . emacs-lisp-mode)
         ("\\.es$" . c++-mode)
         ("\\.htm\\'" . html-mode)
         ("\\.html\\'" . web-mode)
         ("\\.idl\\'" . c++-mode)
         ("\\.ini\\'" . conf-mode)
         ("\\.java$" . java-mode)
         ("\\.jbk\\'" . nxml-mode)
         ("\\.js$" . js-mode)
         ("\\.json$" . json-mode)
         ("\\.jsp$" . nxml-mode) ;; nxml-mode
         ("\\.jspf$" . nxml-mode) ;; nxml-mode
         ("\\.less\\'" . javascript-mode)
         ("\\.magik$" . python-mode)
         ("\\Makefile$" . makefile-mode)
         ("\\makefile$" . makefile-mode)
         ("\\.md$" . markdown-mode)
         ("\\.odl\\'" . c++-mode)
         ("\\.org\\'" . org-mode)
         ("\\.patch\\'" . diff-mode)
         ("\\.pdf\\'" . doc-view-mode)
         ("\\.php\\'" . php-mode)
         ("\\.phtml\\'" . php-mode)
         ("\\.pl\\'" . perl-mode)
         ("\\.pp\\'" . ruby-mode)
         ("\\.properties.template\\'" . conf-mode)
         ("\\.properties\\'" . conf-mode)
         ("\\.puppet\\'" . puppet-mode)
         ("\\.py$" . python-mode)
         ("\\.py\\'" . python-mode)
         ("\\.sed\\'" . sh-mode)
         ("\\.sh\\'" . sh-mode)
         ("\\.shtml\\'" . nxml-mode)
         ("\\.sql\\'" . sql-mode)
         ("\\.targets$" . nxml-mode)
         ("\\.tex\\'" . latex-mode)
         ("\\.text\\'" . text-mode)
         ("\\.tld.*\\'" . nxml-mode)
         ("\\.txt\\'" . text-mode)
         ("\\.vcl\\'" . java-mode)
         ("\\.vm\\'" . emacs-lisp-mode)
         ("\\.wfcfg\\'" . perl-mode)
         ("\\.wsdd\\'" . nxml-mode)
         ("\\.xml$" . nxml-mode) ;; psgml-mode, nxml-mode
         ("\\.xsd$" . nxml-mode) ;; xsl-mode
         ("\\.xsl$" . nxml-mode) ;; xsl-mode
         ("\\.yaml\\'" . yaml-mode)
         ("\\.yml\\'" . yaml-mode)
         ("\\config\\'" . conf-mode)
         ("control" . conf-mode)
         ("github.*\\.txt$" . markdown-mode)
         ("pom.xml" . nxml-mode)
         ("tkj-p4-diff-buffer" . diff-mode)
         ("*.ml" . tuareg-mode)
         ("*.*sx" . tsx-ts-mode)
         ("*.ts" . typescript-ts-mode)
         ("*.js" . javascript-mode)
         ("*.java" . java-mode)
         ("*.scm" . scheme-mode)
         ("*.ss" . scheme-mode)
         )))


(provide 'tarffie-files)
;;; tarffie-files.el ends here
