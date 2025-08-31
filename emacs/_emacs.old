;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                          ;;
;;                          Yoru Alves .emacs file                          ;;
;;                                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; loading my custom files ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file "~/.emacs.custom.el")
(load "~/.emacs.rc/rc.el")
;; reading and writing files, also backups
(load "~/.emacs.d/tarffie-files.el")

(add-to-list 'load-path "~/.emacs.d/.emacs.local/")

;;;;;;;;;;;;;;;;;;;;;
;;  init packages  ;;
;;;;;;;;;;;;;;;;;;;;;

;; repositories
(package-initialize)
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))


;; add ELPA packages to load path
(let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))
(eval-when-compile
  (require 'use-package))

;;;;;;;;;;;;;;;;;
;;  apparence  ;;
;;;;;;;;;;;;;;;;;
(rc/require-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato) ; or 'latte, 'macchiato, or 'mocha
(load-theme 'catppuccin t)

(add-to-list 'custom-theme-load-path "$HOME/.emacs.d/themes")

(set-face-attribute 'default nil
                    :family "Caskaydiamono Nerd Font"
                    :height 180
                    :weight 'normal
                    :width 'normal)

(set-scroll-bar-mode nil)
(setq-default cursor-type 'box)
(tool-bar-mode 0)
(menu-bar-mode 0)
(set-fringe-style 0)

(setq inhibit-startup-screen t
      global-display-line-numbers 't
      display-line-numbers-type 'relative
      scroll-step 5)

(setq frame-background-mode nil
      column-number-mode t
      frame-title-format (concat invocation-name "@" (system-name) " {%f}")
      ;; no visible or audible bells, please
      visible-bell nil
      ring-bell-function (lambda nil (message "")))

;;;;;;;;;;;;;;;;;
;;  eye candy  ;;
;;;;;;;;;;;;;;;;;

;; moody for buffer like tabs
(rc/require 'moody)
(use-package moody
  :config
  (moody-replace-mode-line-front-space)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

;; minions for minor modes and stuff!
(keymap-global-set "<mouse-2>" #'minions-minor-modes-menu)

;; zones...
;; did you know that they've got this BUILT-IN?
(require 'zone)
(zone-when-idle 500)

(rc/require 'hide-mode-line)
(add-hook 'eshell-mode-hook #'hide-mode-line-mode)

;;  may or may not remove this one

(setq show-paren-style 'expression)

(use-package paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(global-display-line-numbers-mode 'relative)

(set-frame-parameter nil 'alpha-background 75)
(add-to-list 'default-frame-alist '(alpha-background . 75))


;;;;;;;;;;;;;;;;
;; navigation ;;
;;;;;;;;;;;;;;;;

;; open terminal
(global-set-key (kbd "s-t") 'eshell)

;; navigate between visible buffers (windows in emacs speak)
(defun other-window-backward (&optional n)
  (interactive "p")
  (if n
      (other-window (- n))
    (other-frame -1)))
(global-set-key "\C-x\C-n" 'other-window)
(global-set-key "\C-x\C-p" 'other-window-backward)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      ;;
;;     text editing     ;;
;;                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; prefer to use
(prefer-coding-system 'utf-8-unix)
;; the binding to stop minimizing emacs by accident
(global-unset-key "\C-z")
;; don't write backslashed to indicate continuous lines
(set-display-table-slot standard-display-table 'wrap ?\ )

;; it doesn't really make sense for it to just comment and not uncomment
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

;; treat y as yes n as no
(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key "\C-cn" 'find-dired)
(global-set-key "\C-cN" 'grep-find)

;; crux ;;
(rc/require 'crux)
(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

;; Move Text ;;
(rc/require 'move-text)
(global-set-key (kbd "M-P") 'move-text-up)
(global-set-key (kbd "M-N") 'move-text-down)
(global-set-key (kbd "C-a") 'crux-move-beginning-of-line)

(use-package grep)
(setq grep-find-ignored-directories
      (append
       (list
        ".git"
        ".hg"
        ".idea"
        ".project"
        ".settings"
        ".svn"
        "bootstrap*"
        "pyenv"
        "target"
        )
       grep-find-ignored-directories))

(setq grep-find-ignored-files
      (append
       (list
        "*.blob"
        "*.xd"
        "TAGS"
        "dependency-reduced-pom.xml"
        "projectile.cache"
        "workbench.xmi"
        )
       grep-find-ignored-files))

(setq grep-find-command
      "find ~/src/content-engine -name \"*.java\" | xargs grep -n -i -e ")
(rc/require 'ag)
(use-package ag
  :init
  (setq ag-arguments (list "--word-regexp" "--smart-case"))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; tab size and white spaces ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq tab-width 2
      c-basic-offset tab-width
      java-basic-offset tab-width
      java-ts-basic-offset tab-width)
(setq-default indent-tabs-mode nil)

;; ws-butler cleans up whitespace only on the lines you've edited,
;; keeping messy colleagues happy ;-) Important that it doesn't clean
;; the whitespace on currrent line, otherwise, eclim leaves messy
;; code behind.
(rc/require 'ws-butler)
(use-package ws-butler
  :init
  (setq ws-butler-keep-whitespace-before-point nil)
  :config
  (ws-butler-global-mode))

;;;;;;;;;;;;;;;;
;; minibuffer ;;
;;;;;;;;;;;;;;;;

(load "~/.emacs.d/minibuffer.el")

;;;;;;;;;;;;;;;;;;;;;;;;
;; Mode line settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/modeline.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Pure text settings - by tkj
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'text-mode-hook
          '(lambda ()
             (flyspell-mode)
             (git-gutter+-mode)
             (auto-fill-mode 1)))
(setq longlines-show-hard-newlines t)

(defun tkj-insert-left-arrow()
  (interactive)
  (insert "←"))
(defun tkj-insert-right-arrow()
  (interactive)
  (insert "→"))
(defun tkj-insert-up-arrow()
  (interactive)
  (insert "↑"))
(defun tkj-insert-down-arrow()
  (interactive)
  (insert "↓"))

(global-set-key "\C-x\C-c" 'compile) ;; imenu
(global-set-key (kbd "<C-S-f10>") 'recompile)
(global-set-key (kbd "<C-tab>") 'completion-at-point)

;; newline and indent (like other editors, even vi, do).
(global-set-key  "\C-m" 'newline-and-indent)

;; Automatically reload files was modified by external program
(global-set-key  [ (f5) ] 'revert-buffer)
(global-auto-revert-mode 1)
(setq revert-without-query (list "\\.png$" "\\.svg$")
      auto-revert-verbose nil)

;; Give visual hint where the cursor is when switching buffers.
(rc/require 'beacon)
(use-package beacon
  :config
  (beacon-mode 1))

;;;;;;;;;;;;;;;;;;;;;
;; compiler buffer ;;
;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/compile.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Editing VC log messages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'log-edit-hook (lambda () (flyspell-mode 1)))

;;; multiple cursors
(rc/require 'multiple-cursors 'expand-region)


(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(use-package expand-region
  :bind
  ("C-=" . 'er/expand-region))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ivy, counsel and swiper. Mostly minibuffer and navigation
;; enhancements.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/tarffie-ivy.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make C-x C-b maximise the buffer list window, this saves two
;; additional shortcuts from the normal behaviour. [thanks tkj]
(defun tkj-list-buffers()
  (interactive)
  (let ((helm-full-frame t))
    (helm-mini)))
(global-unset-key "\C-x\C-b")
(global-set-key "\C-x\C-b" 'tkj-list-buffers)

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; buffer names and mini buffer
(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'forward
        uniquify-separator ":"
        uniquify-strip-common-suffix nil
        read-file-name-completion-ignore-case t))

;; Auto scroll the compilation window
(setq compilation-scroll-output t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(rc/require 'helm-swoop)
(use-package helm-swoop
  :bind
  ("M-n" . helm-swoop))

(rc/require 'helm-projectile)
(use-package helm-projectile
  :bind
  ("C-'" . helm-projectile-grep))

(global-set-key (kbd "C-s") 'isearch-forward)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  ;;
;;     Highlighting and parsing     ;;
;;                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; auto-complete
(rc/require 'company)

(global-company-mode 1)
(global-set-key (kbd "<C-return>") 'company-complete)

(rc/require 'company-emoji)
(use-package company-emoji)

(add-to-list 'company-backends 'company-emoji)

;; CSS mode

(load "~/.emacs.d/tarffie-css.el")

;;;;;;;;;;;;;;;;;;;;;
;; Hippe expansion ;;
;;;;;;;;;;;;;;;;;;;;;

(rc/require 'hippie-exp)
(autoload 'hippie-exp "hippie-exp" t)

;;;;;;;;;;;;;;
;; Markdown ;;
;;;;;;;;;;;;;;

(add-hook 'markdown-mode-hook 'flyspell-mode)

;;;;;;;;;;;;;;;;
;; Yasnippets ;;
;;;;;;;;;;;;;;;;

(rc/require 'yasnippet)

(use-package yasnippet
  :ensure t
  :config

  (setq yas/root-directory
        (list "~/.emacs.d/snippets")
        yas-indent-line 'fixed)
  (yas-global-mode))

;;;;;;;;;
;; SQL ;;
;;;;;;;;;

(add-hook 'sql-interactive-mode-hook
          '(lambda ()
             (company-mode)))

;;;;;;;;;;;;;;;;;
;; Web browser ;;
;;;;;;;;;;;;;;;;;

(setq browse-url-generic-program "firefox"
      browse-url-browser-function 'browse-url-generic)

;;;;;;;;;;;;;;;;;;;;;
;; Emacs behaviour ;;
;;;;;;;;;;;;;;;;;;;;;

(setq warning-suppress-types (quote ((undo discard-info))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For some reason, being on different networks (as experienced in
;; Dhaka), the p4 integration made all file operation extremely slow,
;; hence the explicity loading here).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun tkj-load-p4()
  (interactive)
  (load "$HOME/.emacs.d/tkj-p4.el")
  (p4-opened))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VC related settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/tkj-vc.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; XML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/tkj-xml.el")
(load "~/.emacs.d/tkj-web.el")

;;;;;;;;;;;;;;;;;;;;;
;; Javascript mode ;;
;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/tarffie-js.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Unfill
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto insert file templates
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/tkj-auto-insert.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tidy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun tidy-buffer ()
  "Run Tidy HTML parser on current buffer."
  (interactive)
  (if (get-buffer "tidy-errs") (kill-buffer "tidy-errs"))
  (shell-command-on-region (point-min) (point-max)
                           "tidy -f /tmp/tidy-errs -q -wrap 72" t)
  (find-file-other-window "/tmp/tidy-errs")
  (other-window 1)
  (delete-file "/tmp/tidy-errs")
  (message "buffer tidy-ed"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Diff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-split-window-function 'split-window-horizontally ;; !work
      ediff-diff-options "-w"
      smerge-command-prefix "\C-cv")
;; Restore window/buffers when you're finishd ediff-ing.
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/custom-org.el") ;; TODO

;;Allow interactive narrow-to-region
(put 'narrow-to-region 'disabled nil)

(global-tree-sitter-mode t)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(rc/require 'lsp-mode)
(rc/require 'lsp-ui)

(rc/require 'flycheck)
(rc/require 'lsp-treemacs)

(rc/require 'helm-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)

(rc/require 'tree-sitter)
(rc/require 'tree-sitter-langs)

;;;;;;;;;;;;;
;; company ;;
;;;;;;;;;;;;;

(use-package company
  :ensure t
  :config
  (global-set-key (kbd "<C-return>") 'company-complete)
  (global-company-mode 1))

;; Get auto completion of :emoji: names.
(use-package company-emoji
  :ensure t
  :after company-mode
  :config
  (company-emoji-init))

;;;;;;;;;;
;; java ;;
;;;;;;;;;;

(use-package lsp-mode
  :ensure t
  :hook
  ((lsp-mode . lsp-diagnostics-mode)
   (lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-enable-file-watchers nil
        lsp-headerline-breadcrumb-enable nil
        )

  ;; Performance tweaks, see
  ;; https://github.com/emacs-lsp/lsp-mode#performance
  (setq gc-cons-threshold 100000000)
  ;;1mb
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-idle-delay 0.500)

  :bind
  (:map lsp-mode-map
        (("\C-\M-g" . lsp-find-implementation)
         ("M-RET" . lsp-execute-code-action)))
  )

(use-package hydra :ensure t)
(use-package lsp-ui :ensure t)
(use-package which-key :ensure t :config (which-key-mode))
(use-package lsp-java
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lsp)
  (setq lsp-java-vmargs
        '(
          "-noverify"
          "-Xmx4G"
          "-XX:+UseG1GC"
          "-XX:+UseStringDeduplication"
          ;"-javaagent:/home/torstein/.m2/repository/org/projectlombok/lombok/1.18.32/lombok-1.18.32.jar"
          )

      lsp-java-java-path "/home/tarffie/.jabba/jdk/openjdk@1.17.0/bin/java"

        ;; Don't organise imports on save
        lsp-java-save-action-organize-imports nil

        ;; Don't format my source code (I use Maven for enforcing my
        ;; coding style)
        lsp-java-format-enabled nil))

(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package lsp-treemacs)

(defun tkj-default-code-style-hook()
  (setq c-basic-offset 2
        c-label-offset 0
        indent-tabs-mode nil
        require-final-newline nil))
(add-hook 'java-mode-hook 'tkj-default-code-style-hook)

(defun my-java-mode-hook ()
  (auto-fill-mode)
  (flycheck-mode)
  (subword-mode)
  (yas-minor-mode)
  (when window-system
    (set-fringe-style '(8 . 0)))

  ;; Fix indentation for anonymous classes
  (c-set-offset 'substatement-open 0)
  (if (assoc 'inexpr-class c-offsets-alist)
      (c-set-offset 'inexpr-class 0))

  ;; Indent arguments on the next line as indented body.
  (c-set-offset 'arglist-intro '++))
(add-hook 'java-mode-hook 'my-java-mode-hook)

(rc/require 'smartparens)
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1)
  (setq-default show-smartparens-global-mode 1))

(sp-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
(sp-pair "[" nil :post-handlers '(("||\n[i]" "RET")))
(sp-pair "(" nil :post-handlers '(("||\n[i]" "RET")))

;;; dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")

;;; helm
(rc/require 'helm  'helm-git-grep 'helm-ls-git)
(setq helm-ff-transformer-show-only-basename nil)
(global-set-key (kbd "C-c h t") 'helm-cmd-t)
(global-set-key (kbd "C-c h g l") 'helm-ls-git-ls)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h a") 'helm-org-agenda-files-headings)
(global-set-key (kbd "C-c h r") 'helm-recentf)

;;; harpoon
(global-set-key (kbd "C-c SPC") 'harpoon-quick-menu-hydra)
(global-set-key (kbd "C-c a") 'harpoon-add-file)
(global-set-key (kbd "C-c h e") 'harpoon-toggle-quick-menu)
(global-set-key (kbd "C-c h c") 'harpoon-clear)
(global-set-key (kbd "C-c h 1") 'harpoon-go-to-1)
(global-set-key (kbd "C-c h 2") 'harpoon-go-to-2)
(global-set-key (kbd "C-c h 3") 'harpoon-go-to-3)
(global-set-key (kbd "C-c h 4") 'harpoon-go-to-4)
(global-set-key (kbd "C-c h 5") 'harpoon-go-to-5)
(global-set-key (kbd "C-c h 6") 'harpoon-go-to-6)
(global-set-key (kbd "C-c h 7") 'harpoon-go-to-7)
(global-set-key (kbd "C-c h 8") 'harpoon-go-to-8)
(global-set-key (kbd "C-c h 9") 'harpoon-go-to-9)
