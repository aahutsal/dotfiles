;; -*- lexical-binding: t; -*-
;; Conda 'rg' environment: PATH, python, pylsp
(let* ((rg-prefix "/home/archer/anaconda3/envs/rg")
       (rg-bin (file-name-concat rg-prefix "bin")))
  (setq exec-path (cons rg-bin (delete rg-bin exec-path)))
  (setenv "PATH" (concat rg-bin path-separator (getenv "PATH")))
  (setenv "CONDA_DEFAULT_ENV" "rg")
  (setenv "CONDA_PREFIX" rg-prefix)
  (setq python-shell-interpreter (file-name-concat rg-bin "python")
        lsp-pylsp-server-command (list (file-name-concat rg-bin "pylsp"))))

(setq lsp-modeline-diagnostics-enable nil)

;; Shell PATH
(when (memq window-system '(mac ns x pgtk))
  (exec-path-from-shell-initialize))
