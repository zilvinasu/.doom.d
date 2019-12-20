;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-theme 'doom-dracula)
(setq display-line-numbers-type nil)
(menu-bar-mode 1)
(global-visual-line-mode 1)

(setq doom-font (font-spec :family "Cascadia Code" :size 13))

;; Flycheck
(eval-after-load 'flycheck '(flycheck-clojure-setup))
(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;; DAP
(use-package! dap-mode
  :after lsp-mode
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1))

(use-package! dap-node
  :after dap-mode
  :config
  (dap-node-setup)
  (dap-register-debug-template
   "Node::Mocha::Specs"
   (list :type "node"
         :request "launch"
         :program "/usr/local/bin/mocha"
         :args (list "**/*.spec.js"
                     "--inline-diffs"
                     "--dirty"
                     "--watch")
         :env (list :prettyPrint "true")
         :name "Node::Mocha::Specs")))

;; Custom Key Bindings
(map!
 :leader
 (:prefix "p"
  :desc "Search" "s" #'+ivy/project-search))

(map!
 :leader
 (:prefix "j"
  :desc "Jump to char" "j" #'avy-goto-char))
