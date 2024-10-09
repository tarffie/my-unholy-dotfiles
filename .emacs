(setq custom-file "~/.emacs.custom.el")
(load "~/.emacs.rc/rc.el")
(load "~/.emacs.d/java.el")
;; this is the start of my config file ;;
(setq inhibit-startup-screen t
      global-display-line-numbers 't
      display-line-numbers-type 'relative
      scroll-step 0)
(setq default-frame-alist '((font . "CaskaydiaMono Nerd Font-18:regular")))
(global-display-line-numbers-mode 'relative)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(add-to-list 'default-frame-alist '(alpha-background . 75))

(add-to-list 'load-path "~/.emacs.d/.emacs.local/")
(rc/require-theme 'jbeans)

;; ido
(rc/require 'smex 'ido-completing-read+)
(require 'ido-completing-read+)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

;; smex and notes
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-c n") (find-file "~/notes/notes.org"))


;; LSP + Tree-sitter
(rc/require 'lsp-mode) 
(rc/require 'lsp-ui)
(rc/require 'company)
(rc/require 'flycheck)
(rc/require 'lsp-treemacs)

(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(rc/require 'tree-sitter)
(rc/require 'tree-sitter-langs)
(global-tree-sitter-mode t)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  ;; Additional configuration options, if needed
  )

(setq company-idle-delay 0.2) ;; Adjust the idle delay as needed

(use-package company-dabbrev
  :config
  (add-to-list 'company-backends 'company-dabbrev))

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

;;; multiple cursors  
(rc/require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;; compile on C-c C-c && term 
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c C-t") 'term)

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

;;; yasnippet
(rc/require 'yasnippet)
(require 'yasnippet)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.snippets/"))
(yas-global-mode t)

;;; crux 
(rc/require 'crux)
(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

;;; Move Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "C-a") 'crux-move-beginning-of-line)

;; backups were disabled before, but felt the sudden (/s) urge to change it back 
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;;; tab size and stuff 
(setq tab-width 2
      c-basic-offset tab-width
      java-basic-offset tab-width
      java-ts-basic-offset tab-width)
(setq-default indent-tabs-mode nil)

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
