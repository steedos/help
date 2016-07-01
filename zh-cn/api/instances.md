# 申请单

权限：仅space的管理员可以调用以下接口。

#### 新建申请单

目标：创建某申请单，同时传入某些字段值和子表字段值。

Request:
```bash
curl -X POST https://cn.steedos.com/uf/api/instances -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" 
     -H "X-User-Id: fbdpsNf4oHiX79vMJ" -H "X-Space-Id: wsw1re12TdeP223sC"
```
```json
{
  "flow": "8hdjk8skas8sdsa",
  "applicant": "sjad832jhewd8",
  "values": { 
    "field_name_1": "valueoffield1",
    "field_name_2": "valueoffield2",
    "field_name_3": "valueoffield3",
    "subtable_name_1":[
      {
        "subfield_name_1": "valueofsubfield1",
        "subfield_name_2": "valueofsubfield2",
        "subfield_name_3": "valueofsubfield3"
      },
      {
        "subfield_name_1": "valueofsubfield1-2",
        "subfield_name_2": "valueofsubfield2-2",
        "subfield_name_3": "valueofsubfield3-2"
      }
    ]
  }
}

```
备注：

（1）"flow"为流程ID，"applicant"为提交者ID，"values"内为传入的表单详情，包括字段及其值。

（2）"values"下传入的字段名、字段值一定要与实际表单匹配！如果有误，因为接口所在的服务器端程序无法校验数据完整与格式类型，可能会导致表单显示异常。

Response:

（1）成功：返回status为”success”，data为一个Instance Object即申请单对象

```json
{
  "status": "success",
  "data": {
    "id": "jdhas8sdsjasasad",
    "space": "sakd89s8d9sdksfa",
    "flow": "98sdfasd9ssdaff",
    "form": "kjsahdfkdsa78sd",
    "name": "answer of MIT",
    "applicant": "8wewqweqs8dafskw",  
    "applicant_name": "MJ",
    "applicant_organization": "82134kehfqw8awwer",
    "applicant_organization_name": "Sales",
    "submit_date": "2015-10-08T08:16:53.541Z",
    "values": {
      "field_name_1": "valueoffield1",
      "field_name_2": "valueoffield2",
    },
    "traces": [
      {  
        "id": "876asas88sakjdasfk",
        ......
      }
    ]     
  }
}
```
备注："id"为申请单instanceID，"space"为工作区spaceID，"flow"为流程flowID，"form"为表单formID，"name":为标题，"applicant"为申请者userID，"applicant_name"为申请者姓名，"applicant_organization":为申请者所在部门ID，"applicant_organization_name"为申请者所在部门，"submit_date"为提交时间，"values"内为传入的表单详情，包括字段及其值，"traces"内为签核历程信息。

（2）失败：返回status为"fail"，message为出错详细信息.
```json
{
  "status": "fail",
  "message": "Session Expired"
}
```


#### 查看待办文件

目标：取得某用户的待办事项列表。

Request:
```bash
curl -X GET https://cn.steedos.com/uf/api/instances?state=pending&userid=aksjhkdshasd 
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

Response:

(1)成功，则返回status为”success”，data为数组，含多个待办，即

```json
{
  "status": "success",
  "data": [
    {
      "id": "oFpdgAMMr123A7P3a", 
      "flow_name": "buy ITC",
      "space_name": "mycompany",
      "name": "HP Printer", 
      "applicant_name": "Adam", 
      "applicant_organization_name": "Sales", 
      "submit_date": "2015-09-26T08:22:53.541Z", 
      "step_name":"Department Manager Review"      
    },
    {
      "id": "XoMMENu5hEe63XdTP", 
      "flow_name": "buy ITC",
      "space_name": "mycompany",
      "name": "DELL X218", 
      "applicant_name": "Cherry Chen", 
      "applicant_organization_name": "IT", 
      "submit_date": "2015-09-27T10:18:53.541Z", 
      "step_name":"Office Comfirm"      
    }
  ]
}
```
备注："id"为申请单instanceID，"space_name"为工作区名，"flow_name"为流程名，"name"为标题，"applicant_name"为申请者姓名，"applicant_organization_name"为申请者所在部门，"submit_date"为提交时间，"step_name"为当前步骤名。

（2）失败：返回status为"fail"，message为出错详细信息.
```json
{
  "status": "fail",
  "message": "state is null"
}
```

#### 查看申请单详情

目标：取得某申请单详细信息，包括表单、附件、签核历程等。

Request:
```bash
curl -X GET https://cn.steedos.com/uf/api/instances/oFpdgAMMr7F5A7P3a 
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

