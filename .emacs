(require 'package) ;; You might already have this line

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (exec-path-from-shell company-jedi elpy expand-region ein color-theme-solarized solarized-theme easy-kill websocket request paradox popwin helm golden-ratio switch-window smartparens better-defaults latex-preview-pane undo-tree company persistent-soft ace-jump-mode markdown-mode markdown-preview-eww swiper)))
 '(paradox-automatically-star t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-input-face ((t (:foreground "antique white"))))
 '(helm-selection ((t (:background "ForestGreen" :foreground "black"))))
 '(org-agenda-clocking ((t (:inherit secondary-selection :foreground "black"))) t)
 '(org-agenda-done ((t (:foreground "dim gray" :strike-through nil))))
 '(org-clock-overlay ((t (:background "SkyBlue4" :foreground "black"))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t))))
 '(outline-1 ((t (:inherit font-lock-function-name-face :foreground "cornflower blue")))))
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings ))

(require 'ido)
    (ido-mode t)

(global-set-key [remap kill-ring-save] 'easy-kill)

(require 'ein)

(setq paradox-github-token "f40332426ca087839d5a906f09084c1f611b86aa")

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)

;; using ipython as the Python shell
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")
(global-set-key (kbd "C-x g") 'magit-status)

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-o") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-n") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(scroll-bar-mode -1)
(show-paren-mode 1)

;; config for golden-ratio
(require 'golden-ratio)
(golden-ratio-mode 1)

;; make cursor movement keys under right hand's home-row.
(global-set-key (kbd "M-j") 'backward-char) ; was indent-new-comment-line
(global-set-key (kbd "M-l") 'forward-char)  ; was downcase-word
(global-set-key (kbd "M-i") 'previous-line) ; was tab-to-tab-stop
(global-set-key (kbd "M-k") 'next-line) ; was kill-sentence
(global-set-key (kbd "M-a") 'move-beginning-of-line) ; was kill-sentence
(global-set-key (kbd "M-e") 'move-end-of-line) ; was kill-sentence
;(global-set-key (kbd "M-SPC") 'set-mark-command) ; was just-one-space

;; easy keys to split window. Key based on ErgoEmacs keybinding
;(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
;(global-set-key (kbd "M-4") 'split-window-below) ; split pane top/bottom
;(global-set-key (kbd "M-2") 'delete-window) ; close current pane


;;config for switch-window
(global-set-key (kbd "M-0") 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(add-hook 'buffer-list-update-hook #'golden-ratio)
(add-hook 'focus-in-hook #'golden-ratio)
(add-hook 'focus-out-hook #'golden-ratio)

;; config for undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "M-s") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode-pop-mark)

;; config for AUCTeX
(setq TeX-parse-self t)
(setq TeX-auto-save t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; config for company Math
;; global activation of the unicode symbol completion 
;;(add-to-list 'company-backends 'company-math-symbols-unicode)
;;(add-hook 'TeX-mode-hook 'my-latex-mode-setup)

;; replace backend of jedi
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;; config for company-auctex
(company-auctex-init)

;; config for lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; set the meta key to be the mac key
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)
;; set font size
(set-face-attribute 'default nil :height 130)
;; elpy
(elpy-enable)
;; disable C-return in elpy
(define-key elpy-mode-map (kbd "C-<return>") nil)
;; exec from the path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(set-face-attribute 'region nil :background "#666" :foreground "#69CABF")
(set-face-attribute 'secondary-selection nil :background "#666" :foreground "#69CABF")

;; remove menu bar and task bar
(tool-bar-mode -1)
(menu-bar-mode -1) 
