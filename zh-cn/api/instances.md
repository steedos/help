# 申请单

权限：仅space的管理员可以调用以下接口，需要在请求的headers中包含：
 - X-Space-Id

获取access_token：使用工作区管理员登录后，点击设置 - 高级设置 - API Token;使用创建或使用现有token 

#### 新建申请单

目标：创建某申请单，同时传入某些字段值和子表字段值。

Request:
```bash
curl -X POST https://cn.steedos.com/api/workflow/open/drafts?access_token=xxx
     -H "X-Space-Id: wsw1re12TdeP223sC"
```
```json
{
  "flow": "1ff12bc17e235503aff2c4c9",
  "applicant": "hPgDcEd9vKQxwndQR",
  "applicant_username": "MJ",
  "values": {
      "拟稿人": "MJ",
      "日期-时间": "",
      "日期": "",
      "文件标题": "日常费用报销",
      "下拉框": "",
      "多选": ""
  }
}

```
备注：

（1）"flow"为流程ID，"applicant"为提交者ID

（2）"applicant_username"为提交者用户名

（3）"values"下传入的字段名、字段值一定要与实际表单匹配！如果有误，因为接口所在的服务器端程序无法校验数据完整与格式类型，可能会导致表单显示异常

Response:

（1）成功：返回status为"success"，data为一个Instance Object即申请单对象

```json
{
    "status": "success",
    "data": {
        "_id": "eFEfXWncFYkwokkvb",
        "space": "Af8eM6mAHo7wMDqD3",
        "flow": "1ff12bc17e235503aff2c4c9",
        "flow_version": "7607654e-e87c-466d-83ad-012e4acff548",
        "form": "487abaae619d670cae9b26b3",
        "form_version": "c386d0c3-4ec0-4144-9c3b-4d9f3c6d82e2",
        "name": "日常费用报销",
        "submitter": "bLQAjvCRrYDtGJ3YA",
        "submitter_name": "MJ",
        "applicant": "bLQAjvCRrYDtGJ3YA",
        "applicant_name": "MJ",
        "applicant_organization": "Eqbm7paTxvBcxMCoE",
        "applicant_organization_name": "办公室",
        "applicant_organization_fullname": "华炎软件/办公室",
        "state": "draft",
        "code": "",
        "is_archived": false,
        "is_deleted": false,
        "created": "2017-12-11T08:44:18.833Z",
        "created_by": "bLQAjvCRrYDtGJ3YA",
        "modified": "2017-12-11T08:44:18.833Z",
        "modified_by": "bLQAjvCRrYDtGJ3YA",
        "values": {},
        "traces": [
            {
                "_id": "d64813d93467557980173ad4",
                "instance": "dw4aM5cPcDvMd2Jcb",
                "is_finished": false,
                "step": "3bd4b965-1c11-4b7d-ba75-ba4782c7766c",
                "name": "日常费用报销",
                "start_date": "2017-12-12T03:27:34.055Z",
                "approves": [
                    {
                        "_id": "7a856165a6382c45959549b4",
                        "instance": "dw4aM5cPcDvMd2Jcb",
                        "trace": "d64813d93467557980173ad4",
                        "is_finished": false,
                        "user": "hPgDcEd9vKQxwndQR",
                        "user_name": "MJ",
                        "handler": "hPgDcEd9vKQxwndQR",
                        "handler_name": "MJ",
                        "handler_organization": "593b97230cda012fa65270f9",
                        "handler_organization_name": "华炎软件",
                        "handler_organization_fullname": "华炎软件",
                        "type": "draft",
                        "is_read": true,
                        "is_error": false,
                        "description": "",
                        "values": {
                            "拟稿人": "MJ",
                            "日期-时间": "",
                            "日期": "",
                            "文件标题": "日常费用报销",
                            "下拉框": "",
                            "多选": ""
                        }
                    }
                ]
            }
        ],
        "inbox_users": [
            "bLQAjvCRrYDtGJ3YA"
        ],
        "current_step_name": "拟稿人"
    }
}
```
备注：
"submitter"为提交者userID，
"submitter_name"为提交者姓名，
"applicant"为申请者userID，
"applicant_name"为申请者姓名，
"applicant_organization":为申请者所在部门ID，
"applicant_organization_name"为申请者所在部门名称，
"state"为申请单状态，
"is_archived"为是否需要归档，
"values"内为传入的表单详情，包括字段及其值，
"traces"内为签核历程信息，
"current_step_name"为当前步骤名。

