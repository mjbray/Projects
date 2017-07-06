/**
 * Created by Margaret on 6/25/17.
 */

// ./main.js
var url = require('url')
var fs = require('fs')
var jsonfile = require('jsonfile')

const path= require('path')
const {app, BrowserWindow} = require('electron')
let win = null;
app.on('ready', function(){
  win = new BrowserWindow({width: 1000, height: 600})
  win.loadURL(url.format({
    pathname: path.join(__dirname, 'dist/index.html'),
    protocol: 'file:',
    slashes: true
  }));
  win.on('closed', function() {
    win = null;
  });

});

app.on('activate', () => {
  if (win === null) {
    createWindow()
  }
});

app.on('window-all-closed', function() {
  if (process.platform != 'darwin') {
    app.quit();
  }
});
