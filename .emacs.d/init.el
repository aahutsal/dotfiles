;; Workaround on w3 bug: https://lists.gnu.org/archive/html/bug-gnu-emacs/2016-10/msg01345.html

(fset 'mm-decode-coding-region 'decode-coding-region)

(package-initialize)
(setq use-package-always-ensure t)
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(setq custom-file "~/.emacs.d/custom-settings.el")
(load custom-file t)

(defun my/laptop-p ()
  (equal (system-name) "sacha-kubuntu"))
(defun my/server-p ()
  (and (equal (system-name) "localhost") (equal user-login-name "sacha")))
(defun my/phone-p ()
  (and (equal (system-name) "localhost") (not (equal user-login-name "sacha"))))

;; Simplifies syncing
(global-auto-revert-mode)

;; Personal Information
(setq user-full-name "Arsen A. Gutsal"
      user-mail-address "gutsal.arsen@gmail.com"
      calendar-latitude 49.553516
      calendar-longitude -25.594767
      calendar-location-name "Ternopil, Ukraine")
      

(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))

;; Loading/defining 'use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
	     :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; Secrets
(load "~/.emacs.secrets" t)

;; Reload Emacs configuration
(defun my/reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

;; Libraries
(use-package dash :ensure t)
(use-package diminish :ensure t)

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

; Disk space is cheap. Save lots.

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; History

; From http://www.wisdomandwonder.com/wp-content/uploads/2014/03/C3F.html:

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring))

;; Windows configuration   drill

; When you're starting out, the tool bar can be very helpful. (Emacs Basics: Using the Mouse). Eventually, you may want to reclaim that extra little bit of screenspace. The following code turns that thing off. (Although I changed my mind about the menu - I want that again.)

(tool-bar-mode -1)

;; Time in the modeline

; I like having the clock.

(display-time-mode 1)


;; Winner mode - undo and redo window configuration

; winner-mode lets you use C-c <left> and C-c <right> to switch between window configurations. This is handy when something has popped up a buffer that you want to look at briefly before returning to whatever you were working on. When you're done, press C-c <left>.

(use-package winner
  :defer t)

;; More sensible indentation (2 instead of 8 spaces).

(setq-default tab-width 2)

;; Remove the annoying bell sound from Emacs.

(setq ring-bell-function 'ignore)

;; Get proper line breaks, 100 for text and 80 for programming.

(dolist (hook '(text-mode-hook latex-mode-hook tex-mode-hook))
        (add-hook hook (lambda () (set-fill-column 100))))
(dolist (hook '(python-mode-hook prog-mode-hook list-mode-hook))
        (add-hook hook (lambda () (set-fill-column 80))))

;; Wrap paragraphs automatically

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)

;; Deal with pop-up windows better with popwin.
;; (use-package popwin
;;         :config
;;         (popwin-mode 1)
;;         ;; set all buffers to appear to the right
;;         (push '(help-mode :position right :width 0.45) popwin:special-display-config))

;; ;; Evil
;; ; Load evil
;; (use-package evil
;;         :config
;;         (evil-mode 1))

;; UI

; Remove the scroll bar and the menu.

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-window-scroll-bars (minibuffer-window) nil nil)

; Use full-path-name of file in window

(setq frame-title-format
			'((:eval (if (buffer-file-name)
									 (abbreviate-file-name (buffer-file-name))
								 "%b"))))

; Use zenburn theme and set font and mode bar.

(use-package zenburn-theme
	:config
	(load-theme 'zenburn t)
	(let ((line (face-attribute 'mode-line :underline)))
		(set-face-attribute 'mode-line          nil :overline   line)
		(set-face-attribute 'mode-line-inactive nil :overline   line)
		(set-face-attribute 'mode-line-inactive nil :underline  line)
		(set-face-attribute 'mode-line          nil :box        nil)
		(set-face-attribute 'mode-line-inactive nil :box        nil)
		(set-face-attribute 'mode-line-inactive nil :background "#f9f2d9")))
;; (set-frame-font "DejaVu Sans Mono" nil t)
;; (set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 85)

;; Sentences end with a single space

;In my world, sentences end with a single space. This makes sentence navigation commands work for me.

(setq sentence-end-double-space nil)

;; Magithub

(use-package magit)
(use-package magithub
  :after magit
  :ensure t
  :config (magithub-feature-autoinject t))


(use-package multi-term)
(use-package beacon
	:ensure t
	:config (beacon-mode 1))

(setq beacon-push-mark 35)
(setq beacon-color "#007770")

;; Docker
(use-package docker :ensure t)

;; Recompile everything
; (byte-recompile-directory package-user-dir nil 'force)
