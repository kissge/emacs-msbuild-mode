;;; msbuild-mode.el -*- lexical-binding: t; -*-

;; Copyright (C) 2017 yk

;; Author: yk
;; Keywords: internal

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'font-lock)

(defvar msbuild-mode-keywords
  '(("^Waiting for .*" . font-lock-comment-face)
    ("^BUILD: \\(Pass complete => .*\\|Done\\)" . font-lock-comment-face)
    ("^    [0-9]+ files compiled" . font-lock-keyword-face)
    ("^    [0-9]+ executables built" . font-lock-keyword-face)
    ("^    [0-9]+ files binplaced" . font-lock-keyword-face)

    ("^[0-9]+>ERROR:.*" . highlight)
    ("^[0-9]+>.*([0-9]+): error .*" . highlight)
    ("^[0-9]+>\\(\s*([^)]*)\\)?" . font-lock-builtin-face)

    ("^\\([A-Z ]+\\):" 1 font-lock-constant-face)

    ("\"[^\"]*\"" . font-lock-string-face)
    ("'[^']*'" . font-lock-string-face)))

;;;###autoload
(define-derived-mode msbuild-mode text-mode "MSBuild"
  "Major mode for MSBuild log files."
  (auto-revert-tail-mode +1)
  (setq font-lock-defaults '((msbuild-mode-keywords))))

;;;###autoload
(add-to-list 'auto-mode-alist '("buildfre.log\\'" . msbuild-mode))

(provide 'msbuild-mode)
;;; msbuild-mode.el ends here