（2）失败：errorMessage为出错详细信息
```json
{
    "errors": [
        {
            "errorMessage": "当前用户没有此流程的新建权限 [error!]"
        }
    ]
}
```


#### 查看待办文件

目标：取得某用户的待办事项列表。

Request:
```bash
curl -X GET https://cn.steedos.com/api/workflow/open/pending?access_token=xxx
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

Response:

（1）成功，则返回status为"success"，data为数组，含多个待办，即

```json
{
    "status": "success",
    "data": [
        {
            "id": "SwcjPGQqooPd7gjJe",
            "start_date": "2017-12-11T05:06:08.521Z",
            "flow_name": "公司发文",
            "space_name": "华炎软件",
            "name": "正文 (1)",
            "applicant_name": "MJ",
            "applicant_organization_name": "华炎软件",
            "submit_date": "2017-12-08T10:12:59.734Z",
            "step_name": "拟稿人处理",
            "space_id": "Af8eM6mAHo7wMDqD3",
            "modified": "2017-12-11T10:18:28.195Z",
            "is_read": true,
            "values": {
                "拟稿人": "MJ",
                "日期-时间": "",
                "日期": "",
                "文件标题": "正文 (1)",
                "下拉框": "",
                "多选": ""
            }
        },
        {
            "id": "GBavE4Zr32m4Lzs6R",
            "start_date": "2017-11-22T03:16:01.744Z",
            "flow_name": "出差报销",
            "space_name": "华炎软件",
            "name": "出差报销",
            "applicant_name": "MJ",
            "applicant_organization_name": "华炎软件",
            "submit_date": "2017-11-22T02:28:44.031Z",
            "step_name": "拟稿人处理",
            "space_id": "Af8eM6mAHo7wMDqD3",
            "modified": "2017-12-09T06:15:15.593Z",
            "is_read": true,
            "values": {
                "拟稿人": "MJ",
                "日期-时间": "",
                "日期": "",
                "文件标题": "出差报销",
                "下拉框": "",
                "多选": ""
            }
        }
    ]
}
```
备注：
"space_name"为工作区名，
"flow_name"为流程名，
"name"为申请单标题，
"submit_date"为提交时间，
"step_name"为当前步骤名，
"is_read"为是否已读。

（2）失败：state有误时，data返回为空
```json
{
    "status": "success",
    "data": []
}
```

#### 查看申请单详情

目标：取得某申请单详细信息，包括表单、附件、签核历程等。

Request:
```bash
curl -X GET https://cn.steedos.com/api/workflow/open/get/HjHvRxp5vFL5fn7uK?access_token=xxx
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

备注：URL中的"HjHvRxp5vFL5fn7uK"为申请单instance的ID

Response:

（1）成功，则返回status为"success"，data为一个Instance Object即申请单对象

