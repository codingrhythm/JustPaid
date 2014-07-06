
$(function(){

    $('.link').click(function(){
        var link = $(this).attr('link');
        show_view(link);
    });

    show_view('today');
});

function show_view(link){
    $('.view').hide();
    $('#'+link).show();
    add_history(link);
}

function add_history(link){
    var li = $('<li/>');
    li.html(link);
    $('.view-history').append(li);
    li.click(function(){
        $(this).nextAll('li').remove();
        $(this).remove();
        show_view($(this).html());
    });
}