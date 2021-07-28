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

(use-package company-tabnine
  :ensure t
  :config (add-to-list 'company-backends #'company-tabnine))

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)
