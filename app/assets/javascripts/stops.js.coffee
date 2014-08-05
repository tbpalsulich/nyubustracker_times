display_json = (editor, id) ->
    json = gon.stops[id]["times"]
    editor.set json
    $("#stop_name").text json["stop"]
    $("#stop_id").text json["stop_id"]

$ () ->
    container = document.getElementById "jsoneditor"
    editor = new JSONEditor container
    $("a.stop_link").click () ->
        display_json(editor, $(this).attr('id'))