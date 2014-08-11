display_json = (id) ->
    json = gon.stops[id]["times"]
    $("#stop_name").text json["stop"]
    $("#stop_id").text json["stop_id"]
    $("#times").empty()
    $("#times").append '
        <label class="tree-toggler nav-header">Times:</label>
        <ul class="nav nav-list tree">' + 
            add_all_times(json) +
        '</ul>'

    $('label.tree-toggler').click () ->
        $(this).parent().children('ul.tree').toggle(300);

add_all_times = (json) ->
    result = ''
    $.each json["routes"], (key, value) ->
        result += '
            <li>
                <label class="tree-toggler nav-header">' + value["route"] + ': ' + key + '</label>
                <ul class="nav nav-list tree">
                    <li id="' + key + '_weekday"><label class="tree-toggler nav-header">Weekday</label>
                        <ul class="nav nav-list tree">' + add_times(value["Weekday"]) + '</ul></li>

                    <li id="' + key + '_friday"><label class="tree-toggler nav-header">Friday</label>
                        <ul class="nav nav-list tree">' + add_times(value["Friday"]) + '</ul></li>

                    <li id="' + key + '_weekend"><label class="tree-toggler nav-header">Weekend</label>
                        <ul class="nav nav-list tree">' + add_times(value["Weekend"]) + '</ul></li>
                </ul>
            </li>
            '
    return result

add_times = (times, id) ->
    result = ""
    if typeof times != "undefined"
        $.each times, (key, time) ->
            result += "<li>" + time + "</li>"
    return result

$ () ->
    $("a.stop_link").click () ->
        display_json($(this).attr('id'))