;; -*- lexical-binding: t; -*-
;; Dev: copilot, company+tabnine, tramp, lsp, typescript REPL, misc helpers

;; Company + TabNine
(with-eval-after-load 'company
  (setq company-idle-delay 0
        company-show-numbers t
        company-tooltip-align-annotations t)
  (use-package company-tabnine
    :config (add-to-list 'company-backends #'company-tabnine)))

;; Copilot
(use-package copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . copilot-accept-completion)
              ("TAB" . copilot-accept-completion)
              ("C-TAB" . copilot-accept-completion-by-word)
              ("C-<tab>" . copilot-accept-completion-by-word))
  :config
  (require 'project)
  (setq copilot-indent-offset-warning-disable t
        copilot-idle-delay 0.5
        copilot-log-max 1000)
  (add-to-list 'warning-suppress-log-types '(copilot))
  (add-to-list 'warning-suppress-types '(copilot copilot--infer-indentation-offset)))

;; Tramp
(with-eval-after-load 'tramp
  (setq tramp-default-method "ssh"))

;; LSP inlineCompletion capability fix
(with-eval-after-load 'lsp-mode
  (advice-add 'lsp--client-capabilities :filter-return
              (lambda (caps)
                (let ((td (plist-get caps :textDocument)))
                  (when (and td (plist-member td :inlineCompletion)
                             (null (plist-get td :inlineCompletion)))
                    (cl-remf td :inlineCompletion)
                    (plist-put caps :textDocument td)))
                caps)))

;; ====  Typescript + Deno ====
;; (require 'ts-comint)
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

(defun round-floats-to-3-digits (beg end)
  "Round all floats in region (or buffer) to 3 digits after the decimal point."
  (interactive "r")
  (unless (use-region-p)
    (setq beg (point-min)
          end (point-max)))
  (save-excursion
    (goto-char beg)
    (while (re-search-forward "\\([0-9]+\\.[0-9]+\\)" end t)
      (let* ((orig (match-string 1))
             (num (string-to-number orig))
             (rounded (format "%.3f" (/ (round (* num 1000.0)) 1000.0))))
        (replace-match rounded)))))
