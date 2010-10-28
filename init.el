
(setq dotfiles-dir (file-name-directory (or load-file-name (buffer-file-name))))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (expand-file-name
                         "anything-config" dotfiles-dir))
(add-to-list 'load-path (expand-file-name
                         "color-theme-arjen" dotfiles-dir))
(add-to-list 'load-path (expand-file-name
                         "yaml-mode" dotfiles-dir))
(add-to-list 'load-path (expand-file-name
                         "rinari" dotfiles-dir))
(add-to-list 'load-path (expand-file-name
                         "rhtml" dotfiles-dir))
(add-to-list 'load-path (expand-file-name
                         "haml-mode" dotfiles-dir))
(add-to-list 'load-path (expand-file-name
                         "sass-mode" dotfiles-dir))
(add-to-list 'load-path (expand-file-name
                         "js2-mode" dotfiles-dir))
(require 'functions)

;; ELPA



(server-start)

;; Block file's auto-save and file's backup.
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Make all "yes or no" prompts show "y or n" instead.
(fset 'yes-or-no-p 'y-or-n-p)

;; Remove menu and scroll
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq scroll-step 1)
(show-paren-mode 1)

;; I hate tabs!
(setq-default indent-tabs-mode nil)


(custom-set-variables
 ;; Don't show the startup screen
 '(inhibit-startup-screen t)
 ;; Mouse wheel should scroll slower
 '(mouse-wheel-progressive-speed nil)
 ;; Better indentation for parens
 '(ruby-deep-indent-paren nil))
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 77 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


;; COLOR-THEME
(require 'color-theme-arjen)
(color-theme-arjen)



;; Anything plugin
(require 'anything)
(require 'anything-config)
(require 'rails-source-anything)
(setq anything-sources
      (list anything-c-source-buffers
            anything-c-source-file-name-history
            anything-c-source-rails
            ))

;; IDO plugin
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point t
        ido-max-prospects 10)




; KEY BINDINGS

; replace-string key
(global-set-key (kbd "M-r") 'replace-string)

; comment and uncomment region key
(global-set-key (kbd "M-C") 'comment-region)
(global-set-key (kbd "C-c M-C") 'uncomment-region)

; fullscreen
(global-set-key [f11] 'fullscreen)

; anything
(global-set-key (kbd "M-X") 'anything)


;; RUBY MODE
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(eval-after-load 'ruby-mode
  '(progn
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

;; RAILS MODE
(require 'rinari)

;; YAML MODE
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;; ERB MODE
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

;; HAML & SASS MODES
(require 'haml-mode)
(require 'sass-mode)

;; JS MODE
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))


;; OTHER MODES
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
;; (add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))