```json
{
    "status": "success",
    "data": {
        "_id": "HjHvRxp5vFL5fn7uK",
        "space": "Af8eM6mAHo7wMDqD3",
        "flow": "0c09ae80-6e44-4d77-96f7-c1efa19e26ce",
        "flow_version": "561295cb-c262-4ee3-9659-2f6350155406",
        "form": "6B0DCFC3-1E39-4F70-8C5D-E80C135CD70D",
        "form_version": "672de6ce-e372-48e9-b1d3-830b46819b0b",
        "name": "公司发文",
        "submitter": "hPgDcEd9vKQxwndQR",
        "submitter_name": "MJ",
        "applicant": "hPgDcEd9vKQxwndQR",
        "applicant_name": "MJ",
        "applicant_organization": "593b97230cda012fa65270f9",
        "applicant_organization_name": "华炎软件",
        "applicant_organization_fullname": "华炎软件",
        "state": "pending",
        "code": "21",
        "is_archived": false,
        "is_deleted": false,
        "values": {
            "拟稿人": "MJ",
            "日期-时间": "",
            "日期": "",
            "文件标题": "公司发文",
            "下拉框": "",
            "多选": ""
        },
        "traces": [
            {
                "_id": "b0f6eadb4b7909538778d766",
                "instance": "HjHvRxp5vFL5fn7uK",
                "is_finished": true,
                "step": "9b680fbe-0429-4dc8-913e-688c4cbebd3b",
                "name": "拟稿人拟稿",
                "start_date": "2017-12-08T09:00:52.422Z",
                "approves": [
                    {
                        "_id": "8ecbd6be43193e650e8d913f",
                        "instance": "HjHvRxp5vFL5fn7uK",
                        "trace": "b0f6eadb4b7909538778d766",
                        "is_finished": true,
                        "user": "hPgDcEd9vKQxwndQR",
                        "user_name": "MJ",
                        "handler": "hPgDcEd9vKQxwndQR",
                        "handler_name": "MJ",
                        "handler_organization": "593b97230cda012fa65270f9",
                        "handler_organization_name": "华炎软件",
                        "handler_organization_fullname": "华炎软件",
                        "type": "draft",
                        "is_read": true,
                        "is_error": false,
                        "description": "",
                        "values": {
                            "拟稿人": "MJ",
                            "日期-时间": "",
                            "日期": "",
                            "文件标题": "公司发文",
                            "下拉框": "",
                            "多选": ""
                        },
                        "judge": "submitted",
                        "next_steps": [
                            {
                                "step": "b65e5d4a-3d52-4aa6-a7c9-260cb7242ca6",
                                "users": [
                                    "hPgDcEd9vKQxwndQR"
                                ]
                            }
                        ],
                        "cost_time": 177759
                    }
                ],
                "judge": "submitted"
            }
        ],
        "inbox_users": [
            "hPgDcEd9vKQxwndQR"
        ],
        "current_step_name": "主任签发",
        "submit_date": "2017-12-08T09:03:50.189Z",
        "outbox_users": [],
        "keywords": "",
        "attachments": [
            {
                "createdByTransform": true,
                "_id": "rhyarREzE7qWt8pEq",
                "original": {
                    "type": "application/msword",
                    "size": 135680,
                    "name": "公司发文.doc"
                },
                "metadata": {
                    "owner": "9BbSjT82cJegBL3GX",
                    "owner_name": "MJ",
                    "space": "Af8eM6mAHo7wMDqD3",
                    "instance": "f9GuwvFLTnkk3irqD",
                    "approve": "3c3205139e3e8b6484e65b15",
                    "current": true,
                    "is_private": false,
                    "main": true,
                    "parent": "XGPBbW3TyL5q6W4Ha"
                },
                "uploadedAt": "2017-11-17T00:36:28.693Z",
                "collectionName": "instances"
            }
        ]
    }
}
```
备注：
"applicant"为申请者userID，
"applicant_name"为申请者姓名，
"applicant_organization":为申请者所在部门ID，
"applicant_organization_name"为申请者所在部门名称，
"submit_date"为提交时间，
"state"为申请单状态，
"values"内为传入的表单详情，包括字段及其值，
"traces"内为签核历程信息，
"inbox_users"为数组，包含下一步骤处理人的userID，
"current_step_name"为当前步骤名，
"attachments"为附件相关信息，
"outbox_users"为数组，包含已处理的用户ID。

