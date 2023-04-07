;; Personal Information
(setq user-full-name "Arsen A. Hutsal"
      user-mail-address "gutsal.arsen@gmail.com"
      calendar-latitude 49.553516
      calendar-longitude -25.594767
      calendar-location-name "Ternopil, Ukraine")

;; (spacemacs/toggle-fullscreen)
;; decreasing mode-line font size
(set-face-attribute 'mode-line nil  :height 80)

;; setting 'w3m-search keybindings
(use-package w3m
  :bind (("C-c [" . w3m-tab-previous-buffer)
         ("C-c ]" . w3m-tab-next-buffer)
         ("C-c x" . w3m-delete-buffer)))
(global-set-key (kbd "C-x w s") 'w3m-search)


(global-set-key (kbd "C-S-x") 'embark-act)

(global-set-key (kbd "TAB") 'yas/expand)

;; loading tab-line (needed for w3m)
;; (load "~/.emacs.d/tab-line.el")

;; Beacon
(use-package beacon
  :ensure t
  :config (beacon-mode 1))

(if (string-equal system-type "gnu/linux")
    (progn
      (exec-path-from-shell-initialize))
  )

(use-package company-tabnine
  :ensure t
  :config (add-to-list 'company-backends #'company-tabnine))

;; Discord Rich Presense
;; (use-package elcord)
;; (elcord-mode)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; ;;;;;;;; Pomodoro
;; (add-to-list 'org-modules' org-timer)
;; (setq org-timer-default-timer 25)

;; (add-hook 'org-clock-in-hook' (lambda ()
;;                                 (if (not org-timer-current-timer)
;;                                     (org-timer-set-timer '(16)))))

;; (add-hook 'org-clock-out-hook' (lambda ()
;;                                  (setq org-mode-line-string nil)))
;; (add-hook 'org-timer-done-hook' (lambda ()
;;                                   (start-process "orgmode" nil "/usr/bin/notify-send" "Orgmode: Time to take a break")))

(use-package org
  :ensure t
  :config (org-babel-do-load-languages
           'org-babel-load-languages
           '((emacs-lisp . t)
             (dot . t)
             (calc . t)
             (ditaa . t)
             (gnuplot . t)
             (shell . t)
             (ledger . t)
             (org . t)
             (picolisp . t)
             (clojure . t)
             (lilypond . t)
             (plantuml . t)
             (latex . t)
             (typescript . t)
             (js . t)
             (C . t)
             (R . t))))

;; (exwm-init)
;; (require 'exwm-randr)
;; (setq exwm-randr-workspace-output-plist '(0 "HDMI-1" 1 "DP-1-8"  2 "DP-1-8"  3 "DP-1-8" ))
;; (add-hook 'exwm-randr-screen-change-hook
;;           (lambda ()
;;             (start-process-shell-command
;;              "xrandr" nil "--output HDMI-1 --right-of DP-1-8 --auto --output DP-1-8 --auto")))
;; (exwm-randr-enable)

;; (require 'exwm-systemtray)
;; (exwm-systemtray-enable)
;; (exwm-randr-refresh)
;; (exwm-init)
;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)


;; Move current line up/down
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)
;; end Move current line

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org/roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; AH namespace ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-roam-v2-ack t)

(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(defun ah/org-insert-current-time-stamp-inactive ()
  (interactive)
  (org-insert-time-stamp nil t t)
  (insert "  "))

(defun ah/org-insert-current-time-stamp-active ()
  (interactive)
  (org-insert-time-stamp nil)
  (insert "  "))

(use-package org-trello
  :ensure t)

(use-package pomidor
  :ensure t
  :config (setq pomidor-sound-tick nil
                pomidor-sound-tack nil)
  :hook (pomidor-mode . (lambda ()
n                          (display-line-numbers-mode -1) ; Emacs 26.1+
                          (setq left-fringe-width 0 right-fringe-width 0)
                          (setq left-margin-width 2 right-margin-width 0)
                          ;; force fringe update
                          (set-window-buffer nil (current-buffer))))
  :bind (("C-x p p" . pomidor)
         ("C-x p b" . pomidor-break)))

;; ====  Typescript + Deno ====
 (require 'ts-comint)
(add-hook 'typescript-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") 'ts-send-last-sexp)
            (local-set-key (kbd "C-M-x") 'ts-send-last-sexp-and-go)
            (local-set-key (kbd "C-c b") 'ts-send-buffer)
            (local-set-key (kbd "C-c C-b") 'ts-send-buffer-and-go)
            (local-set-key (kbd "C-c l") 'ts-load-file-and-go)))
;; when configuring all repl toggle mapping
(setq rtog/mode-repl-alist '((typescript-mode . run-ts)))
;; or later
(push '(typescript-mode . run-ts) rtog/mode-repl-alist)

(use-package tide :ensure t)
(use-package company :ensure t)
(use-package flycheck :ensure t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript - tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; ====  End Of Typescript ====

;; Put backup files neatly away
(let ((backup-dir "~/.saves/emacs/backups")
      (auto-saves-dir "~/.saves/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too

(setq create-lockfiles nil)

(require 'telega)
(setq telega-use-docker t)
(telega)


