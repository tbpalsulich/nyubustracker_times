set_toggle_tree_on_click = () ->
    $('label.tree-toggler').click () ->
        $(this).parent().children('ul.tree').toggle(300);
        if $(this).hasClass "glyphicon-minus"
            $(this).addClass("glyphicon-plus").removeClass("glyphicon-minus")
        else
            $(this).removeClass("glyphicon-plus").addClass("glyphicon-minus")

display_json = (id) ->
    json = gon.stops[id]["times"]
    $("#stop_name").text json["stop"]
    $("#stop_id").text json["stop_id"]
    $("#times").empty()
    $("#times").append '
        <label class="tree-toggler nav-header glyphicon-minus">Times:</label>
        <ul class="nav nav-list tree">' +
            add_all_times(json) +
        '</ul>'
    set_toggle_tree_on_click()


add_all_times = (json) ->
    result = ''
    $.each json["routes"], (routeId, routeJson) ->
        result += '
            <li>
                <label class="tree-toggler nav-header glyphicon-minus">' + routeJson["route"] + ': ' + routeId + '</label>
                <ul class="nav nav-list tree">' +
                    add_times_of_route(routeJson, "Weekday") +
                    add_times_of_route(routeJson, "Friday") +
                    add_times_of_route(routeJson, "Weekend") +
                '</ul>
            </li>
            '
    return result

add_times_of_route = (routeJson, timeOfWeek) ->
    result = '
        <li>
            <label class="tree-toggler nav-header glyphicon-minus">Weekend</label>
            <ul class="nav nav-list tree">'
    times = routeJson[timeOfWeek]
    if typeof times != "undefined"
        $.each times, (key, time) ->
            result += "<li>" + time + "</li>"
    result += '
            </ul>
        </li>'
    return result

$ () ->
    $("a.stop_link").click () ->
        display_json($(this).attr('id'))
    set_toggle_tree_on_click()