（2）失败：返回status为"fail"，message为出错详细信息.
```json
{
    "errors": [
        {
            "errorMessage": "can not find instance [error]"
        }
    ]
}
```


#### 根据步骤名查看待办文件

Request:
```bash
curl -X POST https://cn.steedos.com/api/workflow/open/getbystepname?access_token=xxx 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```
```json
{
  "flow": "1ff12bc17e235503aff2c4c9",
  "stepname": "拟稿人"
}
```

Response:

（1）成功，则返回status为"success"，data为数组

```json
{
    "status": "success",
    "data": [
        {
            "_id": "kGLkkQj9qHRpCKaXD",
            "space": "519f004e8e296a1c5f00001d",
            "flow": "a5591552-149b-4f98-bd69-76aac68b786f",
            "flow_version": "1d6d22db-e26c-459a-af99-fe0f78d2ff5a",
            "form": "23831d8f-f1e7-4434-a278-4fc843e6add8",
            "form_version": "7ac95787-3ea0-4718-9186-cf7f447fed6b",
            "name": "请假申请",
            "submitter": "51edf12c49203b28da000012",
            "submitter_name": "MJ",
            "applicant": "51edf12c49203b28da000012",
            "applicant_name": "MJ",
            "applicant_organization": "519f004e8e296a1c5f00001e",
            "applicant_organization_name": "年华",
            "applicant_organization_fullname": "年华",
            "state": "pending",
            "code": "16",
            "is_archived": false,
            "is_deleted": false,
            "created": "2017-12-26T07:02:02.748Z",
            "created_by": "51edf12c49203b28da000012",
            "modified": "2017-12-26T07:07:23.172Z",
            "modified_by": "51edf12c49203b28da000012",
            "values": {},
            "inbox_users": [
                "51edf12c49203b28da000012"
            ],
            "current_step_name": "部门经理审批",
            "submit_date": "2017-12-26T07:07:23.172Z",
            "keywords": "",
            "attachments": [
                {
                    "createdByTransform": true,
                    "_id": "rhyarREzE7qWt8pEq",
                    "original": {
                        "type": "application/msword",
                        "size": 135680,
                        "name": "请假申请.doc"
                    },
                    "metadata": {
                        "owner": "51edf12c49203b28da000012",
                        "owner_name": "MJ",
                        "space": "519f004e8e296a1c5f00001d",
                        "instance": "kGLkkQj9qHRpCKaXD",
                        "approve": "339b287a51c84f91be713b18",
                        "current": true,
                        "is_private": false,
                        "main": true,
                        "parent": "DSYdugmX3Hm9Ju4LE"
                    },
                    "uploadedAt": "2017-11-17T00:36:28.693Z",
                    "collectionName": "instances"
                }
            ]
        }
    ]
}
```
备注：
"space_name"为工作区名，
"name"为申请单标题，
"values"内为传入的表单详情，包括字段及其值，
"inbox_users"为数组，包含下一步骤处理人的userID，
"attachments"为申请单附件。

（2）失败：查不到相关数据时，data为空。
```json
{
    "status": "success",
    "data": []
}
```


#### 申请单暂存

Request:
```bash
curl -X PUT https://cn.steedos.com/api/workflow/open/save/HjHvRxp5vFL5fn7uK?access_token=xxx
     -H "X-Space-Id: wsw1re12TdeP223sC"
```
```json
{
    "拟稿人" : "MJ",
    "日期-时间" : "",
    "日期" : "2017-12-12",
    "文件标题" : "公司发文",
    "下拉框" : "1",
    "多选" : "2",
    "单选" : "3",
    "选择部门" : {
        "id" : "wtRCepCrnY34gwvmj",
        "name" : "股份中心",
        "fullname" : "HT集团/股份公司/股份中心"
    }
}
```

Response:

（1）成功，则返回status为"success"

```json
{
    "status": "success",
    "data": {}
}
```

