# 关于申请单的实例

#### ［前提］1.申请华炎云账号

#### ［前提］2.安装node的模块request
```
npm install request
```
#### ［实例］1.登录系统
$vi login.js
```javascript
var request=require('request'); 
var options = { 
	headers: {}, 
	url: 'https://cn.steedos.com/steedos/api/login', 
	method: 'POST', 
	json:true, 
	body: {	
		"email":"test@hotoa.com",	// 请替换为自己的email 
		"password":"mypassword"		// 请替换为自己的password 
	} 
}; 
function callback(error, response, data) { 
	if (!error && response.statusCode == 200) { 
		console.log('userid:',data.data.userId,', authToken:',data.data.authToken); 
	} else {
		console.log(error); 
	}
} 
request(options, callback);
```
$node login.js
```
userid: 5199da119e296a4ba0000001 , authToken: jgBXLvL76tVJbabcRKeMYb9ux_N4wZXpM8OeD77X3XJ
```

#### ［实例］2.创建"付款申请"
$vi create.js
```javascript
var request=require('request'); 
var options = { 
	headers: {
		"X-User-Id":"5358806b334904597d0047bb",   // 请替换为自己的userid
		"X-Auth-Token":"FvVLIn6QaHJFEtgWb4hzF",   // 请替换为自己的Token
		"X-Space-Id":"2834sa6b3sdahd29qdsds83"    // 请替换为自己的spaceid
	}, 
	url: 'https://cn.steedos.com/uf/api/instances', 
	method: 'POST', 
	json:true, 
	body: {
		"flow":"41C6B157-3F52-43B2-AC43-60B065A703C3",    // 请替换为自己的flowid
		"applicant": "5358806b334904597d0047bb",     // 请替换为自己的userid 
		"values":{
		     "发票类型":"增税专用发票",
		     "产品名称":"产品",
		     "付款金额":"10000.00",
		     "收款单位":"元"
		}
	}
}; 
function callback(error, response, data) { 
	if (!error && response.statusCode == 200) { 
		console.log('OK! InsanceID:',data.data.id);      // 输出新增加申请单的InsanceID
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

#### ［实例］3.提交"付款申请"
$vi submit.js
```javascript
var request=require('request'); 
var options = { 
	headers: {
		"X-User-Id":"5358806b334904597d0047bb",	  // 请替换为自己的userid
		"X-Auth-Token":"FvVLIn6QaHJFEtgWb4hzF",	  // 请替换为自己的Token
		"X-Space-Id":"2834sa6b3sdahd29qdsds83"    // 请替换为自己的spaceid
	}, 
	url: 'https://cn.steedos.com/uf/api/instances/567274398e296a1c3b0000a1', // 请替换为node create.js返回的InsanceID
	method: 'PUT', 
	json:true, 
	body: {
		"nextstep_name": "部门经理审批",		// 下一步骤名
		"nextstep_users": ["5199da568e296a4ba0000003"]		// 请替换为下一步处理人的userid
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
	data:		// 以下为申请单的详情 
	{ applicant: '5358806b334904597d0047bb',	
	......
	}
}
```

#### ［实例］4.查询"付款申请"
$vi get.js
```javascript
var request=require('request'); 
var options = { 
	headers: {
		"X-User-Id":"5358806b334904597d0047bb",	  // 请替换为自己的userid
		"X-Auth-Token":"FvVLIn6QaHJFEtgWb4hzF",   // 请替换为自己的Token
		"X-Space-Id":"2834sa6b3sdahd29qdsds83"    // 请替换为自己的spaceid
	}, 
	url: 'https://cn.steedos.com/uf/api/instances/567274398e296a1c3b0000a1', // 请替换为node create.js返回的InsanceID
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
	data: 		// 以下为申请单的详情
	{ applicant: '5358806b334904597d0047bb',
	......
	}
}
```

#### ［实例］5.查看我的待办事项
$vi pending.js
```javascript
var request=require('request'); 
var options = { 
	headers: {
		"X-User-Id":"5358806b334904597d0047bb",	  // 请替换为自己的userid
		"X-Auth-Token":"FvVLIn6QaHJFEtgWb4hzFe"	  // 请替换为自己的Token
		"X-Space-Id":"2834sa6b3sdahd29qdsds83"    // 请替换为自己的spaceid
	}, 
	url: 'https://cn.steedos.com/uf/api/instances?state=pending', 
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
