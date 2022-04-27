var express = require('express');
var app = express();
var request = require('request');

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

/* GET home page. */
app.get('/api/express', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

app.get('/api/express/secret', (req, res) => {
  res.json({ secret: process.env.MY_SECRET })
})

app.get('/api/express/add', (req, res) => {
  var operationResult = parseInt(req.query.num1) + parseInt(req.query.num2);
  postToBootStorage(req.query.num1, req.query.num2, "+", operationResult);
  res.json({ result: operationResult});
})

app.get('/api/express/subtract', (req, res) => {
  var operationResult = parseInt(req.query.num1) - parseInt(req.query.num2);
  postToBootStorage(req.query.num1, req.query.num2, "-", operationResult);
  res.json({ result: operationResult});
})

app.get('/api/express/healthz', (req, res) => {
  res.end()
})

/*
  Method to send post request to Srping Boot microservice
*/
function postToBootStorage(num1, num2, operation, result){
	var data = {
				"num1": num1,
				"num2": num2,
				"op": operation,
				"result": result
			   };
	
	console.log("Sending create operation request to Spring Boot service 'bootstorage'. Data = ", JSON.stringify(data));
	request({
	    url: "http://bootstorage-svc:5000/api/bootstorage/create",
	    method: "POST",
	    json: true,
	    body: data
	}, function (error, response, body){
		console.log("Received response from Spring Boot service 'bootstorage'");
		//console.log("response = " + JSON.stringify(response));
      	if(error){
        	console.log("error = " + error);
      	}
      	if(process.env.LOG_LEVEL == 'DEBUG'){
      		console.log("body = " + JSON.stringify(body));
      	}
	});
}

app.listen(3000, () => {
  console.log(`Example app listening at http://localhost:${3000}`)
})
