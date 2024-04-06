(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-list
  '(good-scroll company-box company gruber-darker))

; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" "27eb4bbd908683d344af2a0b90d71698938ab9af1656b1aed87e68258ef8c980" default))
 '(package-selected-packages
   '(avk-emacs-themes tommyh-theme good-scroll company-box company gruber-darker)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun font-available-p (font-name)
  (find-font (font-spec :name font-name)))

(defun dark-mode () (interactive) (disable-theme 'tommyh) (load-theme 'gruber-darker))
(defun light-mode () (interactive) (disable-theme 'gruber-darker) (load-theme 'tommyh))

(defun select-font ()
  (cond
    ((font-available-p "SF Mono") "SF Mono-14")
    ((font-available-p "Fira Code Nerd Font") "Fira Code Nerd Font-14")
    (cond ((eq system-type 'windows-nt) "Consolas-14") ("Monospace-14"))
))

(add-to-list 'default-frame-alist `(font . , (select-font)))
(setq inhibit-startup-message t) ;; No splash scren.
(menu-bar-mode 1) ;; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(setq ring-bell-function 'ignore)
(cua-mode t)
(setq auto-save-default nil)
(electric-pair-mode t)
(electric-indent-mode t)
 (add-hook 'lisp-mode-hook '(lambda ()
   (local-set-key (kbd "RET") 'newline-and-indent)))
(setq c-syntactic-indentation nil)
(setq scroll-conservatively 1)

(light-mode)
;; (set-face-background 'mode-line "black")
;; (set-face-attribute 'mode-line nil
;;                 :box '(:line-width 3 :color "black"))
(setq-default mode-line-format
  '("%e "
    "%b%&  "
    "%m  "
    "%l  "))
;; Display line numbers in every buffer
;; (set-fringe-mode '(0 . nil))
;; (global-display-line-numbers-mode 1)

(setq-default cursor-type 'bar)
(setq-default left-margin-width 1 right-margin-width 1)
(setq-default hscroll-mode nil)

(add-hook 'after-init-hook 'global-company-mode)
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(global-set-key [next] #'good-scroll-up-full-screen)
(global-set-key [prior] #'good-scroll-down-full-screen)
(good-scroll-mode 1)
