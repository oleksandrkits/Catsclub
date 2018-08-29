
$(document).ready(
    function(){
        $('.image').each(
            function (index, element) {

                console.log($(element).attr('image_id'))
                $.ajax({
                    url: '/',
                    method: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $(element).attr('src', data.url)
                    }
                }
                )
            })
    }
)