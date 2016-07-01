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

Note："parent" is parent department, "children" is children departments, "fullname" is fullname of department，include all parent departments.

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
    "name": "R&D",
    "space": "c3PZRyBosLob8bcyn",
    "parent": "cPdakasklfbksjha",
    "fullname": "HY/SH/R&D"
  }
}
```

Note："parent" is parent department, "children" is children departments, "fullname" is fullname of department，include all parent departments.

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
  "name": "R&D",
  "space": "cPdakasklfbksjha"
}
```

Note："space" and "name" are required.

Response:
```json
{
  "status": "success",
  "data": {
    "_id": "HxyYsQdbc7SJr7pvX",
    "name": "R&D",
    "space": "c3PZRyBosLob8bcyn",
    "parent": "cPdakasklfbksjha",
    "fullname": "HY/SH/R&D"
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
  "name": "R&D",
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

Note: You can't delete an orgnization if this orgnization has children .
