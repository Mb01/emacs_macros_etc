;; ensure packages are installed


; list the packages you want
(setq package-list '())

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

;; (elpy-enable) ;; you may need stuff like this

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(defun fullscreen ()
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			      '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(defun fullscreen2 (&optional f)
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
             '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
             '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(rcirc-track-minor-mode 1); get irc notices

(fullscreen); make screen big

(tool-bar-mode -1); no toolbar
(menu-bar-mode -1); no menu bar

(show-paren-mode 1); show parens

;; I was told to do this??
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; this stopped working 
;; (eval-after-load 'racket-mode
;;  (define-key racket-mode-map (kbd "C-c l") 'racket-insert-lambda))

;; you like racket?

;;(global-set-key (kbd "C-c l") 'racket-insert-lambda)
;;(put 'dired-find-alternate-file 'disabled nil)

;; for example
;; (set-frame-font "Inconsolata-12")

;; things I like for translating
(global-set-key (kbd "C-c f") 'font-lock-fontify-buffer)
(global-set-key (kbd "C-c C-f") 'font-lock-mode)
(global-set-key (kbd "C-c p") 'hi-lock-face-phrase)

(global-set-key (kbd "C-c o") 'other-frame)

;; (setq-default cursor-type 'bar) ;; not a fan


;; macros:
;; do you translate similar things on multiple screens?
;; then you want this
(fset 'copy-other-frame
      [nil ?\M-w ?\C-x kp-5 ?o ?\C-y])
(global-set-key (kbd "C-c w") 'copy-other-frame)

;; invaluable for text, have other window open
(fset 'search-other-window
   "\367\C-xo\C-s\C-y")
(global-set-key (kbd "C-c s") 'search-other-window)

(provide 'init)
