function api(api) {
	return new Promise((resolve) => {
		resolve(api);
	})
}

function api2(api2) {
	return new Promise((resolve) => {
		resolve(api2);
	})
}

function api3(api3) {
	return new Promise((resolve) => {
		resolve(api3);
	})
}

api(1).then((result) => {
	console.log('result: ', result);
	return api2(result + 1);
}).then((result2) => {
	console.log('result2: ', result2);
	return api3(result2 + 1);
}).then((result3) => {
	console.log('result3: ', result3);
});
