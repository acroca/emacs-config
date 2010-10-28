(defvar cur-buffer-filename nil
  "The current buffer file name")

(defvar anything-c-source-rails
  '((name . "Rails project")
    (init . (lambda ()
              (let ((fn (buffer-file-name)))
                 (setq cur-buffer-filename fn))))
    (candidates . (lambda ()
                    (split-string 
                     (shell-command-to-string (concat "~/bin/ff " cur-buffer-filename " " anything-pattern))
                     "\n")))
    (type . file)
    (match (lambda (candidate) t))
    (requires-pattern . 2)
    (volatile)
    (delayed)
    ))

(provide 'rails-source-anything)