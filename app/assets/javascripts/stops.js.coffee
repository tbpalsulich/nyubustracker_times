display_json = (editor, id) ->
    if document.getElementById "jsoneditor"
        json = gon.stops[id]
        editor.set json
        json = editor.get

$ () ->
    container = document.getElementById "jsoneditor"
    editor = new JSONEditor container
    $("a.stop_link").click () ->
        display_json(editor, $(this).attr('id'))