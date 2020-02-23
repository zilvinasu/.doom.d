;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(menu-bar-mode 1)
(global-visual-line-mode 1)
(setq doom-theme 'doom-dracula
      display-line-numbers-type 'relative
      doom-font (font-spec :family "JetBrains Mono" :size 13))

;; rustic
(setq rustic-format-on-save t)

;; lsp
(setq
 lsp-diagnostic-package :none
 lsp-ui-sideline-show-code-actions nil)

(add-hook 'clojure-mode-hook #'lsp!)
(add-hook 'clojurec-mode-hook #'lsp!)
(add-hook 'clojurescript-mode-hook #'lsp!)

(after! lsp-mode
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration (cons m "clojure"))))

;; dap-mode
(after! lsp-mode
  (require 'dap-mode))
(after! dap-mode
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (map!
   :leader
   (:prefix "o"
    :desc "DAP debug" "h d" #'dap-debug
    :desc "DAP hydra" "h h" #'dap-hydra)))

(after! dap-go
  (dap-go-setup))

(after! dap-node
  (dap-node-setup)
  (dap-register-debug-template
   "Node::Mocha::Watch File"
   (list :type "node"
         :request "launch"
         :program "/usr/local/bin/mocha"
         :args (list "--no-colors"
                     (format "%s" buffer-file-name)
                     "--dirty"
                     "--watch")
         :env (list :NODE_ENV "test"
                    :prettyPrint "true")
         :name "Node::Mocha::Watch File")))

;; custom kbds
(map!
 :leader
 (:prefix "p"
  :desc "Search in project" "s" #'+ivy/project-search))

(map!
 :leader
 (:prefix "j"
  :desc "Jump to char" "j" #'avy-goto-char))
