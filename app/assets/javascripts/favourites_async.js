
$(document).ready(
    function(){
        $('.image').each(
            function (index, element) {
                $.ajax({
                    url: '/images/' + $(element).attr('image_id'),
                    method: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        console.log(index)
                        $(element).attr('src', data.url)
                    }
                }
                )
            })
    }
)