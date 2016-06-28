## 组织机构  Orgnization

#### 查询工作区下所有组织机构（部门）的信息

Request:
```bash
curl -X GET https://cn.steedos.com/steedos/api/organizations -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" 
     -H "X-User-Id: fbdpsNf4oHiX79vMJ" -H "X-Space-Id: wsw1re12TdeP223sC"
```

Response:
```json
{
  "status": "success",
  "data": [
    {
      "_id": "rFHCYrF7ozyTJtK7T",
      "name": "group1",
      "fullname": "groupfullname1",
      "space": "fc5WzzSaM9q6Y9CZe",
      "is_company": "false"
    },
    {
      "_id": "trTg22mBugjde86CY",
      "name": "group2",
      "fullname": "groupfullname2",
      "space": "3d5WzzSaM9q6Y9CZe",
      "is_company": "false"
    },
    {
      "_id": "wuuHshh5Dm3uNRomo",
      "name": "group3",
      "fullname": "groupfullname3",
      "space": "as5WzzSaM9q6Y9CZe",
      "is_company": "false"
    }
  ]
}
```

