(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; Org-Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-log-done 'time) ; log time when a task is completed

;; make org-mode to export to odt to docx
(setq org-odt-preferred-output-format "docx")

;; change scaling of headers
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(org-block ((t (:background "#434c5e"))))
 ;'(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 ;'(org-level-2 ((t (:inherit outline-2 :height 1.4))))
 ;'(org-level-3 ((t (:inherit outline-3 :height 1.3))))
 ;'(org-level-4 ((t (:inherit outline-4 :height 1.2))))
 ;'(org-level-5 ((t (:inherit outline-5 :height 1.1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; For LaTeX, to remove the default width=.9\linewidth, set the org-latex-image-default-width to empty string. By this way, the image will have its natural size.
;; To do that on the fly use the set-variable emacs command. Or to set this variable permanently, add the following line in your init.el : (setq org-latex-image-default-width "")
(setq org-latex-image-default-width "")

;; enable aspell
(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.8/bin/aspell")

;; company mode
(require 'company)
(setq company-selection-wrap-around t
      company-tooltip-align-annotations t
      company-idle-delay 0.36
      company-minimum-prefix-length 2
      company-tooltip-limit 10)
(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "M-h") 'company-show-doc-buffer)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flx counsel zenburn-theme vterm use-package tron-legacy-theme spacemacs-theme solarized-theme smartparens rainbow-delimiters poly-R poet-theme org-bullets org nordless-theme nord-theme monokai-theme monokai-pro-theme modus-themes magit lsp-ui lsp-julia leuven-theme kaolin-themes julia-repl htmlize horizon-theme helm gruvbox-theme gotham-theme focus flycheck exec-path-from-shell ess dracula-theme doom-themes doom-modeline cyberpunk-theme cyberpunk-2019-theme company-quickhelp color-theme-sanityinc-tomorrow clues-theme berrys-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
