;; Enable MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; disable toolbar
(tool-bar-mode -1)

;; use the system wide shell
(exec-path-from-shell-initialize)

;; disable annoying bell function
(setq ring-bell-function 'ignore)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; Org-Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-log-done 'time) ; log time when a task is completed

; disable org-mode asking to evaluate code
(setq org-confirm-babel-evaluate nil)

; enable bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

; enable babel for R
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)))

;; set up org agenda
(setq org-agenda-files (list "~/Tresorit/chris/org/work.org"
                             "~/Tresorit/chris/org/st120.org" 
                             "~/Tresorit/chris/org/st140.org" 
                             "~/Tresorit/chris/org/js304.org"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; enable aspell
(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.8/bin/aspell")

;; set font
(set-frame-font "Monaco 12")

;; enable paranthesis matching
(show-paren-mode 1)

;; company mode
(require 'company)
(setq company-selection-wrap-around t
      company-tooltip-align-annotations t
      company-idle-delay 0.36
      company-minimum-prefix-length 2
      company-tooltip-limit 10)
(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "M-h") 'company-show-doc-buffer)

;; disable welcome screen
(setq inhibit-startup-screen t)

;; highlight current line
 (global-hl-line-mode 1)

;; line wrap
(global-visual-line-mode t)



;; enable recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; For LaTeX, to remove the default width=.9\linewidth, set the org-latex-image-default-width to empty string. By this way, the image will have its natural size.
;; To do that on the fly use the set-variable emacs command. Or to set this variable permanently, add the following line in your init.el : (setq org-latex-image-default-width "")
(setq org-latex-image-default-width "")

;; disable scroll bars
(scroll-bar-mode -1)

;; smart parentheses
(require 'smartparens-config)

;; Always start smartparens mode in ess-mode.
(add-hook 'ess-mode-hook #'smartparens-mode)

;;;;;;;;;;;;;;;;;;;;;;;
;; theming
:::::::::::::::::::::::
(load-theme 'solarized-light t)

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use more italics
(setq solarized-use-more-italic t)
(require 'color)
(set-face-attribute 'org-block nil :background
                    (color-darken-name
                     (face-attribute 'default :background) 6))

;; dark window borders on os x
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

;; only need this if I want a dark theme
;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

;; enable polymode for R
(require 'poly-R)

;; enable ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
