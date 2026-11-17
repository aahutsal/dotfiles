;; -*- lexical-binding: t; -*-
;; EWW: search engine, keybindings

(with-eval-after-load 'eww
  (setq eww-search-prefix "https://www.google.com/search?q="
        eww-text-scale-increase 1)
  (define-key eww-mode-map (kbd "q") 'quit-window)
  (define-key eww-mode-map (kbd "n") 'eww-next-url)
  (define-key eww-mode-map (kbd "p") 'eww-previous-url)
  (define-key eww-mode-map (kbd "r") 'eww-reload)
  (define-key eww-mode-map (kbd "s") 'eww-search)
  (define-key eww-mode-map (kbd "g") 'eww-goto-url))
