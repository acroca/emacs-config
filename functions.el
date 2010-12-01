(defun fullscreen (&optional f)
  (interactive)
  (if (frame-parameter f 'fullscreen)
      (menu-bar-mode 1)
      (menu-bar-mode -1))
  (set-frame-parameter f 'fullscreen
                       (if (frame-parameter f 'fullscreen) nil 'fullboth)))

(provide 'functions)


