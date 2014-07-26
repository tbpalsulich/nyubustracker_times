# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ () -> 
    if document.getElementById "jsoneditor"
        json = gon.stop_times

        container = document.getElementById "jsoneditor"
        editor = new JSONEditor(container)

        editor.set json

        json = editor.get()