备注：URL中的"oFpdgAMMr7F5A7P3a"为申请单instance的ID 。

Response:

(1)成功，则返回status为”success”，data为一个Instance Object即申请单对象

```json
{
  "status": "success",
  "data": {
    "id": "jdhas8sdsjasasad",
    "space": "sakd89s8d9sdksfa",
    "flow": "98sdfasd9ssdaff",
    "form": "kjsahdfkdsa78sd",
    "name": "answer of MIT",
    "applicant": "8wewqweqs8dafskw",  
    "applicant_name": "MJ",
    "applicant_organization": "82134kehfqw8awwer",
    "applicant_organization_name": "Sales",
    "submit_date": "2015-10-08T08:16:53.541Z",
    "values": {
      "field_name_1": "valueoffield1",
      "field_name_2": "valueoffield2",
    },
    "traces": [
      {  
        "id": "sahdsj89sdfkjs8sfas",
        ......
      }
    ]     
  }
}
```
备注："id"为申请单instanceID，"space"为工作区spaceID，"flow"为流程flowID，"form"为表单formID，"name":为标题，"applicant"为申请者userID，"applicant_name"为申请者姓名，"applicant_organization":为申请者所在部门ID，"applicant_organization_name"为申请者所在部门，"submit_date"为提交时间，"values"内为传入的表单详情，包括字段及其值，"traces"内为签核历程信息。

（2）失败：返回status为"fail"，message为出错详细信息.
```json
{
  "status": "fail",
  "message": "instance is not found"
}
```

#### 提交申请单

目标：提交某申请单，同时指定下一步骤及其处理人。

Request:
```bash
curl -X POST https://cn.steedos.com/uf/api/instances/oFpdgAMMr7F5A7P3a 
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```
```json
{
  "nextstep_name": "Manager Approval",
  "nextstep_users": ["aFpdgAMMr7F5A7P3a"]
}
```
备注：URL中的"oFpdgAMMr7F5A7P3a"为申请单instance的ID，"nextstep_name"为下一步骤名，"nextstep_users"为数组，包含下一步骤处理人的userID 。

Response:

(1)成功，则返回status为”success”，data为一个Instance Object即申请单对象

```json
{
  "status": "success",
  "data": {
    "id": "jdhas8sdsjasasad",
    "space": "sakd89s8d9sdksfa",
    "flow": "98sdfasd9ssdaff",
    "form": "kjsahdfkdsa78sd",
    "name": "answer of MIT",
    "applicant": "8wewqweqs8dafskw",  
    "applicant_name": "MJ",
    "applicant_organization": "82134kehfqw8awwer",
    "applicant_organization_name": "Sales",
    "submit_date": "2015-10-08T08:16:53.541Z",
    "values": {
      "field_name_1": "valueoffield1",
      "field_name_2": "valueoffield2",
    },
    "traces": [
      {  
        "id": "ksafsdsd899sdfsdkf",
        ......
      }
    ]     
  }
}
```
备注："id"为申请单instanceID，"space"为工作区spaceID，"flow"为流程flowID，"form"为表单formID，"name":为标题，"applicant"为申请者userID，"applicant_name"为申请者姓名，"applicant_organization":为申请者所在部门ID，"applicant_organization_name"为申请者所在部门，"submit_date"为提交时间，"values"内为传入的表单详情，包括字段及其值，"traces"内为签核历程信息。

（2）失败：返回status为"fail"，message为出错详细信息.
```json
{
  "status": "fail",
  "message": "nextstep_users is null"
}
```
