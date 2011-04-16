;; emacs window position
(setq initial-frame-alist
     '((left . 0) (top . 16)
       (width . 100) (height . 42)))
(tool-bar-mode 0)


;; get copy and paste to the clipboard
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)


;; set load dirs and global config options
(add-to-list 'load-path "~/.elisp/site-lisp/")
(add-to-list 'load-path "~/.elisp/org.git/contrib/lisp/")


;; org-article
(require 'org-latex)
(setq org-export-latex-listings t)
(add-to-list 'org-export-latex-classes
             '("org-article"
               "\\documentclass{org-article}
                 [NO-DEFAULT-PACKAGES]
                 [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;; sunrise-commander
(require 'sunrise-commander)
;;(require 'sunrise-x-buttons)
(require 'sunrise-x-tree)
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(require 'openwith)
(openwith-mode t)


(setq make-backup-files nil)
(setq-default fill-column 85)
(add-hook 'text-mode-hook 'turn-on-auto-fill)


;; setup org
(require 'org-install)
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-hide-leading-stars t)
(setq org-blank-before-new-entry nil)


;; todos
(setq org-log-into-drawer t)
(setq org-todo-state-tags-triggers
      (quote (("TODO" ("noexport" . t)))))


;; capture
(setq org-default-notes-file (concat org-directory "~/org/2011-02Feb.org" "Tracking"))
(global-set-key "\C-cc" 'org-capture)
(setq org-capture-templates
  '(("t" "todo" entry (file+headline "~/org/2011-02Feb.org" "Tracking")
             "** TODO %u %?\n")))
(define-key global-map "\C-c c"
   (lambda () (interactive) (org-capture "t")))


;; misc org things
;;(require 'org-taskjuggler)
(require 'org-contacts)
(setq org-contacts-files '("/home/jwhendy/org/aux/contacts.org"))


;; setup babel
(setq org-ditaa-jar-path "/home/jwhendy/.elisp/org.git/contrib/scripts/ditaa.jar")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (latex . t)
   (gnuplot . t)
   (python .t )))


;; gpg integration
(require 'epa-file)
(epa-file-enable)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(openwith-associations (quote (("\\.pdf\\'" "evince" (file)) ("\\.mp3\\'" "vlc" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mov\\)\\'" "vlc" ("-idx" file)) ("\\.\\(?:jp?g\\|png\\)\\'" "geeqie" (file)) ("\\.\\(?:odg\\|odt\\|docx\\|doc\\)\\'" "soffice" (file)) ("\\.\\(?:odp\\|ppt\\|pptx\\)\\'" "soffice" (file)) ("\\.\\(?:xls\\|xlsx\\|ods\\)\\'" "soffice" (file)))))
 '(openwith-mode t)
 '(org-agenda-files (quote ("~/org/2011-02Feb.org" "~/org/2011-01Jan.org" "~/org/aux/contacts.org" "~/org/oddsEnds.org" "~/org/archive-2010/2010-12Dec.org" "~/org/archive-2010/2010-10Oct.org" "~/org/archive-2010/2010-09Sep.org" "~/org/archive-2010/2010-08Aug.org" "~/org/archive-2010/2010-07Jul.org" "~/org/archive-2010/2010-06Jun.org" "~/org/archive-2010/2010-05May.org" "~/org/archive-2010/2010-04Apr.org" "~/org/archive-2010/2010-03Mar.org" "~/org/archive-2010/2010-02Feb.org" "~/org/archive-2010/2010-01Jan.org")))
 '(sr-history-length 20)
 '(sr-listing-switches "-al")
 '(sr-show-file-attributes nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