（2）失败：errorMessage为出错详细信息
```json
{
    "errors": [
        {
            "errorMessage": "会签步骤不能修改表单值 [error]"
        }
    ]
}
```


#### 提交申请单

目标：提交某申请单，同时指定下一步骤及其处理人。

Request:
```bash
curl -X PUT https://cn.steedos.com/api/workflow/open/submit/HjHvRxp5vFL5fn7uK?access_token=xxx
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

备注：URL中的"HjHvRxp5vFL5fn7uK"为申请单instance的ID。

Response:

（1）成功，则返回status为"success"，data为一个Instance Object即申请单对象

```json
{
    "status": "success",
    "data": {
        "_id": "ZQPAMnXHTRyGSiWQT",
        "space": "Af8eM6mAHo7wMDqD3",
        "flow": "84f97f94-88a2-4ea3-8c1e-0cadbc9daa84",
        "flow_version": "5813bdda-3af5-4db9-a238-12914cc9a6ef",
        "form": "A791F1D9-CC7D-4F62-80F4-7A924D4FC638",
        "form_version": "60cecb79-a054-4933-a4e1-20f1c2683aab",
        "name": "关于预防寒潮的通知",
        "submitter": "hPgDcEd9vKQxwndQR",
        "submitter_name": "MJ",
        "applicant": "hPgDcEd9vKQxwndQR",
        "applicant_name": "MJ",
        "applicant_organization": "593b97230cda012fa65270f9",
        "applicant_organization_name": "华炎软件",
        "applicant_organization_fullname": "华炎软件",
        "state": "pending",
        "code": "23",
        "is_archived": false,
        "is_deleted": false,
        "created": "2017-12-12T09:28:58.146Z",
        "created_by": "hPgDcEd9vKQxwndQR",
        "modified": "2017-12-12T09:30:06.690Z",
        "modified_by": "hPgDcEd9vKQxwndQR",
        "values": {
            "发布人": "MJ",
            "发布部门": "华炎软件",
            "通知内容": "",
            "文件标题": "关于预防寒潮的通知",
            "发布日期": "2017-12-12"
        },
        "traces": [
            {
                "_id": "f3268c7d5a7e05ec2458c2f7",
                "instance": "ZQPAMnXHTRyGSiWQT",
                "is_finished": true,
                "step": "3bd4b965-1c11-4b7d-ba75-ba4782c7766c",
                "name": "提交通知",
                "start_date": "2017-12-12T09:28:58.146Z",
                "approves": [
                    {
                        "_id": "ef8a82a0d45491d0ac1b76e8",
                        "instance": "ZQPAMnXHTRyGSiWQT",
                        "trace": "f3268c7d5a7e05ec2458c2f7",
                        "is_finished": true,
                        "user": "hPgDcEd9vKQxwndQR",
                        "user_name": "MJ",
                        "handler": "hPgDcEd9vKQxwndQR",
                        "handler_name": "MJ",
                        "handler_organization": "593b97230cda012fa65270f9",
                        "handler_organization_name": "华炎软件",
                        "handler_organization_fullname": "华炎软件",
                        "type": "draft",
                        "start_date": "2017-12-12T09:28:58.146Z",
                        "read_date": "2017-12-12T09:29:31.694Z",
                        "is_read": true,
                        "is_error": false,
                        "description": "",
                        "values": {
                            "发布人": "MJ",
                            "发布部门": "华炎软件",
                            "通知内容": "",
                            "文件标题": "关于预防寒潮的通知",
                            "发布日期": "2017-12-12"
                        },
                        "judge": "submitted",
                        "next_steps": [
                            {
                                "step": "0122acd5-62d2-40e9-a1e9-9ab715d1ed9c",
                                "users": [
                                    "hPgDcEd9vKQxwndQR"
                                ]
                            }
                        ],
                        "cost_time": 68537
                    }
                ],
                "judge": "submitted"
            }
        ],
        "inbox_users": [
            "hPgDcEd9vKQxwndQR"
        ],
        "current_step_name": "负责人审核",
        "submit_date": "2017-12-12T09:30:06.690Z",
        "outbox_users": [],
        "keywords": "",
        "attachments": [
            {
                "createdByTransform": true,
                "_id": "rhyarREzE7qWt8pEq",
                "original": {
                    "type": "application/msword",
                    "size": 135680,
                    "name": "公司发文.doc"
                },
                "metadata": {
                    "owner": "9BbSjT82cJegBL3GX",
                    "owner_name": "MJ",
                    "space": "Af8eM6mAHo7wMDqD3",
                    "instance": "f9GuwvFLTnkk3irqD",
                    "approve": "3c3205139e3e8b6484e65b15",
                    "current": true,
                    "is_private": false,
                    "main": true,
                    "parent": "XGPBbW3TyL5q6W4Ha"
                },
                "uploadedAt": "2017-11-17T00:36:28.693Z",
                "collectionName": "instances"
            }
        ]
    }
}
```
备注：
"name":为申请单标题，
"applicant"为申请者userID，
"applicant_name"为申请者姓名，
"applicant_organization":为申请者所在部门ID，
"applicant_organization_name"为申请者所在部门，
"submit_date"为提交时间，
"values"内为传入的表单详情，包括字段及其值，
"attachments"为附件相关信息，
"traces"内为签核历程信息。

（2）失败：返回status为"fail"，message为出错详细信息.
```json
{
    "errors": [
        {
            "errorMessage": "next step not uniq"
        }
    ]
}
```

备注：提交时下一步骤不唯一导致上述错误信息

```json
{
    "errors": [
        {
            "errorMessage": "can not find next step handler"
        }
    ]
}
```

备注：提交时下一步处理人不唯一导致上述错误

# 附件

权限：仅space的管理员可以调用以下接口，需要在请求的headers中包含：
 - X-Space-Id

#### 上传附件

Request:
```bash
curl -X POST https://cn.steedos.com/api/workflow/open/cfs/:ins_id?access_token=xxx
     -H "X-Space-Id: wsw1re12TdeP223sC"
