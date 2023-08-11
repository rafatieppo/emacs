;;=============================================================================
;; init.el file for EMACS (26) by Rafael Tieppo.
;; Most of all from this content was from internet. Feel free to copy and share.
;; Any question, please, you can open a issue in this repo
;;=============================================================================

;;===========================================================================
;;TO INSTALL FROM MELPA
;;===========================================================================
;;-----------------------------------------------------------------------------
  
;(add-to-list 'load-path "/home/rafatieppo/.emacs.d/")
;(load "package")
;(require 'package)
;(package-initialize) 

;;===========================================================================
;;EMACS auto install packs GREAT - active only in the first session
;;===========================================================================
;company-tern
;; list the packages you want
(setq package-list '(ace-jump-mode ac-math anaconda-mode auto-complete calfw calfw-org calfw-ical company-anaconda company-irony company-jedi company-quickhelp  elpy ess ess-R-data-view flx flx-ido flycheck highlight-symbol ido-hacks ido-vertical-mode indent-guide jedi markdown-mode js2-mode multiple-cursors neotree polymode popup powerline py-autopep8 smartparens smex yafolding yasnippet web-mode))
;; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ))

;; activate all the packages (in particular autoloads)
(package-initialize)
;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;-----------------------------------------------------------------------------

;;===========================================================================
;;ORG MODE
;;===========================================================================
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; files for org agendasorg-agenda
(setq org-agenda-files (list "/home/rafatieppo/Dropbox/emacs_org_mode/rafa.org"
                             "/home/rafatieppo/Dropbox/profissional/projetos_extensao/all_extens_proj_manag.org"
                             "/home/rafatieppo/Dropbox/profissional/projetos_pessoais/all_person_proj_manag.org"
                             "/home/rafatieppo/Dropbox/profissional/projetos_pesquisa/all_resear_proj_manag.org"
                        ))

;; packs to print calendar with appointments as GoogleCalendar
(require 'calfw)
(require 'calfw-org)
(setq cfw:org-agenda-schedule-args '(:timestamp))
;(require 'calfw-ical)

;;-----------------------------------------------------------------------------
;; ORG mode CLASSES and COLORS for TASKS
(setq org-todo-keywords
       '((sequence "TODO(t)" "RUNN(w@/!)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
     (setq org-todo-keyword-faces
           '(
             ("TODO" . (:foreground "red" :weight bold))
             ("RUNN" . (:foreground "gold" :weight bold))
             ("WAIT" . (:foreground "cyan" :weight bold))
             ("DONE" . (:foreground "green" :weight bold))
             ))
;;-----------------------------------------------------------------------------
;; ORG CAPTURE
;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
  '(    ;; ... other templates
    ("l" "Link" entry (file+headline 
         "~/Dropbox/emacs_org_mode/capture.org" "Link") 
         "* LINK %^{Description} %^g
         %?
         Added: %U")
    ("j" "Journal Entry"
         entry (file+datetree "~/Dropbox/emacs_org_mode/capture.org")
         "* %?"
         :empty-lines 1)
    ("p" "Phone" entry (file+headline 
         "~/Dropbox/emacs_org_mode/capture.org" "Phone") 
         "* NUMBER %^{Description} %^g
         %?
         Added: %U")
    ("q" "Quote" entry (file+headline 
         "~/Dropbox/emacs_org_mode/capture.org" "Quote") 
         "* QUOTE %^{Description} %^g
         %?
         Added: %U")
    ("t" "Ted Talks" entry (file+headline 
         "~/Dropbox/emacs_org_mode/capture.org" "Ted") 
         "* TED %^{Description} %^g
         %?
         Added: %U")
        ;; ... other templates
    ))

;;----------------------------------------------------------------------
;; POWERLINES
;;----------------------------------------------------------------------
;;https://github.com/milkypostman/powerline/
(require 'powerline)
(powerline-default-theme)
;;----------------------------------------------------------------------

;;===========================================================================
;;STANDARD SETTINGS
;;===========================================================================
;;---------------------------------------------------------------------------
; There is no welcome windows ;; http://blog.droidzone.in/2012/05/22/remove-startup-split-screen-in-emacs/
(setq inhibit-startup-screen t)
(add-hook 'emacs-startup-hook 'delete-other-windows)[/code]
;;---------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;New buffer horizontal or vertical
;https://www.emacswiki.org/emacs/HorizontalSplitting
;(setq split-width-threshold 9999)
(setq split-width-threshold 0)
;;---------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;; Tipo e tamanho da fonte do editor.
;(set-default-font "Anonymous Pro-14.5")
(set-default-font "Envy Code R-18")
;(set-default-font "Hack-16")
;(set-default-font "IBMPlexMono-16")
;(set-default-font "Monaco-16.5")
;(set-default-font "monofur-20")
;(set-default-font "Menlo-16")
;(set-default-font "Monoid-14")
;(set-default-font "Tex Gyre Adventor-11")

;;---------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;; Space between lines and between line numbers and text (like margin)
(setq-default line-spacing 3) 
(setq-default left-fringe-width  15)
;(setq-default right-fringe-width  0)
;(set-face-attribute 'fringe nil :background "black")
;;---------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Provide Highlight code in SRC
(setq org-src-fontify-natively t)
;;-----------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;; numeração das linhas na margem esquerda
(global-linum-mode 1)
;;---------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Mostra posição do cursor em relação a margem esquerda.
(setq column-number-mode t)
;;-----------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;; Show file name in title bar
;; http://www.thetechrepo.com/main-articles/549
(setq frame-title-format "%b - Emacs")
;;---------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Quebra de linhas ao exceder largura do texto (padrão é 72 caracteres).
(setq-default fill-column 72)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Não quebrar linhas, útil para tabelas longas
;(setq-default truncate-lines t)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Auto break long lines.
;(setq-default auto-fill-function 'do-auto-fill)
;;-----------------------------------------------------------------------------

;; Wrap long lines
;(global-visual-line-mode t)
;(setq-default word-wrap t)

;;-----------------------------------------------------------------------------
;; Modo de linhas de tela (screen lines) e não lógicas (logical lines).
(visual-line-mode 1)
;;-----------------------------------------------------------------------------


;;---------------------------------------------------------------------------
;; Desativa o auto salvar e auto backup.
(setq auto-save-default nil) ;; Para o #autosave#.
(setq make-backup-files nil) ;; Para o backup~.
;;---------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Usa espaços ao ínves de tabs para indentar.
;; http://xenon.stanford.edu/~manku/dotemacs.html
(setq-default indent-tabs-mode nil)
;;-----------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;; inicia Emacs com ctrl-{zxcv} habilitado para desf/cut/copy/paste
;(cua-mode t)
(cua-selection-mode t)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; stop cursor blinking
(blink-cursor-mode 1)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; removes menu bar
(menu-bar-mode -1)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; removes menu bar
(tool-bar-mode -1)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Highlight matching pairs.
(show-paren-mode 1)
;;-----------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;;How to have emacs highlight text selections?	
;;	(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing
;;-----------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;; Speedbar embed
;(require 'sr-speedbar)
;;-----------------------------------------------------------------------------

;;===========================================================================
;; SPECIAL PROGRAMMING TOOLS
;;===========================================================================

;;-----------------------------------------------------------------------------
;; multiple-cursors.el https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; ace-jump-mode.el https://github.com/winterTTr/ace-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; enable a more powerful jump back function from ace jump mode
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode)
;;-----------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;; Ido Search FILE
(ido-mode t)
;(setq ido-everywhere t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)
(setq ido-file-extensions-order '(".md" ".R" ".Rmd" ".csv" ".txt" ".org" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
;;---------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;; Improving Ido Search FILE http://sachachua.com/blog/2014/03/emacs-basics-call-commands-name-m-x-tips-better-completion-using-ido-helm/
(require 'smex)
(require 'ido-vertical-mode)
(require 'ido-hacks)
(require 'flx)
(require 'flx-ido)

(ido-mode 1)
(require 'ido-hacks nil t)
(if (commandp 'ido-vertical-mode) 
    (progn
      (ido-vertical-mode 1)
      (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)))
(if (commandp 'smex)
    (global-set-key (kbd "M-x") 'smex))
(if (commandp 'flx-ido-mode)
    (flx-ido-mode 1))
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; FUNCTION HIGHLIGHTS LISP
(require 'highlight-symbol)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; INDENT GUIDE
;; https://raw.githubusercontent.com/zk-phi/indent-guide/master/indent-guide.el
(require 'indent-guide)
(setq indent-guide-recursive t)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; HIGHLIGHT-INDENTATION-MODE
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

;;-----------------------------------------------------------------------------


;;===========================================================================
;;AUTO COMLETE
;;===========================================================================
(require 'yasnippet)
(yas-global-mode 1)

;;-----------------------------------------------------------------------------
;; AUTO COMPLETE FUNCTION
;;aciona AUTO-COMPLETE
;;-----------------------------------------------------------------------------
;; https://www.emacswiki.org/emacs/AutoCompleteSources
;(require 'auto-complete)
;(require 'auto-complete-config)
;(ac-config-default)



;; stop (auto-complete-mode) from being called in python https://stackoverflow.com/questions/24814988/emacs-disable-auto-complete-in-python-mode
;(defadvice auto-complete-mode (around disable-auto-complete-for-python)) ;; one extra parentesis
;  (unless (eq major-mode 'python-mode) ad-do-it))

;(ad-activate 'auto-complete-mode)
;; macro .el, not necessary
;; auto-complete for latex 
;;(require 'auto-complete-auctex)

(require 'ac-math) 
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

 (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
;(global-auto-complete-mode t)
 
(setq ac-math-unicode-in-math-p t)
(ac-flyspell-workaround) ;; to make flyspell works with auto-complete

;; to use biber instead bibtex
;; https://tex.stackexchange.com/questions/154751/biblatex-with-biber-configuring-my-editor-to-avoid-undefined-citations/154753#154753
(setq TeX-parse-self t)

;;----------------------------------------------------------------------
;; To activate ESS auto-complete for R.
;;----------------------------------------------------------------------
; (setq ess-use-auto-complete 'script-only)

;;----------------------------------------------------------------------
;; CHANGE 'ac-complete FROM ENTER to TAB.
;;----------------------------------------------------------------------
;(define-key ac-completing-map "\r" nil)
;(define-key ac-completing-map "\t" 'ac-complete)

;;----------------------------------------------------------------------
;; auto complete markdown
;; http://wiki.dreamrunner.org/public_html/Emacs/markdown.html
;;----------------------------------------------------------------------
;(add-hook 'markdown-mode-hook
;          '(lambda ()
;             (auto-complete-mode t)
;             (local-unset-key [tab])
;             (setq-local yas-fallback-behavior '(apply auto-complete))))

;;----------------------------------------------------------------------
;; Smart Parenthesis https://github.com/Fuco1/smartparens
;;----------------------------------------------------------------------
(require 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode 1)

;;; html-mode
    (sp-with-modes '(html-mode sgml-mode web-mode)
      (sp-local-pair "<" ">"))

;;-----------------------------------------------------------------------------
;; FOLDING BY INDENTATION ;; git clone https://github.com/zenozeng/yafolding.el.git
;;-----------------------------------------------------------------------------

(require 'yafolding)
(define-key yafolding-mode-map (kbd "C-c {") 'yafolding-toggle-all)
(define-key yafolding-mode-map (kbd "C-c }") 'yafolding-hide-parent-element)
(define-key yafolding-mode-map (kbd "C-c ]") 'yafolding-toggle-element)

;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; ADD HIGHLIGHT FOR CERTAIN KEYWORDS
;;-----------------------------------------------------------------------------
(make-face 'special-words) 
(set-face-attribute 'special-words nil :foreground "White" :background "Firebrick") 
(dolist
    (mode '(fundamental-mode
            gnus-article-mode
            org-mode
            shell-mode
            sh-mode
            muse-mode
            ess-mode
            polymode-mode
            python-mode
            markdown-mode
            TeX-mode)) 
  (font-lock-add-keywords
   mode 
   '(("\\<\\(COMMENT\\|DONE\\|TODO\\|STOP\\|IMPORTANT\\|NOTE\\|OBS\\|ATTENTION\\|REVIEW\\)" 
      0 'font-lock-warning-face t) 
     ("\\<\\(BUG\\|WARNING\\|DANGER\\|FIXME\\)" 
      0 'special-words t)))
  ) 
;;-----------------------------------------------------------------------------
 
;;===========================================================================
;; SETTING TO WORK WITH ESS and R
;;===========================================================================
;;---------------------------------------------------------------------------
;; IF YOU GET ERROR TO LOAD ESS: The immediate fix is to delete <user-emacs-directory>/elpa/archives/melpa/archive-contents; it will be rebuilt on the next package-initialize.
;; faz com que apareceça os argumentos das funções do R no minibuffer
;(require 'ess-site)
;(setq-default ess-dialect "R")
;(require 'ess-eldoc)

;(setq-default ess-dialect "r")
;(require 'ess-eldoc)
;;-----------------------------------------------------------------------------
;; If you want all help buffers to go into one frame do:
(setq ess-help-own-frame 'one)

;;-----------------------------------------------------------------------------
;; ESS - HIGHLIGHTS ON PROGRAMING CODES
;;-----------------------------------------------------------------------------
 (setq ess-R-font-lock-keywords
         '((ess-R-fl-keyword:modifiers . t) ; default
           (ess-R-fl-keyword:fun-defs . t) ; default
           (ess-R-fl-keyword:keywords . t) ; default
           (ess-R-fl-keyword:assign-ops . t) ; default
           (ess-R-fl-keyword:constants . t) ; default
           (ess-fl-keyword:fun-calls . t)
           (ess-fl-keyword:numbers . t)  ;;se ativar fica muita colorido
           (ess-fl-keyword:operators . nil)
           (ess-fl-keyword:delimiters . t) ;;se ativar fica muita colorido
           (ess-fl-keyword:= . nil) ;;se ativar fica muita colorido
           (ess-R-fl-keyword:F&T . t)))

   (setq inferior-R-font-lock-keywords
         '((ess-S-fl-keyword:prompt . t) ; default
           (ess-R-fl-keyword:messages . t) ; default
           (ess-R-fl-keyword:modifiers . nil) ; default
           (ess-R-fl-keyword:fun-defs . nil) ; default
           (ess-R-fl-keyword:keywords . t) ; default
           (ess-R-fl-keyword:assign-ops . nil) ; default
           (ess-R-fl-keyword:constants . t) ; default
           (ess-fl-keyword:matrix-labels . t) ; default
           (ess-fl-keyword:fun-calls . t)
;;           (ess-fl-keyword:numbers . nil)
;;           (ess-fl-keyword:operators . nil)
;;           (ess-fl-keyword:delimiters . nil)
;;           (ess-fl-keyword:= . t)
           (ess-R-fl-keyword:F&T . t)))

;;===========================================================================
;;FUNCOES functions
;;===========================================================================
;(add-to-list 'load-path "/home/rafatieppo/.emacs.d/lisp")
(load "/home/rafatieppo/.emacs.d/lisp/functions")
;(require 'functions)
;;===========================================================================
;;MARKDOWN MODE 
;;===========================================================================
;;-----------------------------------------------------------------------------
;; ORG MOMDE MINOR mode markdown
;; http://stackoverflow.com/questions/14275122/editing-markdown-pipe-tables-in-emacs
(require 'org-table)

(defun cleanup-org-tables ()
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "-+-" nil t) (replace-match "-|-"))
    ))

(add-hook 'markdown-mode-hook 'orgtbl-mode)
(add-hook 'markdown-mode-hook
          (lambda()
            (add-hook 'after-save-hook 'cleanup-org-tables  nil 'make-it-local)))
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; If using markdown-mode yasnippets’s TAB completion doesn’t work, it’s just because TAB key is bind to markdown-cycle function
;; http://wiki.dreamrunner.org/public_html/Emacs/markdown.html
(add-hook 'markdown-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (local-unset-key [tab])
             (setq-local yas-fallback-behavior '(apply auto-complete))))
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; MARKDOWN enable MATH ;http://jblevins.org/projects/markdown-mode/
(setq markdown-enable-math t)

;;===========================================================================
;; MARKDOWN EXTENSIONS.
;; (IT MUST BE BEFORE LATEX EXTENSIONS.)
;;===========================================================================

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Org-struct minor mode active in markdown mode.
(add-hook 'markdown-mode-hook 'turn-on-orgstruct)
(add-hook 'markdown-mode-hook 'turn-on-orgstruct++)

;;===========================================================================
;; REFTEX CITATION PANDOC
;; http://www.unknownerror.org/opensource/jgm/pandoc/q/stackoverflow/13607156/autocomplete-pandoc-style-citations-from-a-bibtex-file-in-emacs
;; http://tex.stackexchange.com/a/31992/5701
;;===========================================================================

;; So that RefTeX finds my bibliography
(setq reftex-default-bibliography '("/home/rafatieppo/Dropbox/bibtex/references.bib"))

;; How to solve @
(eval-after-load 'reftex-vars
  '(progn 
     (setq reftex-cite-format '((?\C-m . "@%l")
                                (?\C-l . "\\cite{%l\}")
                                (?\C-o . "\\citeonline{%l\}")
                                (?\C-t . "\\citet{%l\}")
                                (?\C-p . "\\citep{%l\}")
                                ))))
;; I changed the code, before "[@%l]" cite between brackets
;;-----------------------------------------------------------------------------

;;===========================================================================
;; LATEX
;;===========================================================================

;;-----------------------------------------------------------------------------
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Suporte do refTex para navega http://piotrkazmierczak.com/2010/05/13/emacs-as-the-ultimate-latex-editor/
;; Para ativar: C-c =  it means CTRL + c + = 
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)



;;===========================================================================
;; JavaScript
;;===========================================================================
;;-----------------------------------------------------------------------------
; js2-mode.
(add-to-list 'auto-mode-alist '("\\.js\\'\\|\\.json\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(add-to-list 'load-path "/home/rafatieppo/.emacs.d/elpa/company-tern-20200610/")
(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
;;===========================================================================
;; HTML
;;===========================================================================
;;-----------------------------------------------------------------------------
;; https://www.emacswiki.org/emacs/IndentingHtml
    (add-hook 'html-mode-hook
        (lambda ()
          ;; Default indentation is usually 2 spaces, changing to 4.
          (set (make-local-variable 'sgml-basic-offset) 4)))
;;-----------------------------------------------------------------------------
;; web-mode

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


;Using web-mode for editing plain HTML files can be done this way
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;;===========================================================================
;; CPP CONFIGURATION
;;===========================================================================
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;===========================================================================
;; PYTHON CONFIGURATION
;;===========================================================================
;; Set Python3 interpreter
;(setq python-shell-interpreter "/usr/bin/python3")
(setq python-shell-interpreter "/home/rafatieppo/Documents/test_raterio/bin/python")

;;(setq python-shell-interpreter "/home/rafatieppo/anaconda3/bin/python3")

;(setq elpy-rpc-python-command "/usr/bin/python3")
(setq elpy-rpc-python-command "/home/rafatieppo/Documents/test_raterio/bin/python")



(elpy-enable)
;;(setf elpy:complete-on-dot t)
;;(company-quickhelp-mode 1) ;; faz aparecer quickhelp
(add-hook 'elpy-mode-hook
          (lambda ()
            (delq 'ac-source-dictionary ac-sources)
            (delq 'ac-source-abbrev ac-sources)
            (delq 'ac-source-words-in-same-mode-buffers ac-sources)))

;;-----------------------------------------------------------------------------
;; Autopep8 - enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;(add-hook 'anaconda-mode-hook 'py-autopep8-enable-on-save)
;(setq py-autopep8-options '("--max-line-lengh=100"))

;;-----------------------------------------------------------------------------
;; ALT ENTER to send line
(defun my-python-line ()
 (interactive)
  (save-excursion
  (setq the_script_buffer (format (buffer-name)))
  (end-of-line)
  (kill-region (point) (progn (back-to-indentation) (point)))
  ;(setq the_py_buffer (format "*Python[%s]*" (buffer-file-name)))
  (setq the_py_buffer "*Python*")
  (switch-to-buffer-other-window  the_py_buffer)
  (goto-char (buffer-end 1))
  (yank)
  (comint-send-input)
  (switch-to-buffer-other-window the_script_buffer)
  (yank))
  (beginning-of-line) ;; or (end-of-line)
  (next-line)
)
(global-set-key (kbd "M-RET") 'my-python-line) ; Enter/Return key
;;-----------------------------------------------------------------------------
;; ALT / to send region
(defun python-shell-send-region-or-line nil
  "Sends from python-mode buffer to a python shell, intelligently."
  (interactive)
  (cond ((region-active-p)
     (setq deactivate-mark t)
     (python-shell-send-region (region-beginning) (region-end))
     (python-nav-forward-statement)
 ) (t (elpy-shell-send-current-statement))))
;elpy-shell-send-region
;https://emacs.stackexchange.com/questions/27674/make-elpy-shell-send-more-intelligent
(global-set-key (kbd "M-/") 'python-shell-send-region-or-line) ; alt + /

;;===========================================================================
;;Neotree A emacs tree plugin like NERD tree for Vim.
;;===========================================================================
(require 'neotree)
  (global-set-key [f8] 'neotree-toggle)


;;===========================================================================
;; Flymake and Flycheck
;;===========================================================================
;(remove-hook 'flymake-diagnostic-functions 'flymake-elpy)
(setq elpy-modules (delete 'elpy-module-flymake elpy-modules))
(add-hook 'after-init-hook #'global-flycheck-mode)

;;===========================================================================
;; THEMES - SEVERAL SCHEMES
;;===========================================================================
;; Solarized
;(add-to-list 'load-path "/home/rafatieppo/.emacs.d/themess/emacs-color-theme-solarized-master")
;(require 'solarized-dark-theme)
;(require 'solarized-definitions)
;(require 'solarized-theme)
;(require 'color-theme-solarized)

;;-----------------------------------------------------------------------------
;; Solarized https://github.com/bbatsov/solarized-emacs

(add-to-list 'load-path "/home/rafatieppo/.emacs.d/themess/solarized")
(require 'solarized-dark-theme)
;(require 'solarized-light-theme)
(add-to-list 'load-path "/home/rafatieppo/.emacs.d/themess")

;(require 'afternoon-theme)
;(require 'ayu-theme)
;(require 'monokai-theme) ;; load first to improve ORG visualization
;;(require 'Amelie-theme)
;;(require 'ample-zen-theme)
;;(require 'assemblage-theme)
;(require 'atom-one-dark-theme)
;;(require 'blackboard-theme)
;;(require 'deep-thought-theme)
;;(require 'challenger-deep-theme.el)
;(require 'clues-theme)
;(require 'dracula-theme)
;;(require 'erosiond-theme)
;(require 'forest-blue-theme)
;;(require 'fogus-theme)
;;(require 'gotham)
;;(require 'granger-theme)
;(require 'ibm-dark-theme)
;;(require 'hickey-theme)
;;(require 'junio-theme)
;(require 'material-light-theme)
;(require 'material-theme)
;;(require 'moe-dark-theme)
;;(require 'moe-light-theme)
;(require 'molokai-theme)
;(require 'nimbus-theme)
;;(require 'odersky-theme)
;(require 'seti-theme)
;;(require 'soothe-theme)
;(require 'spacemacs-dark-theme)
;;(require 'spolsky-theme)
;;(require 'tangotango-theme)
;(require 'tron-theme)
;;(require 'ujelly-theme)
;;(require 'underwater-theme)
;;(require 'wilson-theme)
;;(require 'zenburn-theme)
;(require 'zerodark-theme)
;(require 'color-theme-tomorrow)
;(color-theme-tomorrow--define-theme night-blue)
;(color-theme-tomorrow--define-theme night-eighties)
;;(color-theme-tomorrow--define-theme night-bright)
;;(color-theme-tomorrow--define-theme night)
;(color-theme-tomorrow--define-theme day)

;(if (display-graphic-p) 
;    (require 'zerodark-theme) 
;  (require 'forest-blue-theme))

;;===========================================================================
;;Horizontal line
;;===========================================================================
;(global-hl-line-mode 1)
;; Underline in current line
;(set-face-attribute hl-line-face nil :underline t)
;(set-face-background hl-line-face "#2F2F2F") ;;MONOKAI
;;---------------------------------------------------------------------------
;;===========================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yafolding web-mode tern smex smartparens py-autopep8 powerline polymode neotree multiple-cursors markdown-mode js2-mode jedi indent-guide ido-vertical-mode ido-hacks highlight-symbol flycheck flx-ido ess-R-data-view elpy dash-functional company-quickhelp company-jedi company-irony company-anaconda calfw-org calfw-ical calfw auctex ace-jump-mode ac-math))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
