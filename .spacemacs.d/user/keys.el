;; -*- lexical-binding: t; -*-
;; Global keybindings & line-move helpers

(global-set-key (kbd "C-x w s") #'eww)
(global-set-key (kbd "C-S-x") #'embark-act)
(global-set-key (kbd "C-x C-b") #'ibuffer-other-window)

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

(global-set-key [(control shift up)] #'move-line-up)
(global-set-key [(control shift down)] #'move-line-down)