```
```json
form-data:
{
    "file": {}
}

```
备注：添加文件；URL中"ins_id"为申请单id

Response:

（1）成功：返回status为”success”，data包含附件的id和size

```json
{
    "status": "success",
    "data": {
        "attach_id": "sp7GGBpGiRByzd4yu",
        "size": 26624
    }
}
```
备注："attach_id"为附件id，"size"为附件大小。

（2）失败：返回errorMessage为出错详细信息
```json
{
    "errors": [
        {
            "errorMessage": "need header X_Space_Id [error]"
        }
    ]
}
```
备注："errorMessage"提示缺少X_Space_Id


#### 下载附件

Request:
```bash
curl -X GET https://cn.steedos.com/api/workflow/open/cfs/:attach_id?access_token=xxx
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

备注：URL中的"attach_id"为附件id

Response:

（1）成功：跳转到保存附件界面

（2）失败：返回errorMessage为出错详细信息
```json
{
    "errors": [
        {
            "errorMessage": "space_id有误或此space已经被删除 [error!]"
        }
    ]
}
```


#### 删除附件

Request:
```bash
curl -X DELETE https://cn.steedos.com/api/workflow/open/cfs/:ins_id?access_token=xxx
     -H "X-Space-Id: wsw1re12TdeP223sC"
```
```json
{
  "attach_id": "ESMmryB5yZiqMXtt3"
}

```

备注：

(1) URL中的"ins_id"为申请单id

(2) body中的"attach_id"为需要删除的附件id

Response:

（1）成功：返回status为"success"

```json
{
    "status": "success",
    "data": {}
}
```

（2）失败：返回errorMessage为出错详细信息
```json
{
    "errors": [
        {
            "errorMessage": "此附件不属于此申请单，或已被删除 [error]"
        }
    ]
}
```
