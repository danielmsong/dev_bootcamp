// $(document).ready(function(){
// 	$('#get_color').click(function(event) {
// 		event.preventDefault();
// 		$.post('/color', function(response){
// 			// var data = JSON.parse(response);
// 			// $('#color_me li:nth-child(' + data.cell + ')').css('background-color', data.color);
// 		// });
// 			$('#color_me li:nth-child(' + response.cell + ')').css('background-color', response.color);
// 		}, "json"); 
// 		// the 'json' on the above line is the optional dataType from jQuery docs. It allows you to parse automatically, rather than having var data= JSON.parse(response)
// 		// the 'json' on line 9 tell the server what kind of dataType it can 'receive'
// 	});
// });

$(document).ready(function(){
	$('#get_color').click(function(event) {
		event.preventDefault();
		$.post('/color', function(response){
			// var data = JSON.parse(response);
			// $('#color_me li:nth-child(' + data.cell + ')').css('background-color', data.color);
		// });
			$('#color_me li:nth-child(' + response.cell + ')').css('background-color', response.color);
		}, "json"); 
		// the 'json' on the above line is the optional dataType from jQuery docs. It allows you to parse automatically, rather than having var data= JSON.parse(response)
		// the 'json' on line 9 tell the server what kind of dataType it can 'receive'
	});
});