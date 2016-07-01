# Samples about Workflow Query

#### ［Before use the samples］1. Register Steedos account

#### ［Before use the samples］2. Install module 'request'
```
npm install request
```

#### Sample 1. Logging In
$vi login.js
```javascript
var request=require('request'); 
var options = { 
	headers: {}, 
	url: 'https://us.steedos.com/steedos/api/login', 
	method: 'POST', 
	json:true, 
	body: {	
		"email":"test@hotoa.com",	// please replace with space_admin's email 
		"password":"mypassword"		// please replace with space_admin's password 
	} 
}; 
function callback(error, response, data) { 
	if (!error && response.statusCode == 200) { 
		console.log(date); 
	} else {
		console.log(error); 
	}
} 
request(options, callback);
```
$node login.js
```
{ 
	status: 'success',
	data: 
	{ 
   		authToken: 'jgBXLvL76tVJbabcROeD77X3XJ',
     		userId: '5lwsda119wskssf',
     		adminSpaces: [ [Object] ] 
	} 
}
```

#### Sample 2.Create a draft query of 'Pay'
$vi create.js
```javascript
var request=require('request'); 
var options = { 
	headers: {
		"X-User-Id":"5358806b334904597d0047bb",   // please replace with space_admin's userid
		"X-Auth-Token":"FvVLIn6QaHJFEtgWb4hzF",   // please replace with space_admin's Token
		"X-Space-Id":"2834sa6b3sdahd29qdsds83"    // please replace with youe spaceid
	}, 
	url: 'https://us.steedos.com/uf/api/instances', 
	method: 'POST', 
	json:true, 
	body: {
		"flow":"41C6B157-3F52-43B2-AC43-60B065A703C3",    // please replace with your flowid
		"applicant": "5358806b334904597d0047bb",     // please replace with your userid 
		"values":{
		     "Payment Mode":"Wire transfer",
		     "Vendor Name":"HY Group",
		     "Invoice Amount":"10000.00"
		}
	}
}; 
function callback(error, response, data) { 
	if (!error && response.statusCode == 200) { 
		console.log('OK! InsanceID:',data.data.id);      // output ID of new insance
	} else {
		console.log(error); 
	}
} 
request(options, callback);
```
$node create.js
```
OK! InsanceID:567274398e296a1c3b0000a9
```

#### Sample 3. Submit query to next step
$vi submit.js
```javascript
var request=require('request'); 
var options = { 
	headers: {
		"X-User-Id":"5358806b334904597d0047bb",	  // please replace with space_admin's userid
		"X-Auth-Token":"FvVLIn6QaHJFEtgWb4hzF",  // please replace with space_admin's Token
		"X-Space-Id":"2834sa6b3sdahd29qdsds83"    // please replace with your spaceid
	}, 
	url: 'https://us.steedos.com/uf/api/instances/567274398e296a1c3b0000a1', // please replace with your InsanceID
	method: 'PUT', 
	json:true, 
	body: {
		"nextstep_name": "Manager Approval",		
		"nextstep_users": ["5199da568e296a4ba0000003"]		// please replace with userid of next step
	}
}; 
function callback(error, response, data) { 
	if (!error && response.statusCode == 200) { 
		console.log(data); 
	} else {
		console.log(error); 
	}
} 
request(options, callback);
```
$node submit.js
```
{ 
	status: 'success',
	data:		// Details of this instance
	{ applicant: '5358806b334904597d0047bb',	
	......
	}
}
```

#### Sample 4. Query instance details
$vi get.js
```javascript
var request=require('request'); 
var options = { 
	headers: {
		"X-User-Id":"5358806b334904597d0047bb",  // please replace with space_admin's userid
		"X-Auth-Token":"FvVLIn6QaHJFEtgWb4hzF",  // please replace with space_admin's Token
		"X-Space-Id":"2834sa6b3sdahd29qdsds83"   // please replace with your spaceid
	}, 
	url: 'https://us.steedos.com/uf/api/instances/567274398e296a1c3b0000a1', // please replace with your InsanceID
	method: 'GET', 
	json:true	
}; 
function callback(error, response, data) { 
	if (!error && response.statusCode == 200) { 
		console.log(data); 
	} else {
		console.log(error); 
	}
} 
request(options, callback);
```
$node get.js
```
{ 
	status: 'success',
	data: 		// Details of this instance
	{ applicant: '5358806b334904597d0047bb',
	......
	}
}
```

#### Sample 5. Get my pending query list
$vi pending.js
```javascript
var request=require('request'); 
var options = { 
	headers: {
		"X-User-Id":"5358806b334904597d0047bb",  // please replace with space_admin's userid
		"X-Auth-Token":"FvVLIn6QaHJFEtgWb4hzF",  // please replace with space_admin's Token
		"X-Space-Id":"2834sa6b3sdahd29qdsds83"   // please replace with your spaceid
	}, 
	url: 'https://us.steedos.com/uf/api/instances?state=pending&userid=sjdhfksfsadfs3ds', 
	method: 'GET', 
	json:true, 
	body: {} 
}; 
function callback(error, response, data) { 
	if (!error && response.statusCode == 200) { 
		console.log(data); 
	} else {
		console.log(error); 
	}
} 
request(options, callback);
```
$node pending.js
```
{
  status: 'success',
  data: [
    {
      id: '567274398e296a1c3b0000a1', 
      ......      
    },
    {
      ......     
    }
  ]
}
```
