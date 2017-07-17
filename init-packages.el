; list the repositories containing them

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
; list the packages you want
(setq package-list '(expand-region ein color-theme-solarized swiper helm ace-jump-mode company undo-tree latex-preview-pane better-defaults smartparens switch-window golden-ratio popwin paradox request websocket easy-kill company-auctex elpy markdown-preview-eww markdown-mode))


; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
