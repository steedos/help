## Users in space

#### Get all users in my Space

Request:
```bash
curl -X GET https://cn.steedos.com/steedos/api/space_users -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" 
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

#### Get one user

Request:
```bash
curl -X GET https://cn.steedos.com/steedos/api/space_users/rFHCYrF7ozyTJtK7T
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
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
    }
  ]
}
```

#### create a new user

Request:
```bash
curl -X POST https://cn.steedos.com/steedos/api/space_users -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" 
     -H "X-User-Id: fbdpsNf4oHiX79vMJ" -H "X-Space-Id: wsw1re12TdeP223sC"
````

Request Body:
```json
{
  "email": "test@hotoa.com",
  "name": "test"
}
```
Note："email" and "name" are required.

Response:
```json
{
  "status": "success",
  "data": {
    "_id": "rFHCYrF7ozyTJtK7T",
    "email": "test@hotoa.com",
    "space": "fc5WzzS233sjY9CZe",
    "user": "ZkHHBEPayyk8nbuft",
    "name": "test"
  }
}
```

#### Edit a user
Request:
```bash
curl -X PUT https://cn.steedos.com/steedos/api/space_users/rFHCYrF7ozyTJtK7T 
     -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" -H "X-User-Id: fbdpsNf4oHiX79vMJ" 
     -H "X-Space-Id: wsw1re12TdeP223sC"
```

Request Body:
```json
{
  "name": "Adams",
  "manager": "rFHCYrF7ozyTJtK7T",
  "organization": "BD2mJCG9m6eZiRAQt"
}
```

Response:
```json
{
  "status": "success",
  "data": {
    "_id": "trTg22mBugjde86CY",
    "email": "test1@hotoa.com",
    "space": "fc5WzzSaM9q6Y9CZe",
    "user": "5Hz5tebP3JgeSPG5C",
    "name": "Adams",
    "manager": "rFHCYrF7ozyTJtK7T",
    "organization": "BD2mJCG9m6eZiRAQt"
  }
}
```

#### Delete a user
Request:
```bash
curl -X DELETE https://cn.steedos.com/steedos/api/space_users/rFHCYrF7ozyTJtK7T 
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



