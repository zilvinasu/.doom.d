;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-theme 'doom-nord)
(setq display-line-numbers-type nil)
(menu-bar-mode 1)
(global-visual-line-mode 1)

(setq doom-font (font-spec :family "Cascadia Code" :size 12))

;; Flycheck
(eval-after-load 'flycheck '(flycheck-clojure-setup))
(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;; Custom Key Bindings
(map!
 :leader
 (:prefix "p"
  :desc "Search" "s" #'+ivy/project-search))

(map!
 :leader
 (:prefix "j"
  :desc "Jump to char" "j" #'avy-goto-char))
