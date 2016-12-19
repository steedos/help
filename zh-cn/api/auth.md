# Steedos API 身份认证

**注意: 请务必使用 HTTPS !**

### 身份认证Token

#### 登录系统

```bash 
curl https://cn.steedos.com/steedos/api/login -d "email=test@hotoa.com&password=password"
```

返回如下
```json
{
  "status": "success",
  "data": {
    "authToken": "kvw1reAZqveP2BTQ1C",
    "userId": "5199da558e296a4b001",
    "adminSpaces": [
      {
      "_id": "wsw1re12TdeP223sC",
      "name": "myspace"
      }
    ]
  }
}
```

其中的adminSpaces 下为此账户有管理员权限的那些专业版、企业版工作区（不含标准版）。
请记录下`userId` 、 `authToken` 、 `adminSpaces._id` ，在应用API提交请求时需要使用。

#### 退出系统
  
可通过 `POST /api/logout` 退出系统。退出系统后，`authToken`不再有效，即不可以再以此提交其他请求。

```bash
curl https://cn.steedos.com/steedos/api/logout -X POST -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" 
     -H "X-User-Id: fbdpsNf4oHiX79vMJ"
```

返回如下
```json
{
  "status": "success",
  "data": {
    "message": "You've been logged out!"
  }
}
```

退出后，再用原来的`authToken`提交请求, 会报错 'Session Expired' 。

#### 授权调用

如果要调用Steedos API，需要在请求的headers中包含`userId` 、`authToken` 、 `adminSpaces._id`：
- X-User-Id
- X-Auth-Token
- X-Space-Id

```bash
curl https://cn.steedos.com/steedos/api/organizations/ -H "X-Auth-Token: f2KpRW7KeN9aPmjSZ" 
     -H "X-User-Id: fbdpsNf4oHiX79vMJ" -H "X-Space-Id: wsw1re12TdeP223sC" 
```

## Response的结构

Steedos产生的Response采用的是JSON格式。

