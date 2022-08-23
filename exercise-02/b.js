function api() {
    return new Promise((resolve) => {
        resolve(1);
    })
}

function api2() {
    return new Promise((resolve) => {
        resolve(2);
    })
}

function api3() {
    return new Promise((resolve) => {
        resolve(3);
    })
}
api().then(function(result){
    console.log('result:', result);
    return api2();
}).then(function(result2){
    console.log('result2:', result2);
    return api3();
}).then(function(result3){
    console.log('result3:', result3);
     // do work
}).catch(function(error) {
     //handle any error that may occur before this point
}).then(function() {
     //do something whether there was an error or not
     //like hiding an spinner if you were performing an AJAX request.
});
