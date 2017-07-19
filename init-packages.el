; list the repositories containing them

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

; list the packages you want
(setq package-list '(expand-region color-theme-solarized swiper helm ace-jump-mode company company-jedi undo-tree latex-preview-pane better-defaults smartparens switch-window golden-ratio easy-kill company-auctex elpy ein markdown-mode popwin paradox request websocket))


; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
