## Orgnization

#### Get all Orgnizations of my Space

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
      "parent": "J4MgpJPdXJeQtixWM",
      "children": [
        "zzdNcGxkx7CqxfE9t"
      ]
    },
    {
      "_id": "zzdNcGxkx7CqxfE9t",
      "name": "group2",
      "fullname": "groupfullname2",
      "space": "3d5WzzSaM9q6Y9CZe",
      "parent":"rFHCYrF7ozyTJtK7T",
      "children": [
        "wuuHshh5Dm3uNRomo"
      ]
    },
    {
      "_id": "wuuHshh5Dm3uNRomo",
      "name": "group3",
      "fullname": "groupfullname3",
      "space": "as5WzzSaM9q6Y9CZe",
      "parent": "cPdakasklfbksjha",
      "children": []
    }
  ]
}
```

备注："parent"为该部门的直属上级部门，"children"为该部门的所有下级部门，"fullname"为该部门的部门全称，包含所属上级部门。

#### Get one Orgnization of my Space

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
    "parent": "cPdakasklfbksjha",
    "fullname": "开发部"
  }
}
```

备注："parent"为该部门的直属上级部门，"children"为该部门的所有下级部门，"fullname"为该部门的部门全称，包含所属上级部门。

#### Create a new Orgnization
Request:
```bash
curl -X POST https://cn.steedos.com/steedos/api/organizations
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

Request Body:
```json
{
  "name": "开发部",
  "space": "cPdakasklfbksjha"
}
```
备注："space"和"name"为必填字段。

Response:
```json
{
  "status": "success",
  "data": {
    "_id": "HxyYsQdbc7SJr7pvX",
    "name": "开发部",
    "space": "c3PZRyBosLob8bcyn",
    "parent": "cPdakasklfbksjha",
    "fullname": "开发部"
  }
}
```

#### Edit an Orgnization
Request:
```bash
curl -X PUT https://cn.steedos.com/steedos/api/organizations/HxyYsQdbc7SJr7pvX 
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

Request Body:
```json
{
  "name": "研究开发部",
  "parent": "J4MgpJPdXJeQtixWM"
}
```

Response:
```json
{
  "status": "success",
  "data": {
    "_id": "HxyYsQdbc7SJr7pvX",
    "name": "研究开发部",
    "space": "c3PZRyBosLob8bcyn",
    "parent": "J4MgpJPdXJeQtixWM",
    "parent": "J4MgpJPdXJeQtixWM"
  }
}
```

####  Delete an Orgnization
Request:
```bash
curl -X DELETE https://cn.steedos.com/steedos/api/organizations/HxyYsQdbc7SJr7pvX 
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

Response:
```json
{
    "status": "success",
    "data": {
        "message": "Item removed"
    }
}
```
备注：当所删除的部门有一个或多个下级部门时，系统会报错：organizations_error.organization_has_children


