$ () ->
    if document.getElementById "jsoneditor"
        json = gon.stop_times

        container = document.getElementById "jsoneditor"
        editor = new JSONEditor container

        editor.set json

        json = editor.get
