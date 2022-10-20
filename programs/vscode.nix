{
    pkgs,
        lib,
        ...
}: {
    home-manager.users.drusk = {
        programs.vscode = {
            enable = true;
            package = pkgs.vscode-fhs;

            extensions = with pkgs.vscode-extensions; [
                vscodevim.vim
                    streetsidesoftware.code-spell-checker
                    github.copilot
                    bbenoist.nix
                    ms-vscode-remote.remote-ssh
                    redhat.vscode-yaml
            ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "vscode-theme-onedark";
                publisher = "akamud";
                version = "2.3.0";
                sha256 = "8GGv4L4poTYjdkDwZxgNYajuEmIB5XF1mhJMxO2Ho84=";
            }
            {
                name = "gruvbox-material";
                publisher = "sainnhe";
                version = "6.5.1";
                sha256 = "+JU/pwIFmrH8wXqC9hh59iJS22zs7ITYhEwWf676RJU=";
            }
            {
                name = "inlay-hints";
                publisher = "DominicVonk";
                version = "0.0.6";
                sha256 = "Gp+jWoU92LJ/uFmTri4iFkH8pPzYbmB2dGpc49B0JAU=";
            }
            {
                name = "keyboard-quickfix";
                publisher = "pascalsenn";
                version = "0.0.6";
                sha256 = "BK7ND6gtRVEitxaokJHmQ5rvSOgssVz+s9dktGQnY6M=";
            }
            {
                name = "phocus-vscode";
                publisher = "phisch";
                version = "1.0.0";
                sha256 = "S4OYeZRjZEj+8X5NuKiEz2omETVLVuKnrqxMXpIat6Q=";
            }
            {
                name = "vscode-fzf";
                publisher = "andyyu2004";
                version = "0.3.0";
                sha256 = "v8+1NRh9aEcKmy/Otcc5H+mYiNhDF2wx2yVUmMf3b9w=";
            }

            ];


            keybindings = 
                # Place your key bindings in this file to override the defaults
                [
                    {
                        "key" = "ctrl+j";
                        "command" = "selectNextSuggestion";
                        "when" = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
                    }
                    {
                        "key" = "ctrl+b";
                        "command" = "-extension.vim_ctrl+b";
                        "when" = "editorTextFocus && vim.active && vim.use<C-b> && !inDebugRepl && vim.mode != 'Insert'";
                    }
                    {
                        "key" = "ctrl+r";
                        "command" = "redo";
                    }
                    {
                        "key" = "u";
                        "command" = "undo";
                        "when" = "editorTextFocus && vim.active && vim.mode == 'Normal'";
                    }
                    {
                        "key" = "ctrl+r";
                        "command" = "-extension.vim_ctrl+r";
                        "when" = "editorTextFocus && vim.active && vim.use<C-r> && !inDebugRepl";
                    }
                    {
                        "key" = "ctrl+u";
                        "command" = "-cursorUndo";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+b";
                        "command" = "-workbench.action.toggleSidebarVisibility";
                    }
                    {
                        "key" = "ctrl+b";
                        "command" = "workbench.action.closeSidebar";
                    }
                    {
                        "key" = "alt+f4";
                        "command" = "-workbench.action.closeWindow";
                    }
                    {
                        "key" = "ctrl+shift+up";
                        "command" = "-editor.action.insertCursorAbove";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "ctrl+shift+down";
                        "command" = "-editor.action.insertCursorBelow";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "shift+alt+up";
                        "command" = "-editor.action.insertCursorAbove";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "shift+alt+down";
                        "command" = "-editor.action.insertCursorBelow";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "ctrl+c";
                        "command" = "-editor.action.clipboardCopyAction";
                    }
                    {
                        "key" = "ctrl+shift+alt+down";
                        "command" = "-editor.action.copyLinesDownAction";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+shift+alt+up";
                        "command" = "-editor.action.copyLinesUpAction";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+x";
                        "command" = "-editor.action.clipboardCutAction";
                    }
                    {
                        "key" = "ctrl+f2";
                        "command" = "-editor.action.changeAll";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+k m";
                        "command" = "-workbench.action.editor.changeLanguageMode";
                        "when" = "!notebookEditorFocused";
                    }
                    {
                        "key" = "shift+alt+i";
                        "command" = "-editor.action.insertCursorAtEndOfEachLineSelected";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "ctrl+k ctrl+c";
                        "command" = "-editor.action.addCommentLine";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+d";
                        "command" = "-editor.action.addSelectionToNextFindMatch";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "shift+alt+h";
                        "command" = "-references-view.showCallHierarchy";
                        "when" = "editorHasCallHierarchyProvider";
                    }
                    {
                        "key" = "ctrl+shift+w";
                        "command" = "-workbench.action.closeWindow";
                    }
                    {
                        "key" = "ctrl+shift+k";
                        "command" = "-editor.action.deleteLines";
                        "when" = "textInputFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+l";
                        "command" = "-expandLineSelection";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+alt+right";
                        "command" = "-editor.action.smartSelect.expand";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "ctrl+k e";
                        "command" = "-workbench.files.action.focusOpenEditorsView";
                        "when" = "workbench.explorer.openEditorsView.active";
                    }
                    {
                        "key" = "ctrl+k c";
                        "command" = "-workbench.files.action.compareWithClipboard";
                    }
                    {
                        "key" = "ctrl+k d";
                        "command" = "-workbench.files.action.compareWithSaved";
                    }
                    {
                        "key" = "ctrl+alt+c";
                        "command" = "-copyFilePath";
                        "when" = "!editorFocus";
                    }
                    {
                        "key" = "ctrl+shift+alt+c";
                        "command" = "-copyRelativeFilePath";
                        "when" = "!editorFocus";
                    }
                    {
                        "key" = "ctrl+n";
                        "command" = "-workbench.action.files.newUntitledFile";
                    }
                    {
                        "key" = "ctrl+k o";
                        "command" = "-workbench.action.files.showOpenedFileInNewWindow";
                        "when" = "emptyWorkspaceSupport";
                    }
                    {
                        "key" = "ctrl+alt+r";
                        "command" = "-revealFileInOS";
                        "when" = "!editorFocus";
                    }
                    {
                        "key" = "ctrl+o";
                        "command" = "-workbench.action.files.openFile";
                        "when" = "true";
                    }
                    {
                        "key" = "ctrl+k ctrl+o";
                        "command" = "-workbench.action.files.openFolder";
                        "when" = "openFolderWorkspaceSupport";
                    }
                    {
                        "key" = "ctrl+r";
                        "command" = "-workbench.action.openRecent";
                    }
                    {
                        "key" = "ctrl+o";
                        "command" = "-workbench.action.files.openFileFolder";
                        "when" = "isMacNative && openFolderWorkspaceSupport";
                    }
                    {
                        "key" = "ctrl+s";
                        "command" = "-workbench.action.files.save";
                    }
                    {
                        "key" = "ctrl+shift+s";
                        "command" = "-workbench.action.files.saveAs";
                    }
                    {
                        "key" = "ctrl+k s";
                        "command" = "-workbench.action.files.saveWithoutFormatting";
                    }
                    {
                        "key" = "ctrl+f";
                        "command" = "-actions.find";
                        "when" = "editorFocus || editorIsOpen";
                    }
                    {
                        "key" = "f3";
                        "command" = "-editor.action.nextMatchFindAction";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "shift+f3";
                        "command" = "-editor.action.previousMatchFindAction";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "ctrl+f3";
                        "command" = "-editor.action.nextSelectionMatchFindAction";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "enter";
                        "command" = "-editor.action.nextMatchFindAction";
                        "when" = "editorFocus && findInputFocussed";
                    }
                    {
                        "key" = "shift+enter";
                        "command" = "-editor.action.previousMatchFindAction";
                        "when" = "editorFocus && findInputFocussed";
                    }
                    {
                        "key" = "ctrl+shift+f3";
                        "command" = "-editor.action.previousSelectionMatchFindAction";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "ctrl+shift+[IntlBackslash]";
                        "command" = "-breadcrumbs.focusAndSelect";
                        "when" = "breadcrumbsPossible";
                    }
                    {
                        "key" = "ctrl+k ctrl+0";
                        "command" = "-editor.foldAll";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+shift+7";
                        "command" = "-editor.foldAllBlockComments";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+8";
                        "command" = "-editor.foldAllMarkerRegions";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+-";
                        "command" = "-editor.foldAllExcept";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+1";
                        "command" = "-editor.foldLevel1";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+3";
                        "command" = "-editor.foldLevel3";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+2";
                        "command" = "-editor.foldLevel2";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+4";
                        "command" = "-editor.foldLevel4";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+5";
                        "command" = "-editor.foldLevel5";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+6";
                        "command" = "-editor.foldLevel6";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+7";
                        "command" = "-editor.foldLevel7";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+shift+i";
                        "command" = "-notebook.formatCell";
                        "when" = "editorHasDocumentFormattingProvider && editorTextFocus && inCompositeEditor && notebookEditable && !editorReadonly && activeEditor == 'workbench.editor.notebook'";
                    }
                    {
                        "key" = "ctrl+shift+i";
                        "command" = "-editor.action.formatDocument.none";
                        "when" = "editorTextFocus && !editorHasDocumentFormattingProvider && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+k ctrl+f";
                        "command" = "-editor.action.formatSelection";
                        "when" = "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+k ctrl+r";
                        "command" = "-git.revertSelectedRanges";
                        "when" = "isInDiffEditor";
                    }
                    {
                        "key" = "ctrl+k ctrl+alt+s";
                        "command" = "-git.stageSelectedRanges";
                        "when" = "isInDiffEditor";
                    }
                    {
                        "key" = "ctrl+k ctrl+n";
                        "command" = "-git.unstageSelectedRanges";
                        "when" = "isInDiffEditor";
                    }
                    {
                        "key" = "ctrl+alt+-";
                        "command" = "-workbench.action.navigateBack";
                    }
                    {
                        "key" = "ctrl+shift+-";
                        "command" = "-workbench.action.navigateForward";
                    }
                    {
                        "key" = "f12";
                        "command" = "-editor.action.revealDefinition";
                        "when" = "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor";
                    }
                    {
                        "key" = "ctrl+e";
                        "command" = "-workbench.action.quickOpen";
                    }
                    {
                        "key" = "ctrl+f12";
                        "command" = "-editor.action.goToImplementation";
                        "when" = "editorHasImplementationProvider && editorTextFocus && !isInEmbeddedEditor";
                    }
                    {
                        "key" = "ctrl+k ctrl+q";
                        "command" = "-workbench.action.navigateToLastEditLocation";
                    }
                    {
                        "key" = "ctrl+g";
                        "command" = "-workbench.action.gotoLine";
                    }
                    {
                        "key" = "alt+f5";
                        "command" = "-workbench.action.editor.nextChange";
                        "when" = "editorTextFocus && !textCompareEditorActive";
                    }
                    {
                        "key" = "f7";
                        "command" = "-editor.action.diffReview.next";
                        "when" = "isInDiffEditor";
                    }
                    {
                        "key" = "alt+f8";
                        "command" = "-editor.action.marker.next";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "f8";
                        "command" = "-editor.action.marker.nextInFiles";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "f4";
                        "command" = "-references-view.next";
                        "when" = "reference-list.hasResult && references-view.canNavigate";
                    }
                    {
                        "key" = "f7";
                        "command" = "-editor.action.wordHighlight.next";
                        "when" = "editorTextFocus && hasWordHighlights";
                    }
                    {
                        "key" = "shift+alt+f5";
                        "command" = "-workbench.action.editor.previousChange";
                        "when" = "editorTextFocus && !textCompareEditorActive";
                    }
                    {
                        "key" = "shift+f7";
                        "command" = "-editor.action.diffReview.prev";
                        "when" = "isInDiffEditor";
                    }
                    {
                        "key" = "shift+alt+f8";
                        "command" = "-editor.action.marker.prev";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "shift+f8";
                        "command" = "-editor.action.marker.prevInFiles";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "shift+f4";
                        "command" = "-references-view.prev";
                        "when" = "reference-list.hasResult && references-view.canNavigate";
                    }
                    {
                        "key" = "shift+f7";
                        "command" = "-editor.action.wordHighlight.prev";
                        "when" = "editorTextFocus && hasWordHighlights";
                    }
                    {
                        "key" = "shift+f12";
                        "command" = "-editor.action.goToReferences";
                        "when" = "editorHasReferenceProvider && editorTextFocus && !inReferenceSearchEditor && !isInEmbeddedEditor";
                    }
                    {
                        "key" = "ctrl+shift+o";
                        "command" = "-workbench.action.gotoSymbol";
                    }
                    {
                        "key" = "ctrl+t";
                        "command" = "-workbench.action.showAllSymbols";
                    }
                    {
                        "key" = "ctrl+k ctrl+r";
                        "command" = "-workbench.action.keybindingsReference";
                    }
                    {
                        "key" = "ctrl+shift+enter";
                        "command" = "-editor.action.insertLineBefore";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+enter";
                        "command" = "-editor.action.insertLineAfter";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+shift+v";
                        "command" = "-markdown.showPreview";
                        "when" = "!notebookEditorFocused && editorLangId == 'markdown'";
                    }
                    {
                        "key" = "ctrl+k v";
                        "command" = "-markdown.showPreviewToSide";
                        "when" = "!notebookEditorFocused && editorLangId == 'markdown'";
                    }
                    {
                        "key" = "ctrl+k ctrl+d";
                        "command" = "-editor.action.moveSelectionToNextFindMatch";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "alt+down";
                        "command" = "-editor.action.moveLinesDownAction";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "alt+up";
                        "command" = "-editor.action.moveLinesUpAction";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+shift+n";
                        "command" = "-workbench.action.newWindow";
                    }
                    {
                        "key" = "ctrl+enter";
                        "command" = "-github.copilot.generate";
                        "when" = "editorTextFocus && github.copilot.activated";
                    }
                    {
                        "key" = "ctrl+k f12";
                        "command" = "-editor.action.revealDefinitionAside";
                        "when" = "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor";
                    }
                    {
                        "key" = "ctrl+shift+c";
                        "command" = "-workbench.action.terminal.openNativeConsole";
                        "when" = "!terminalFocus";
                    }
                    {
                        "key" = "shift+alt+o";
                        "command" = "-editor.action.organizeImports";
                        "when" = "editorTextFocus && !editorReadonly && supportedCodeAction =~ /(\\s|^)source\\.organizeImports\\b/";
                    }
                    {
                        "key" = "shift+insert";
                        "command" = "-editor.action.clipboardPasteAction";
                    }
                    {
                        "key" = "ctrl+v";
                        "command" = "-editor.action.clipboardPasteAction";
                    }
                    {
                        "key" = "ctrl+shift+f10";
                        "command" = "-editor.action.peekDefinition";
                        "when" = "editorHasDefinitionProvider && editorTextFocus && !inReferenceSearchEditor && !isInEmbeddedEditor";
                    }
                    {
                        "key" = "ctrl+shift+f12";
                        "command" = "-editor.action.peekImplementation";
                        "when" = "editorHasImplementationProvider && editorTextFocus && !inReferenceSearchEditor && !isInEmbeddedEditor";
                    }
                    {
                        "key" = "ctrl+k ctrl+t";
                        "command" = "-workbench.action.selectTheme";
                    }
                    {
                        "key" = "ctrl+shift+z";
                        "command" = "-redo";
                    }
                    {
                        "key" = "ctrl+y";
                        "command" = "-redo";
                    }
                    {
                        "key" = "shift+alt+f12";
                        "command" = "-references-view.findReferences";
                        "when" = "editorHasReferenceProvider";
                    }
                    {
                        "key" = "ctrl+shift+r";
                        "command" = "-editor.action.refactor";
                        "when" = "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+k ctrl+u";
                        "command" = "-editor.action.removeCommentLine";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+f";
                        "command" = "-repl.action.filter";
                        "when" = "inDebugRepl && textInputFocus";
                    }
                    {
                        "key" = "ctrl+h";
                        "command" = "-editor.action.startFindReplaceAction";
                        "when" = "editorFocus || editorIsOpen";
                    }
                    {
                        "key" = "enter";
                        "command" = "-repl.action.acceptInput";
                        "when" = "inDebugRepl && textInputFocus";
                    }
                    {
                        "key" = "f2";
                        "command" = "-editor.action.rename";
                        "when" = "editorHasRenameProvider && editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+shift+[IntlBackslash]";
                        "command" = "-editor.action.inPlaceReplace.down";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+[IntlBackslash]";
                        "command" = "-editor.action.inPlaceReplace.up";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+shift+m";
                        "command" = "-rust-analyzer.matchingBrace";
                        "when" = "editorTextFocus && editorLangId == 'rust'";
                    }
                    {
                        "key" = "ctrl+shift+j";
                        "command" = "-rust-analyzer.joinLines";
                        "when" = "editorTextFocus && editorLangId == 'rust'";
                    }
                    {
                        "key" = "ctrl+shift+u";
                        "command" = "-rust-analyzer.parentModule";
                        "when" = "editorTextFocus && editorLangId == 'rust'";
                    }
                    {
                        "key" = "alt+-";
                        "command" = "-decreaseSearchEditorContextLines";
                        "when" = "inSearchEditor";
                    }
                    {
                        "key" = "ctrl+shift+backspace";
                        "command" = "-search.searchEditor.action.deleteFileResults";
                        "when" = "inSearchEditor";
                    }
                    {
                        "key" = "shift+alt+0";
                        "command" = "-increaseSearchEditorContextLines";
                        "when" = "inSearchEditor";
                    }
                    {
                        "key" = "alt+enter";
                        "command" = "-search.action.openInEditor";
                        "when" = "hasSearchResult && searchViewletFocus";
                    }
                    {
                        "key" = "ctrl+shift+r";
                        "command" = "-rerunSearchEditorSearch";
                        "when" = "inSearchEditor";
                    }
                    {
                        "key" = "ctrl+shift+l";
                        "command" = "-selectAllSearchEditorMatches";
                        "when" = "inSearchEditor";
                    }
                    {
                        "key" = "alt+l";
                        "command" = "-toggleSearchEditorContextLines";
                        "when" = "inSearchEditor";
                    }
                    {
                        "key" = "alt+c";
                        "command" = "-toggleSearchEditorCaseSensitive";
                        "when" = "inSearchEditor && searchInputBoxFocus";
                    }
                    {
                        "key" = "alt+w";
                        "command" = "-toggleSearchEditorWholeWord";
                        "when" = "inSearchEditor && searchInputBoxFocus";
                    }
                    {
                        "key" = "alt+r";
                        "command" = "-toggleSearchEditorRegex";
                        "when" = "inSearchEditor && searchInputBoxFocus";
                    }
                    {
                        "key" = "ctrl+shift+f";
                        "command" = "-workbench.action.findInFiles";
                    }
                    {
                        "key" = "f4";
                        "command" = "-search.action.focusNextSearchResult";
                        "when" = "hasSearchResult || inSearchEditor";
                    }
                    {
                        "key" = "shift+f4";
                        "command" = "-search.action.focusPreviousSearchResult";
                        "when" = "hasSearchResult || inSearchEditor";
                    }
                    {
                        "key" = "ctrl+shift+h";
                        "command" = "-workbench.action.replaceInFiles";
                    }
                    {
                        "key" = "ctrl+a";
                        "command" = "-editor.action.selectAll";
                    }
                    {
                        "key" = "ctrl+shift+l";
                        "command" = "-editor.action.selectHighlights";
                        "when" = "editorFocus";
                    }
                    {
                        "key" = "ctrl+k ctrl+k";
                        "command" = "-editor.action.selectFromAnchorToCursor";
                        "when" = "editorTextFocus && selectionAnchorSet";
                    }
                    {
                        "key" = "ctrl+k ctrl+b";
                        "command" = "-editor.action.setSelectionAnchor";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "alt+f1";
                        "command" = "-editor.action.showAccessibilityHelp";
                    }
                    {
                        "key" = "shift+alt+f1";
                        "command" = "-editor.action.showAccessibilityHelp";
                    }
                    {
                        "key" = "shift+f10";
                        "command" = "-editor.action.showContextMenu";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+k ctrl+i";
                        "command" = "-editor.action.showHover";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "alt+f3";
                        "command" = "-editor.action.dirtydiff.next";
                        "when" = "editorTextFocus && !textCompareEditorActive";
                    }
                    {
                        "key" = "shift+alt+f3";
                        "command" = "-editor.action.dirtydiff.previous";
                        "when" = "editorTextFocus && !textCompareEditorActive";
                    }
                    {
                        "key" = "shift+alt+left";
                        "command" = "-editor.action.smartSelect.shrink";
                        "when" = "editorTextFocus";
                    }
                    {
                        "key" = "ctrl+shift+f2";
                        "command" = "-editor.action.linkedEditing";
                        "when" = "editorHasRenameProvider && editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+shift+b";
                        "command" = "-workbench.action.tasks.build";
                    }
                    {
                        "key" = "ctrl+meta+w";
                        "command" = "-workbench.action.toggleTabsVisibility";
                    }
                    {
                        "key" = "ctrl+shift+0";
                        "command" = "-workbench.action.zoomIn";
                    }
                    {
                        "key" = "ctrl+numpad_subtract";
                        "command" = "-workbench.action.zoomOut";
                    }
                    {
                        "key" = "ctrl+numpad_add";
                        "command" = "-workbench.action.zoomIn";
                    }
                    {
                        "key" = "ctrl+k shift+enter";
                        "command" = "-workbench.action.unpinEditor";
                        "when" = "activeEditorIsPinned";
                    }
                    {
                        "key" = "ctrl+shift+7";
                        "command" = "-editor.action.commentLine";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+m";
                        "command" = "-editor.action.toggleTabFocusMode";
                    }
                    {
                        "key" = "ctrl+k ctrl+l";
                        "command" = "-editor.toggleFold";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+shift+a";
                        "command" = "-editor.action.blockComment";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "shift+alt+0";
                        "command" = "-workbench.action.toggleEditorGroupLayout";
                    }
                    {
                        "key" = "ctrl+shift+space";
                        "command" = "-editor.action.triggerParameterHints";
                        "when" = "editorHasSignatureHelpProvider && editorTextFocus";
                    }
                    {
                        "key" = "ctrl+i";
                        "command" = "-editor.action.triggerSuggest";
                        "when" = "editorHasCompletionItemProvider && textInputFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+space";
                        "command" = "-editor.action.triggerSuggest";
                        "when" = "editorHasCompletionItemProvider && textInputFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+k ctrl+x";
                        "command" = "-editor.action.trimTrailingWhitespace";
                        "when" = "editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+z";
                        "command" = "-undo";
                    }
                    {
                        "key" = "ctrl+k f";
                        "command" = "-workbench.action.closeFolder";
                        "when" = "emptyWorkspaceSupport && workbenchState != 'empty'";
                    }
                    {
                        "key" = "ctrl+k ctrl+j";
                        "command" = "-editor.unfoldAll";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+9";
                        "command" = "-editor.unfoldAllMarkerRegions";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+shift+0";
                        "command" = "-editor.unfoldAllExcept";
                        "when" = "editorTextFocus && foldingEnabled";
                    }
                    {
                        "key" = "ctrl+shift+i";
                        "command" = "-editor.action.formatDocument";
                        "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
                    }
                    {
                        "key" = "shift+alt+[IntlBackslash]";
                        "command" = "-editor.action.autoFix";
                        "when" = "editorTextFocus && !editorReadonly && supportedCodeAction =~ /(\\s|^)quickfix\\b/";
                    }
                    {
                        "key" = "ctrl+[Period]";
                        "command" = "-editor.action.quickFix";
                        "when" = "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly";
                    }
                    {
                        "key" = "ctrl+home";
                        "command" = "-cursorTop";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "up";
                        "command" = "-cursorUp";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "pageup";
                        "command" = "-cursorPageUp";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "left";
                        "command" = "-cursorLeft";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+end";
                        "command" = "-cursorBottom";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "down";
                        "command" = "-cursorDown";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "end";
                        "command" = "-cursorEnd";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "home";
                        "command" = "-cursorHome";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "right";
                        "command" = "-cursorRight";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+left";
                        "command" = "-cursorWordLeft";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+right";
                        "command" = "-cursorWordEndRight";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+up";
                        "command" = "-cursorUpSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+shift+home";
                        "command" = "-cursorTopSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+right";
                        "command" = "-cursorRightSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+pageup";
                        "command" = "-cursorPageUpSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+shift+l";
                        "command" = "-addCursorsAtSearchResults";
                        "when" = "fileMatchOrMatchFocus && searchViewletVisible";
                    }
                    {
                        "key" = "ctrl+shift+end";
                        "command" = "-cursorBottomSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+down";
                        "command" = "-cursorColumnSelectDown";
                        "when" = "editorColumnSelection && textInputFocus";
                    }
                    {
                        "key" = "shift+left";
                        "command" = "-cursorColumnSelectLeft";
                        "when" = "editorColumnSelection && textInputFocus";
                    }
                    {
                        "key" = "shift+pagedown";
                        "command" = "-cursorColumnSelectPageDown";
                        "when" = "editorColumnSelection && textInputFocus";
                    }
                    {
                        "key" = "shift+pageup";
                        "command" = "-cursorColumnSelectPageUp";
                        "when" = "editorColumnSelection && textInputFocus";
                    }
                    {
                        "key" = "shift+right";
                        "command" = "-cursorColumnSelectRight";
                        "when" = "editorColumnSelection && textInputFocus";
                    }
                    {
                        "key" = "shift+up";
                        "command" = "-cursorColumnSelectUp";
                        "when" = "editorColumnSelection && textInputFocus";
                    }
                    {
                        "key" = "shift+down";
                        "command" = "-cursorDownSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+end";
                        "command" = "-cursorEndSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+home";
                        "command" = "-cursorHomeSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+left";
                        "command" = "-cursorLeftSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "pagedown";
                        "command" = "-cursorPageDown";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+pagedown";
                        "command" = "-cursorPageDownSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+shift+right";
                        "command" = "-cursorWordEndRightSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "ctrl+shift+left";
                        "command" = "-cursorWordLeftSelect";
                        "when" = "textInputFocus";
                    }
                    {
                        "key" = "shift+escape";
                        "command" = "-removeSecondaryCursors";
                        "when" = "editorHasMultipleSelections && textInputFocus";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "-workbench.action.togglePanel";
                    }
                    {
                        "key" = "ctrl+[Period]";
                        "command" = "-problems.action.showQuickFixes";
                        "when" = "problemFocus";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "list.focusDown";
                        "when" = "listFocus && !inputFocus";
                    }
                    {
                        "key" = "j";
                        "command" = "-list.focusDown";
                        "when" = "listFocus && !inputFocus";
                    }
                    {
                        "key" = "k";
                        "command" = "-list.focusUp";
                        "when" = "listFocus && !inputFocus";
                    }
                    {
                        "key" = "ctrl+l";
                        "command" = "list.select";
                        "when" = "listFocus && !inputFocus";
                    }
                    {
                        "key" = "j";
                        "command" = "list.focusDown";
                        "when" = "listFocus && !inputFocus";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "workbench.action.quickOpenSelectNext";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "workbench.action.quickOpenSelectPrevious";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "history.showNext";
                        "when" = "historyNavigationForwardsEnabled && historyNavigationWidget && !suggestWidgetVisible";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "interactive.history.next";
                        "when" = "!suggestWidgetVisible && resourceScheme == 'vscode-interactive' && interactiveInputCursorAtBoundary != 'none' && interactiveInputCursorAtBoundary != 'top'";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "list.focusDown";
                        "when" = "listFocus && !inputFocus";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "notifications.focusNextToast";
                        "when" = "notificationFocus && notificationToastsVisible";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "scm.viewNextCommit";
                        "when" = "scmInputIsInLastPosition && scmRepository && !suggestWidgetVisible";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "selectNextSuggestion";
                        "when" = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "settings.action.focusSettingsFile";
                        "when" = "inSettingsSearch && !suggestWidgetVisible";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "settings.action.focusSettingsFromSearch";
                        "when" = "inSettingsSearch && !suggestWidgetVisible";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "showNextParameterHint";
                        "when" = "editorFocus && parameterHintsMultipleSignatures && parameterHintsVisible";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "workbench.action.interactivePlayground.arrowDown";
                        "when" = "interactivePlaygroundFocus && !editorTextFocus";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "workbench.banner.focusNextAction";
                        "when" = "bannerFocused";
                    }
                    {
                        "key" = "j ctrl";
                        "command" = "workbench.statusBar.focusNext";
                        "when" = "statusBarFocused";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "extension.vim_up";
                        "when" = "editorTextFocus && vim.active && !inDebugRepl && !parameterHintsVisible && !suggestWidgetVisible";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "history.showPrevious";
                        "when" = "historyNavigationBackwardsEnabled && historyNavigationWidget && !suggestWidgetVisible";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "notifications.focusPreviousToast";
                        "when" = "notificationFocus && notificationToastsVisible";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "list.focusUp";
                        "when" = "listFocus && !inputFocus";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "scm.viewPreviousCommit";
                        "when" = "scmInputIsInFirstPosition && scmRepository && !suggestWidgetVisible";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "showPrevParameterHint";
                        "when" = "editorFocus && parameterHintsMultipleSignatures && parameterHintsVisible";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "showPrevParameterHint";
                        "when" = "editorFocus && parameterHintsMultipleSignatures && parameterHintsVisible";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "workbench.action.interactivePlayground.arrowUp";
                        "when" = "interactivePlaygroundFocus && !editorTextFocus";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "workbench.banner.focusPreviousAction";
                        "when" = "bannerFocused";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "workbench.statusBar.focusPrevious";
                        "when" = "statusBarFocused";
                    }
                    {
                        "key" = "ctrl+shift+m";
                        "command" = "-workbench.actions.view.problems";
                        "when" = "workbench.panel.markers.view.active";
                    }
                    {
                        "key" = "space e";
                        "command" = "workbench.actions.view.problems";
                        "when" = "problemFocus";
                    }
                    {
                        "key" = "ctrl+j";
                        "command" = "problems.action.focusProblemsFromFilter";
                        "when" = "problemsFilterFocus";
                    }
                    {
                        "key" = "ctrl+down";
                        "command" = "-problems.action.focusProblemsFromFilter";
                        "when" = "problemsFilterFocus";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "problems.action.focusProblemsFromFilter";
                        "when" = "problemsFilterFocus";
                    }
                    {
                        "key" = "ctrl+w";
                        "command" = "-workbench.action.closeActiveEditor";
                    }
                    {
                        "key" = "ctrl+w";
                        "command" = "-workbench.action.terminal.killEditor";
                        "when" = "terminalEditorFocus && terminalFocus && terminalHasBeenCreated && resourceScheme == 'vscode-terminal' || terminalEditorFocus && terminalFocus && terminalProcessSupported && resourceScheme == 'vscode-terminal'";
                    }
                    {
                        "key" = "ctrl+w";
                        "command" = "-workbench.action.closeGroup";
                        "when" = "activeEditorGroupEmpty && multipleEditorGroups";
                    }
                    {
                        "key" = "ctrl+f";
                        "command" = "problems.action.focusProblemsFromFilter";
                        "when" = "problemsFilterFocus";
                    }
                    {
                        "key" = "ctrl+k z";
                        "command" = "-workbench.action.toggleZenMode";
                    }
                    {
                        "key" = "alt+z";
                        "command" = "-editor.action.toggleWordWrap";
                    }
                    {
                        "key" = "ctrl+shift+x";
                        "command" = "-workbench.view.extensions";
                        "when" = "viewContainer.workbench.view.extensions.enabled";
                    }
                    {
                        "key" = "ctrl+k ctrl+p";
                        "command" = "-workbench.action.showAllEditors";
                    }
                    {
                        "key" = "ctrl+l";
                        "command" = "breadcrumbs.focusNextWithPicker";
                        "when" = "breadcrumbsActive && breadcrumbsVisible && listFocus && !inputFocus";
                    }
                    {
                        "key" = "ctrl+h";
                        "command" = "breadcrumbs.focusPreviousWithPicker";
                        "when" = "breadcrumbsActive && breadcrumbsVisible && listFocus && !inputFocus";
                    }
                    {
                        "key" = "k";
                        "command" = "list.focusUp";
                        "when" = "listFocus && !inputFocus";
                    }
                    {
                        "key" = "ctrl+shift+backspace";
                        "command" = "workbench.action.showCommands";
                    }
                    {
                        "key" = "ctrl+shift+p";
                        "command" = "-workbench.action.showCommands";
                    }
                    {
                        "key" = "ctrl+shift+p";
                        "command" = "breadcrumbs.focus";
                        "when" = "breadcrumbsPossible";
                    }
                    {
                        "key" = "ctrl+shift+[Period]";
                        "command" = "-breadcrumbs.focus";
                        "when" = "breadcrumbsPossible";
                    }
                    {
                        "key" = "j";
                        "command" = "breadcrumbs.selectFocused";
                        "when" = "breadcrumbsActive && breadcrumbsVisible && !listFocus";
                    }
                    {
                        "key" = "h";
                        "command" = "breadcrumbs.focusPrevious";
                        "when" = "breadcrumbsActive && breadcrumbsVisible && !listFocus";
                    }
                    {
                        "key" = "ctrl+shift+[IntlBackslash]";
                        "command" = "-breadcrumbs.toggleToOn";
                        "when" = "!config.breadcrumbs.enabled";
                    }
                    {
                        "key" = "l";
                        "command" = "breadcrumbs.focusNext";
                        "when" = "breadcrumbsActive && breadcrumbsVisible && !listFocus";
                    }
                    {
                        "key" = "ctrl+h";
                        "command" = "breadcrumbs.focusPrevious";
                        "when" = "breadcrumbsActive && breadcrumbsVisible";
                    }
                    {
                        "key" = "ctrl+l";
                        "command" = "breadcrumbs.focusNext";
                        "when" = "breadcrumbsActive && breadcrumbsVisible";
                    }
                    {
                        "key" = "ctrl+right";
                        "command" = "-breadcrumbs.focusNext";
                        "when" = "breadcrumbsActive && breadcrumbsVisible";
                    }
                    {
                        "key" = "ctrl+k ctrl+shift+w";
                        "command" = "-workbench.action.closeAllGroups";
                    }
                    {
                        "key" = "ctrl+k ctrl+w";
                        "command" = "-workbench.action.closeAllEditors";
                    }
                    {
                        "key" = "ctrl+k w";
                        "command" = "-workbench.action.closeEditorsInGroup";
                    }
                    {
                        "key" = "ctrl+k u";
                        "command" = "-workbench.action.closeUnmodifiedEditors";
                    }
                    {
                        "key" = "ctrl+k ctrl+up";
                        "command" = "-workbench.action.focusAboveGroup";
                    }
                    {
                        "key" = "ctrl+k ctrl+down";
                        "command" = "-workbench.action.focusBelowGroup";
                    }
                    {
                        "key" = "ctrl+k ctrl+left";
                        "command" = "-workbench.action.focusLeftGroup";
                    }
                    {
                        "key" = "ctrl+k ctrl+right";
                        "command" = "-workbench.action.focusRightGroup";
                    }
                    {
                        "key" = "ctrl+k down";
                        "command" = "-workbench.action.moveActiveEditorGroupDown";
                    }
                    {
                        "key" = "ctrl+k left";
                        "command" = "-workbench.action.moveActiveEditorGroupLeft";
                    }
                    {
                        "key" = "ctrl+k right";
                        "command" = "-workbench.action.moveActiveEditorGroupRight";
                    }
                    {
                        "key" = "ctrl+k up";
                        "command" = "-workbench.action.moveActiveEditorGroupUp";
                    }
                    {
                        "key" = "ctrl+1";
                        "command" = "-workbench.action.focusFirstEditorGroup";
                    }
                    {
                        "key" = "ctrl+k enter";
                        "command" = "-workbench.action.keepEditor";
                    }
                    {
                        "key" = "shift+alt+1";
                        "command" = "-workbench.action.moveEditorToFirstGroup";
                    }
                    {
                        "key" = "shift+alt+9";
                        "command" = "-workbench.action.moveEditorToLastGroup";
                    }
                    {
                        "key" = "ctrl+alt+right";
                        "command" = "-workbench.action.moveEditorToNextGroup";
                    }
                    {
                        "key" = "ctrl+alt+left";
                        "command" = "-workbench.action.moveEditorToPreviousGroup";
                    }
                    {
                        "key" = "ctrl+shift+pageup";
                        "command" = "-workbench.action.moveEditorLeftInGroup";
                    }
                    {
                        "key" = "ctrl+shift+pagedown";
                        "command" = "-workbench.action.moveEditorRightInGroup";
                    }
                    {
                        "key" = "ctrl+9";
                        "command" = "-workbench.action.lastEditorInGroup";
                    }
                    {
                        "key" = "alt+0";
                        "command" = "-workbench.action.lastEditorInGroup";
                    }
                    {
                        "key" = "ctrl+pagedown";
                        "command" = "-workbench.action.nextEditor";
                    }
                    {
                        "key" = "ctrl+k ctrl+pagedown";
                        "command" = "-workbench.action.nextEditorInGroup";
                    }
                    {
                        "key" = "ctrl+pageup";
                        "command" = "-workbench.action.previousEditor";
                    }
                    {
                        "key" = "ctrl+k ctrl+pageup";
                        "command" = "-workbench.action.previousEditorInGroup";
                    }
                    {
                        "key" = "ctrl+k shift+enter";
                        "command" = "-workbench.action.pinEditor";
                        "when" = "!activeEditorIsPinned";
                    }
                    {
                        "key" = "ctrl+shift+tab";
                        "command" = "-workbench.action.quickOpenLeastRecentlyUsedEditorInGroup";
                        "when" = "!activeEditorGroupEmpty";
                    }
                    {
                        "key" = "ctrl+shift+t";
                        "command" = "-workbench.action.reopenClosedEditor";
                    }
                    #{
                    #    "key" = "ctrl+o";
                    #    "command" = "workbench.action.navigateBack";
                    #}
                    #{
                    #    "key" = "ctrl+i";
                    #    "command" = "workbench.action.navigateForward";
                    #}
                    {
                        "key" = "ctrl+shift+p";
                        "command" = "breadcrumbs.selectEditor";
                        "when" = "breadcrumbsActive && breadcrumbsVisible";
                    }
                    {
                        "key" = "ctrl+w";
                        "command" = "workbench.action.closeActiveEditor";
                        "when" = "!editorTextFocus || !vim.active";
                    }
                    {
                        "key" = "ctrl+k ctrl+i";
                        "command" = "-editor.debug.action.showDebugHover";
                        "when" = "editorTextFocus && inDebugMode";
                    }
                    {
                        "key" = "ctrl+shift+o";
                        "command" = "workbench.action.files.openFolder";
                    }
                    {
                        "key" = "l";
                        "command" = "list.expand";
                        "when" = "listFocus && treeElementCanExpand && !inputFocus || listFocus && treeElementHasChild && !inputFocus";
                    }
                    {
                        "key" = "ctrl+'";
                        "command" = "workbench.action.terminal.toggleTerminal";
                        "when" = "terminal.active";
                    }
                    {
                        "key" = "ctrl+`";
                        "command" = "-workbench.action.terminal.toggleTerminal";
                        "when" = "terminal.active";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "interactive.history.previous";
                        "when" = "!suggestWidgetVisible && resourceScheme == 'vscode-interactive' && interactiveInputCursorAtBoundary != 'bottom' && interactiveInputCursorAtBoundary != 'none'";
                    }
                    {
                        "key" = "ctrl+k";
                        "command" = "selectPrevSuggestion";
                        "when" = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
                    }
                ];

            


            userSettings = {
# Funny Json stuff
                "editor.fontLigatures" = false;
                "workbench.editor.untitled.hint" = "hidden";
                "workbench.colorTheme" = "Gruvbox Material Dark";
                "workbench.activityBar.visible" = false;
                "rust-analyzer.inlayHints.enable" = false;
                "editor.fontFamily" = "'Jetbrains Mono', 'monospace', monospace";
                "terminal.integrated.fontSize" = 12;
                "editor.formatOnSave" = true;
                "editor.cursorBlinking" = "solid";
                "rust-analyzer.lens.enable" = false;
                "editor.smoothScrolling" = true;
                "editor.inlineSuggest.enabled" = true;
                "workbench.startupEditor" = "none";
                "editor.scrollbar.verticalScrollbarSize" = 12;
                "editor.scrollbar.vertical" = "hidden";
                "editor.scrollbar.horizontal" = "hidden";
                "editor.overviewRulerBorder" = false;
                "extensions.ignoreRecommendations" = true;
                "vim.leader" = " ";
                "vim.incsearch" = true;
                "vim.hlsearch" = true;
                "editor.glyphMargin" = true;
#"git.decorations.enabled" = false;
                "editor.lineDecorationsWidth" = 16; # undocumented width for fold buttons / git indicators
# "editor.lineNumbersMinChars" = 0; # undocumented
                    "editor.folding" = true;
# Caps instead of escape
                "keyboard.dispatch" = "keyCode";
                "editor.bracketPairColorization.enabled" = false;
                "vim.visualModeKeyBindingsNonRecursive" = [
                {
                    "before" = [
                        "leader"
                            "m"
                            "v"
                    ];
                    "commands" = [
                        "keyboard-quickfix.openQuickFix"
                    ];
                }
                ];
                "vim.normalModeKeyBindingsNonRecursive" = [
                {
                    "before" = [
                        "leader"
                            "leader"
                    ];
                    "commands" = [];
                }
                {
                    "before" = [
                        "leader"
                            "l"
                    ];
                    "commands" = [
                        "workbench.action.nextEditorInGroup"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "h"
                    ];
                    "commands" = [
                        "workbench.action.previousEditorInGroup"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "b"
                            "w"
                    ];
                    "commands" = [
                        "workbench.action.closeActiveEditor"
                    ];
                }
                {
                    "before" = [
                        "g"
                            "h"
                    ];
                    "commands" = [];
                }
                {
                    "before" = [
                        "leader"
                            "m"
                            "a"
                    ];
                    "commands" = [
                        "editor.action.showHover"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "m"
                            "v"
                    ];
                    "commands" = [
                        "keyboard-quickfix.openQuickFix"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "m"
                            "f"
                    ];
                    "commands" = [
                        "editor.action.autoFix"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "m"
                            "g"
                    ];
                    "commands" = [
                        "editor.action.revealDefinition"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "m"
                            "d"
                    ];
                    "commands" = [
                        "editor.action.peekDefinition"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "e"
                    ];
                    "commands" = [
                        "workbench.actions.view.problems"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "o"
                    ];
                    "commands" = [
                        "vscode-fzf.rg"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "p"
                    ];
                    "commands" = [
                        "workbench.action.quickOpen"
                    ];
                }
                {
                    "before" = [
                        "leader"
                            "m"
                            "n"
                    ];
                    "commands" = [
                        "editor.action.rename"
                    ];
                }
                ];
# Weird
#"vim.handleKeys" = {
#    "<C-o>" = false
#    "<C-i>" = false
#};
                "editor.accessibilitySupport" = "off";
                "editor.guides.highlightActiveIndentation" = false;
                "workbench.colorCustomizations" = {
# OverviewRuler
# https =#github.com/microsoft/vscode/issues/85418
#"editorOverviewRuler.border" = "#0000";
                    "editorOverviewRuler.findMatchForeground" = "#fff4";
                    "editorOverviewRuler.rangeHighlightForeground" = "#0000";
                    "editorOverviewRuler.selectionHighlightForeground" = "#0000";
                    "editorOverviewRuler.wordHighlightForeground" = "#0000";
                    "editorOverviewRuler.wordHighlightStrongForeground" = "#0000";
                    "editorOverviewRuler.modifiedForeground" = "#0000";
                    "editorOverviewRuler.addedForeground" = "#0000";
                    "editorOverviewRuler.deletedForeground" = "#0000";
#"editorOverviewRuler.errorForeground" = "#0000ff";
#"editorOverviewRuler.warningForeground" = "#ff00ff";
#"editorOverviewRuler.infoForeground" = "#00ff00";
                    "editorOverviewRuler.bracketMatchForeground" = "#0000";
                    "statusBar.background" = "#fff0"; # The color is totally up to you
                        "statusBar.border" = "#aaa0";
                    "errorLens.errorBackground" = "#0000";
                    "errorLens.warningBackground" = "#0000";
                    "errorLens.infoBackground" = "#0000";
                    "errorLens.hintBackground" = "#0000";
# "errorLens.errorForeground" = "#ff0000";
                };
                "editor.lineNumbers" = "off";
                "errorLens.enabledDiagnosticLevels" = [
                    "error"
                        "info"
                ];
                "vscode-neovim.neovimExecutablePaths.linux" = "/bin/nvim";
                "vim.neovimPath" = "/bin/nvim";
                "breadcrumbs.symbolPath" = "last";
                "screencastMode.fontSize" = 25;
                "screencastMode.verticalOffset" = 5;
                "screencastMode.keyboardShortcutsFormat" = "keys";
                "editor.quickSuggestionsDelay" = 2;
                "editor.suggest.snippetsPreventQuickSuggestions" = false;
                "editor.minimap.enabled" = false;
                "window.menuBarVisibility" = "hidden";
#"errorLens.gutterIconsEnabled" = true;
            };
        };
    };
}
