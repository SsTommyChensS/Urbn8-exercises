function api(api) {
    api();
}

function api2(api2) {
    api2();
}

function api3(api3) {
    api3();
}

api(function(result = 1){
	console.log('result: ', result);
	api2(function(result2 = result + 1){
		console.log('result2: ', result2);
		api3(function(result3 = result2 + 1) {
			console.log('result3: ', result3);
		});
	});
});






