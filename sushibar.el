(defvar sushibar:images
  (list
   (create-image "~/misc/sushibar/akami.png")
   (create-image "~/misc/sushibar/ebi.png")
   (create-image "~/misc/sushibar/tai.png")
   (create-image "~/misc/sushibar/tamago.png")))

(defun sushibar:push()
    (setq mode-line-format
          (append
           mode-line-format
           (list
            (list
             (make-string 2 ? )
             (propertize " " 'display (nth (random (length sushibar:images)) sushibar:images)))))))

(defun sushibar:pop()
    (setq mode-line-format
          (cdr mode-line-format)))

(defun sushibar:setup()
  (interactive)
  (setq mode-line-format '())
  (dotimes (i (window-body-width))
    (sushibar:push))
  (setq sushibar:timer
        (run-at-time t 1
                     (lambda()
                       (sushibar:push)
                       (sushibar:pop)
                       (force-mode-line-update)))))
