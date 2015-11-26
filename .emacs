;; locale coding
(setq locale-coding-system'utf-8)
(prefer-coding-system'utf-8)
(set-keyboard-coding-system'utf-8)
(set-terminal-coding-system'utf-8)
(set-selection-coding-system'utf-8)
(set-clipboard-coding-system 'ctext)
(set-buffer-file-coding-system 'utf-8)

(global-set-key  (kbd "C-x l") 'windmove-left)
(global-set-key  (kbd "C-x r") 'windmove-right)
(global-set-key  (kbd "C-x p") 'windmove-up)
(global-set-key  (kbd "C-x d") 'windmove-down)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(ido-mode t)

(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))


(global-set-key [f5] 'refresh-buffer)
(global-set-key [f6] 'my-compile)
(global-set-key [f7] 'eshell)
(global-set-key [f8] 'open-eshell-other-buffer)
(global-set-key [f9] 'gud_break_remove)
(global-set-key [f12] 'convert-html-angles)

;;set colors
(set-foreground-color "grey")
(set-background-color "black")
(set-cursor-color "grey")
(set-mouse-color "gold1")

;;set line number
(setq column-number-mode t)
(setq line-number-mode t)

;;parentheses settings
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;transient-mark-mode
(setq transient-mark-mode t)

;;compilation settings
(defun my-compile()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))


;;eshell settings
(defun open-eshell-other-buffer()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))


;; Enable EDE (Project Management) features
(global-ede-mode 1)

(setq grep-command "grep --exclude=\"*.svn*\" -nH -e ")
(setq compile-command "g++ -g -o ")

(defun refresh-buffer()
  "revert buffer without comfirmation"
  (interactive) (revert-buffer t t)
)

(defun gud-break-remove ()
  "Set/clear breakpoin."
  (interactive)
  (save-excursion
    (if (eq (car (fringe-bitmaps-at-pos (point))) 'breakpoint)
        (gud-remove nil)
      (gud-break nil))))

(defun convert-html-angles ()
" replaces all < and > to &lt; and &gt; in the region"
  (interactive "*")
  (narrow-to-region  (point) (mark))
    (goto-char (point-min))
    (replace-string "&" "&amp;")
    (goto-char (point-min))
    (replace-string "<" "&lt;")
    (goto-char (point-min))
    (replace-string ">" "&gt;")
 (widen)
)

(setq-default indent-tabs-mode nil)
;; control length used to offset.
(setq-default c-basic-offset 4)
;; control how emacs explain TAB.
(setq-default tab-width 4)
(setq make-backup-files nil)

