;; -*- lexical-binding: t; -*-
;; Org: timers, babel languages, pomidor, timestamp helpers

(setq org-timer-default-timer 25)

(add-hook 'org-clock-in-hook
          (lambda ()
            (unless org-timer-current-timer
              (org-timer-set-timer '(16)))))

(add-hook 'org-clock-out-hook
          (lambda ()
            (setq org-mode-line-string nil)))

(add-hook 'org-timer-done-hook
          (lambda ()
            (start-process "orgmode" nil "/usr/bin/notify-send"
                           "Orgmode: Time to take a break")))

(with-eval-after-load 'org
  (org-babel-do-load-languages
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
     (js . t)
     (C . t)
     (R . t))))

(defun ah/org-insert-current-time-stamp-inactive ()
  (interactive)
  (org-insert-time-stamp nil t t)
  (insert "  "))

(defun ah/org-insert-current-time-stamp-active ()
  (interactive)
  (org-insert-time-stamp nil)
  (insert "  "))

(use-package pomidor
  :config
  (setq pomidor-sound-tick nil
        pomidor-sound-tack nil)
  :hook (pomidor-mode . (lambda ()
                          (display-line-numbers-mode -1)
                          (setq left-fringe-width 0 right-fringe-width 0
                                left-margin-width 2 right-margin-width 0)
                          (set-window-buffer nil (current-buffer))))
  :bind (("C-x p p" . pomidor)
         ("C-x p b" . pomidor-break)))
