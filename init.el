(setq inhibit-startup-screen t)

(setq ring-bell-function 'ignore)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-hl-line-mode 0)

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono-15"))

(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

(show-paren-mode 1)

(require 'smartparens-config)

(add-hook 'ess-mode-hook #'smartparens-mode)

(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)
         (org-mode . rainbow-delimiters-mode)
         (ess-mode . rainbow-delimiters-mode)))

;; Remove Flymake support:
(setq ess-use-flymake nil)
;; Replace it (globally) by Flycheck:
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;;; For packaged versions which must use `require':
(use-package modus-themes
  :ensure
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs t 
	modus-themes-region '(bg-only no-extend)
	modus-themes-mode-line '(accented borderless 4 1)
	modus-themes-syntax '(yellow-comments)
	modus-themes-subtle-line-numbers t
	modus-themes-markup '(intense background)
	modus-themes-paren-match '(intense)
	modus-themes-region '(accented)
	modus-themes-hl-line '(intense)
        modus-themes-org-blocks 'tinted-background
	modus-themes-links '(bold italic background))

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-vivendi) ;; OR (modus-themes-load-vivendi)
  :bind ("<f5>" . modus-themes-toggle))
;; (load-theme 'solarized-selenized-dark t)

;;   (require 'color)
;;  (set-face-attribute 'org-block nil :background
;;		      (color-lighten-name
;;		       (face-attribute 'default :background) 50))
;;  (set-face-background 'org-block-begin-line (color-lighten-name
;;						(face-attribute 'default :background) 10))
;;
;;  (set-face-background 'org-block-end-line (color-lighten-name
;;					      (face-attribute 'default :background) 10))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(org-babel-do-load-languages
'org-babel-load-languages
'((R . t)))

(setq org-confirm-babel-evaluate nil)

(setq org-log-done 'time)

(setq org-odt-preferred-output-format "docx")

(require 'poly-R)

;; Font lock keywords for syntactic highlighting:
(setq ess-R-font-lock-keywords
      '((ess-R-fl-keyword:keywords . t)
	(ess-R-fl-keyword:constants . t)
	(ess-R-fl-keyword:modifiers . t)
	(ess-R-fl-keyword:fun-defs . t)
	(ess-R-fl-keyword:assign-ops . t)
	(ess-R-fl-keyword:%op% . t)
	(ess-fl-keyword:fun-calls . t)
	(ess-fl-keyword:numbers . t)
	(ess-fl-keyword:operators . t)
	(ess-fl-keyword:delimiters . t)
	(ess-fl-keyword:=)
	(ess-R-fl-keyword:F&T . t)))

;; For LaTeX, to remove the default width=.9\linewidth, set the org-latex-image-default-width to empty string. By this way, the image will have its natural size.
;; To do that on the fly use the set-variable emacs command. Or to set this variable permanently, add the following line in your init.el : (setq org-latex-image-default-width "")
(setq org-latex-image-default-width "")

(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.8/bin/aspell")

(with-eval-after-load 'ess
(cl-pushnew "|>" ess-R-assign-ops :test 'string=))

(exec-path-from-shell-initialize)

;; (use-package lsp-mode			;
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;; 		    (ess-r-mode . lsp)
;; 		    ;; if you want which-key integration
;; 		    (lsp-mode . lsp-enable-which-key-integration)
;; 		    )
;;   :commands lsp)

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; ;; if you are helm user
;; ;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; ;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ;; optionally if you want to use debugger
;; ;;(use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; ;; optional if you want which-key integration
;; ;;(use-package which-key
;; ;;    :config
;; ;;    (which-key-mode))
;; (with-eval-after-load 'lsp-mode  (lsp-register-client (make-lsp-client 
;; 						       :new-connection (lsp-stdio-connection '("R" "--slave" "-e" "languageserver::run()"))
;; 						       :major-modes '(ess-r-mode inferior-ess-r-mode)                    :server-id 'lsp-R)))

(use-package ivy
  :init
  ;;(ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  :bind (("C-s" . swiper)
  ("C-c C-r" . ivy-resume)
  ("<f6>" . ivy-resume)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> o" . counsel-describe-symbol)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("C-c g" . counsel-git)
  ("C-c j" . counsel-git-grep)
  ("C-c k" . counsel-ag)
  ("C-x l" . counsel-locate)
  :map minibuffer-local-map
  ("C-r" . counsel-minibuffer-history))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package evil
  :init (setq evil-want-C-i-jump nil) ;; disable C-i and restore TAB functionality
  :config
  (evil-mode 1))

(mac-auto-operator-composition-mode)

(use-package company
  :bind (:map company-active-map
	 ("C-n" . company-select-next)
	 ("C-p" . company-select-previous)
	 ("M-h" . company-show-doc-buffer))
  :config
  (setq company-idle-delay 0.3)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-limit 10)
  :hook
   (after-init . global-company-mode))
