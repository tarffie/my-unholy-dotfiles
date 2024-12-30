;;; rc.el -- package for easier package management and fetching
;;; Commentary:
;;; package written originally by Tsoding from tsoding daily
;;; original link: https://github.com/rexim/dotfiles/blob/master/.emacs.rc/rc.el

;;; code:

(defvar rc/package-contents-refreshed nil)

(defun rc/package-refresh-contents-once ()
  "When repos not refreshed, refresh it."
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-one-package (package)
  "When PACKAGE is not installed, refresh if necessary and installed."
  (when (not (package-installed-p package))
    (rc/package-refresh-contents-once)
    (package-install package)))

(defun rc/require (&rest packages)
  "Get list of required PACKAGES and install one by one."
  (dolist (package packages)
    (rc/require-one-package package)))

(defun rc/require-theme (theme)
  "Get variable THEME as string and install it for you."
  ;'-theme' is not necessary on the string.
  (let ((theme-package (->> theme
                            (symbol-name)
                            (funcall (-flip #'concat) "-theme")
                            (intern))))
    (rc/require theme-package)
    (load-theme theme t)))

(rc/require 'dash)
(require 'dash)
(rc/require 'dash-functional)
(require 'dash-functional)

(provide 'rc)
;;; rc.el ends here
