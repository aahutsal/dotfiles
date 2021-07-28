;; Personal Information
(setq user-full-name "Arsen A. Gutsal"
      user-mail-address "gutsal.arsen@gmail.com"
      calendar-latitude 49.553516
      calendar-longitude -25.594767
      calendar-location-name "Ternopil, Ukraine")

(global-set-key (kbd "C-x w s") 'w3m-search)

;; Beacon
(use-package beacon
  :ensure t
  :config (beacon-mode 1))

(if (string-equal system-type "gnu/linux")
    (progn
      (exec-path-from-shell-initialize))
  )

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (typescript . t)
   (js . t)
   (R . t)))

