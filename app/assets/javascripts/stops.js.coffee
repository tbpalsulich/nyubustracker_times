# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
console.log "In the js file"

$(document).ready () -> 
    container = document.getElementById "jsoneditor"
    editor = new JSONEditor(container)

    console.log gon.stop_times

    json = gon.stop_times
    editor.set json

    json = editor.get()