;; -*- lexical-binding: t; -*-
;; Ensure eww is loaded
(require 'eww)

;; Set default search engine for eww
(setq eww-search-prefix "https://www.google.com/search?q=")
(add-to-list 'eww-search-prefixes '("so" . "https://stackoverflow.com/search?q=")))

;; Custom keybindings for eww
(with-eval-after-load 'eww
  (define-key eww-mode-map (kbd "q") 'quit-window)         ;; Quit eww buffer
  (define-key eww-mode-map (kbd "n") 'eww-next-url)        ;; Next link
  (define-key eww-mode-map (kbd "p") 'eww-previous-url)    ;; Previous link
  (define-key eww-mode-map (kbd "r") 'eww-reload)          ;; Reload the current page
  (define-key eww-mode-map (kbd "s") 'eww-search)          ;; Search with default search engine
  (define-key eww-mode-map (kbd "g") 'eww-goto-url))       ;; Go to a specific URL

;; Optional: Set default text size
(setq eww-text-scale-increase 1)

;; Optional: Add a custom search engine
(defun my-eww-setup ()
  "Setup custom search engines for `eww`."
  (add-to-list 'eww-search-prefixes '("so" . "https://stackoverflow.com/search?q=")))
(add-hook 'eww-mode-hook 'my-eww-setup)
