'use strict';
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';
var join = require('path').join;
var jsonConfigContent = require('../config.json');
var compile = require('es6-template-strings/compile');
var resolveToString = require('es6-template-strings/resolve-to-string');

// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {

    // Use the console to output diagnostic information (console.log) and errors (console.error)
    // This line of code will only be executed once when your extension is activated
    console.log('Congratulations, your extension "customwebview" is now active!');

    // The command has been defined in the package.json file
    // Now provide the implementation of the command with  registerCommand
    // The commandId parameter must match the command field in package.json
    let disposable = vscode.commands.registerCommand('extension.sayHello', () => {
        const editor = vscode.window.activeTextEditor;
        if (!editor || !editor.viewColumn) { return; }
        let column = editor.viewColumn ? editor.viewColumn + 1 : 1;
        const panel = vscode.window.createWebviewPanel(
            'id', "Title", column, { enableScripts: true }
        );

        let htmlPath = join(__dirname, '../index.html');
        vscode.workspace.openTextDocument(htmlPath).then((textDoc) => {
            const txt = textDoc.getText();
            panel.webview.html = txt;
        }, (err) => {
            vscode.window.showErrorMessage("Cannot open: " + htmlPath);
        });
    });

    context.subscriptions.push(disposable);
}

// this method is called when your extension is deactivated
export function deactivate() {
}