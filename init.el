;; package --- Summary
;;; Commentary:

;;; Code:
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (require 'use-package nil t)
  (package-refresh-contents)
  (package-install 'use-package))

(setq inhibit-startup-screen t)
(set-default 'truncate-lines t)

(add-to-list 'default-frame-alist '(font . "Hack 12"))

;; IDO plugin
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(defvar ido-vitrual-buffers    t)
(setq ido-enable-flex-matching t)

;; Linum plugin
(require 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк

(show-paren-mode 1)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)

;; Delete selection
(delete-selection-mode t)
;;clipboard
(setq select-enable-clipboard t)
;; Electric-modes settings
(electric-pair-mode 1)
(electric-quote-mode 1)

;; Disable GUI components
(tooltip-mode      -1)
(menu-bar-mode     -1) ;; отключаем графическое меню
(tool-bar-mode     -1) ;; отключаем tool-bar
(scroll-bar-mode   -1) ;; отключаем полосу прокрутки
(blink-cursor-mode -1) ;; курсор не мигает
(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

;; Scroll
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

;; Disable backup/autosave files
(setq make-backup-files        nil)
(setq auto-save-default        nil)

(use-package gruvbox-theme
  :ensure t
  :defer t
  :init
  (if (daemonp)
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (select-frame frame)
                  (load-theme 'gruvbox t)))
    (load-theme 'gruvbox t)))

(use-package haskell-mode
  :ensure t
  :defer t)

(use-package geiser
  :ensure t
  :defer t
  :init (defvar geiser-active-implementations '(guile)))

(use-package cider
  :ensure t
  :defer t)

(use-package elpy
  :ensure t
  :defer t
  :init (elpy-enable))

(use-package go-mode
  :ensure t
  :defer t)

(use-package flycheck
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-flycheck-mode))

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :bind ("C-;" . company-complete))

(use-package company-go
  :ensure t
  :defer t
  :init (setq company-backends (cons 'company-go company-backends)))

(use-package neotree
  :ensure t
  :defer t
  :bind ([f8] . neotree-toggle)
  :init
  (progn (setq neo-theme 'nerd)
         (add-hook 'neotree-mode-hook
                   (lambda () (with-current-buffer " *NeoTree*"
                                (setq-local linum-mode nil))))))

(use-package multiple-cursors
  :ensure t
  :defer t)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-mode company-anaconda anaconda-mode use-package neotree multiple-cursors haskell-mode gruvbox-theme geiser font-lock+ flycheck elpy company-go cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
