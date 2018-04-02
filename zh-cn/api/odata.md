# odata接口使用规则
## 查询:
    方法：get()
    接口形式:serviceRoot/People
    描述：获取全部实体
    实例：http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations，其中Af8eM6mAHo7wMDqD3    为工作区名称，qhd_informations为集合名称。
        Response:
            "@odata.context": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/$metadata#qhd_informations",
            "@odata.count": 51,
            "value": [
                {
                    "@odata.id": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('GH4HFuLDAauRJA2E2')",
                    "@odata.etag": "W/\"08D589720BBB3DB1\"",
                    "@odata.editLink": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('GH4HFuLDAauRJA2E2')",
                    "_id": "GH4HFuLDAauRJA2E2",
                    "company": "三公司",
                    "title": "三公司信息上报123测试",
                    "content": "三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试",
                    "created": "2018-03-13T01:34:02.596Z",
                    "modified": "2018-03-26T08:09:30.610Z",
                    "owner": "u6mPXxHgBp3yWBWhi",
                    "created_by": "u6mPXxHgBp3yWBWhi",
                    "modified_by": "hPgDcEd9vKQxwndQR",
                    "score": 15,
                    "score_point": [
                        "月度好信息",
                        "专报信息"
                    ]
                },
                .....
                {
                    "@odata.id": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('hbysEccFT2fXjHtpd')",
                    "@odata.etag": "W/\"08D589720BBB3DB1\"",
                    "@odata.editLink": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('hbysEccFT2fXjHtpd')",
                    "_id": "hbysEccFT2fXjHtpd",
                    "company": "七公司",
                    "title": "what is the matter",
                    "content": "no matter",
                    "owner": "qjcwDX3icX3KnZJhZ",
                    "created": "2018-03-24T08:50:35.092Z",
                    "modified": "2018-03-24T08:50:44.990Z",
                    "created_by": "qjcwDX3icX3KnZJhZ",
                    "modified_by": "qjcwDX3icX3KnZJhZ",
                    "score": 0
                }
    接口形式：serviceRoot/People/russellwhyte
    描述：根据ID获取特定实体
    实例：http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations/GH4HFuLDAauRJA2E2
        Response:
            {
                "@odata.context": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/$metadata#qhd_informations/$entity",
                "@odata.id": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('GH4HFuLDAauRJA2E2')",
                "@odata.etag": "W/\"08D589720BBB3DB1\"",
                "@odata.editLink": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('GH4HFuLDAauRJA2E2')",
                "_id": "GH4HFuLDAauRJA2E2",
                "company": "三公司",
                "title": "三公司信息上报123测试",
                "content": "三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试三公司信息上报123测试",
                "space": "Af8eM6mAHo7wMDqD3",
                "created": "2018-03-13T01:34:02.596Z",
                "modified": "2018-03-26T08:09:30.610Z",
                "owner": "u6mPXxHgBp3yWBWhi",
                "created_by": "u6mPXxHgBp3yWBWhi",
                "modified_by": "hPgDcEd9vKQxwndQR",
                "score": 15,
                "score_point": [
                    "月度好信息",
                    "专报信息"
                ]
            }
## 新增
    方法：post()
    接口形式：serviceRoot/People
    描述：在实体集中新增一个实体
    实例：http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations
        body:{
            "title": "what is the matter",
             "company": "七公司",
             "content": "no matter"
        }
        Response:
            {
            "@odata.id": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('hbysEccFT2fXjHtpd')",
            "@odata.etag": "W/\"08D589720BBB3DB1\"",
            "@odata.editLink": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('hbysEccFT2fXjHtpd')",
            "_id": "hbysEccFT2fXjHtpd",
            "company": "七公司",
            "title": "what is the matter",
            "content": "no matter",
            "owner": "qjcwDX3icX3KnZJhZ",
            "created": "2018-03-29T08:50:35.092Z",
            "modified": "2018-03-29T08:50:44.990Z",
            "created_by": "qjcwDX3icX3KnZJhZ",
            "modified_by": "qjcwDX3icX3KnZJhZ",
            "score": 0
        }
## 修改
    方法：put()
    接口形式：serviceRoot/People/id
    实例：http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations/hbysEccFT2fXjHtpd
        body:{
            "title": "there is no matter",
             "content": "no matter"
        }
        Response:
            {
            "@odata.id": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('hbysEccFT2fXjHtpd')",
            "@odata.etag": "W/\"08D589720BBB3DB1\"",
            "@odata.editLink": "http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations('hbysEccFT2fXjHtpd')",
            "_id": "hbysEccFT2fXjHtpd",
            "company": "七公司",
            "title": "there is no matter",
            "content": "no matter",
            "owner": "qjcwDX3icX3KnZJhZ",
            "created": "2018-03-29T08:50:35.092Z",
            "modified": "2018-03-29T08:50:44.990Z",
            "created_by": "qjcwDX3icX3KnZJhZ",
            "modified_by": "qjcwDX3icX3KnZJhZ",
            "score": 0
        }
## 删除
    方法：delete()
    接口形式：serviceRoot/People/id
    实例：http://127.0.0.1:5000/api/odata/v4/Af8eM6mAHo7wMDqD3/qhd_informations/hbysEccFT2fXjHtpd 
## 状态说明
    200：请求执行成功
    400：无法成功解析请求，URL在语法或语义上可能不正确
    401：未进行身份验证
    403：没有访问该实体的权限
    404：未找到相关记录
    405：不能对该记录执行此请求
    406：无法满足实体/实体容器/实体集在接受标头中指定的请求格式
    413：返回数据过大
    500：内部服务器错误
    501：服务不可用