## 工作区人员  SpaceUser

#### 查询工作区下所有人员信息

Request:
```bash
curl -X GET https://cn.steedos.com/api/space_users -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" 
     -H "X-User-Id: fbdpsNf4oHiX79vMJ" -H "X-Space-Id: wsw1re12TdeP223sC"
```

Response:
```json
{
  "status": "success",
  "data": [
    {
      "_id": "rFHCYrF7ozyTJtK7T",
      "email": "test1@hotoa.com",
      "space": "fc5WzzSaM9q6Y9CZe",
      "user": "ZkHHBEPayyk8nbuft",
      "name": "test1"
    },
    {
      "_id": "trTg22mBugjde86CY",
      "email": "test2@hotoa.com",
      "space": "fc5WzzSaM9q6Y9CZe",
      "user": "5Hz5tebP3JgeSPG5C",
      "name": "test2"
    },
    {
      "_id": "wuuHshh5Dm3uNRomo",
      "email": "test3@hotoa.com",
      "space": "fc5WzzSaM9q6Y9CZe",
      "user": "RfKsgvCMT9KAgJPBu",
      "name": "test3"
    }
  ]
}
```

