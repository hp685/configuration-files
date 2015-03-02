
; Custom settings
; Author: harshp

;;; Code:
(setq-default default-truncate-lines t
	      ;version-control t
	      font-lock-maximum-decoration t
	      show-trailing-whitespace t
	      user-full-name "Harsh Patel"
	      column-number-mode t
	      line-number-mode t
	      fill-column 80
	      flyspell-prog-mode t
	      )

; flymake for python
(add-to-list 'load-path "~/.emacs.d/elpa/flymake-python-pyflakes-20131127.6/")
(add-to-list 'load-path "~/.emacs.d/elpa/flymake-easy-20140818.55/")
(require 'flymake)
(require 'flymake-python-pyflakes)

(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
                (list "epylint" (list local-file)))))

;flycheck
(add-to-list 'load-path "~/.emacs.d/elpa/flycheck-20150207.329/")
(add-hook 'after-init-hook #'global-flycheck-mode)


;;autocomplete
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150201.150/dict/")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150201.150/")
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20150116.1223/")
(require 'popup)
(require 'auto-complete-config)
(add-to-list 'ac-modes 'python-mode)
(global-auto-complete-mode t)
;; (defun auto-complete-mode-maybe ()
;;   "No maybe for you. Only AC!"
;;   (unless (minibufferp (current-buffer))
;;     (auto-complete-mode 1)))

;;jedi for python
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)

; Load themes
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/themes/")


;
(require 'color-theme)
(color-theme-initialize)

;eval
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-monokai)))


; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("marmalade" . "http://marmalade-repo.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150201.150/")
;(require 'auto-complete)

;(add-to-list 'python-mode)

; enable packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
