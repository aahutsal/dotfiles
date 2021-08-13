;; Personal Information
(setq user-full-name "Arsen A. Gutsal"
      user-mail-address "gutsal.arsen@gmail.com"
      calendar-latitude 49.553516
      calendar-longitude -25.594767
      calendar-location-name "Ternopil, Ukraine")

;; decreasing mode-line font size
(set-face-attribute 'mode-line nil  :height 80)

;; setting 'w3m-search keybindings
(global-set-key (kbd "C-x w s") 'w3m-search)

;; loading tab-line (needed for w3m)
(load "~/.emacs.d/tab-line.el")

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
           '((emacs-lisp . nil)
             (typescript . t)
             (js . t)
             (R . t))))
