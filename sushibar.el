(defcustom sushibar:speed 2 "speed of sushi")
(defcustom sushibar:distance 8 "distance from next sushi")
(defun sushibar:string()
  (let ((pos (-
              (- sushibar:distance 1)
              (% (truncate (* (float-time) sushibar:speed)) sushibar:distance))))
    (concat
     (make-string pos ? )
     (apply 'concat (make-list
                     (ceiling (/ (window-body-width) sushibar:distance))
                     (concat "🍣" (make-string (- sushibar:distance 1) ? )))))))
(defun sushibar:setup()
  (interactive)
  (setq mode-line-format '((:eval (sushibar:string))))
  (setq sushibar:timer
        (run-at-time t 1 'force-mode-line-update)))
