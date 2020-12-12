;; Enable MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; disable toolbar
(tool-bar-mode -1)

;; use the system wide shell
(exec-path-from-shell-initialize)

;; Theme
;; (use-package tron-legacy-theme
;;   :config
;;   (setq tron-legacy-theme-vivid-cursor t)
;;   (setq tron-legacy-theme-softer-bg t)
;;    (load-theme 'tron-legacy t))

;; 
;; (setq tron-legacy-theme-dark-fg-bright-comments t) 
;; 
  
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
(load-theme 'solarized-dark t)

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
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(custom-set-variables

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit zenburn-theme use-package tron-legacy-theme spacemacs-theme solarized-theme smartparens pos-tip poet-theme org-bullets org nord-theme monokai-theme monokai-pro-theme leuven-theme kaolin-themes htmlize gotham-theme focus exec-path-from-shell ess dracula-theme doom-themes cyberpunk-theme company color-theme-sanityinc-tomorrow clues-theme berrys-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
