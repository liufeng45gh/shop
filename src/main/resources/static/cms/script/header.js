$(document).ready(function(){
    var data_send = {};

    var request =$.ajax({
       type: 'get',
       url: '/cms/get-me',
       data: data_send,
       dataType: 'json'
    });



    request.done(function(data) {
        $("#admin-nick-name").html(data.nickName);
    });

});