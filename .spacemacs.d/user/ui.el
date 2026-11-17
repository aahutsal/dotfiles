;; -*- lexical-binding: t; -*-
;; UI & files: beacon, indentation, backups/auto-saves

(use-package beacon
  :config (beacon-mode 1))

;; Backups and Auto-saves
(let ((backup-dir "~/.saves/emacs/backups")
      (auto-saves-dir "~/.saves/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (unless (file-directory-p dir)
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t
      delete-old-versions t
      version-control t
      kept-new-versions 5
      kept-old-versions 2
      create-lockfiles nil)

;; Indentation defaults
(setq-default indent-tabs-mode nil
              tab-width 8)
