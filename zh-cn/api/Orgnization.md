## 组织机构  Orgnization

#### 查询工作区下所有部门信息

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
      "parent": [
        "J4MgpJPdXJeQtixWM"
      ],
      "children": [
        "zzdNcGxkx7CqxfE9t"
      ]
    },
    {
      "_id": "zzdNcGxkx7CqxfE9t",
      "name": "group2",
      "fullname": "groupfullname2",
      "space": "3d5WzzSaM9q6Y9CZe",
      "parent": [
        "rFHCYrF7ozyTJtK7T"
      ],
      "children": [
        "wuuHshh5Dm3uNRomo"
      ]
    },
    {
      "_id": "wuuHshh5Dm3uNRomo",
      "name": "group3",
      "fullname": "groupfullname3",
      "space": "as5WzzSaM9q6Y9CZe",
      "parent": [
        "zzdNcGxkx7CqxfE9t"
      ],
      "children": []
    }
  ]
}
```

备注："parent"为该部门的直属上级部门，"children"为该部门的所有下级部门，"fullname"为该部门的部门全称，包含所属上级部门。

#### 查询指定部门信息

Request:
```bash
curl -X GET https://cn.steedos.com/steedos/api/organizations/HxyYsQdbc7SJr7pvX 
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

Response:
```json
{
  "status": "success",
  "data": {
    "_id": "HxyYsQdbc7SJr7pvX",
    "name": "开发部",
    "space": "c3PZRyBosLob8bcyn",
    "parent": [],
    "fullname": "开发部"
  }
}
```

备注："parent"为该部门的直属上级部门，"children"为该部门的所有下级部门，"fullname"为该部门的部门全称，包含所属上级部门。
