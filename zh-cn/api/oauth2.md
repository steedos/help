## 1. OAuth2协议

&#160; &#160; &#160; &#160;OAuth（开放授权）是一种公开协议，可以简单和标准化的方式从应用程序提供安全 API 授权。OAuth 可授权资源访问权限，而无需向应用程序出示用户凭据。使用 OAuth 的应用程序也可以直接进行身份验证，并访问 Steedos 资源，而无需用户在场。



## 2. 华炎云系统管理员配置应用程序

### 2.1 Creator管理应用程序配置

&#160; &#160; &#160; &#160;开发人员在使用OAuth2协议前，需要向华炎云系统管理员申请配置参数。  
&#160; &#160; &#160; &#160;华炎云系统管理员根据申请要求配置应用程序的相关参数。配置成功后，开发人员可获取相关参数信息，并根据验证流程，完成进一步的开发。

 - 配置参数
   - 名称：第三方应用的简称或全称，用于显示在授权页面
   - 是否激活：默认是激活，只有激活状态的应用程序才可使用OAuth2协议
   - 回调URI：应用程序的回调URI，用于接收授权码code和access_token
   - 客户端ID：系统自动生成第三方应用ID，唯一标识，不可编辑
   - Secret： 系统自动生成的Secret密钥，唯一标识，不可编辑

### 2.2 开发人员配置

&#160; &#160; &#160; &#160;应用程序的相关参数在系统中创建或编辑完成后，开发人员需要将自动生成的客户端ID、Secret等参数信息配置到应用程序的服务器上。


## 3. Web 服务器验证流程

### 3.1 简介
&#160; &#160; &#160; &#160;Web 服务器验证流程由位于安全服务器上的应用程序使用。Web 服务器流程的一个关键是服务器必须能够保护消费者秘密。您可以在流程中使用代码口令和校验值，以防止授权码拦截。

&#160; &#160; &#160; &#160;其授权验证流程示意图如下：

![OAuthWebSequenceWithConfig](https://github.com/steedos/creator/blob/master/packages/steedos-oauth2-server/documentation/OAuthWebSequenceWithConfig.png)

&#160; &#160; &#160; &#160;对于第三方应用程序而言，需要进行三步： 

&#160; &#160; &#160; &#160;&#160; &#160; &#160; &#160;Step 1. 获取Authorization Code； 

&#160; &#160; &#160; &#160;&#160; &#160; &#160; &#160;Step 2. 通过Authorization Code获取Access Token；

&#160; &#160; &#160; &#160;&#160; &#160; &#160; &#160;Step 3. 根据Access Token登录或调用相关接口。


### 3.2 过程详解

***Step 1：获取Authorization Code***

为从用户获得授权以代表用户访问 Steedos 数据，应用程序需重定向至授权端点。

 - 请求地址：https://beta.steedos.com/oauth2/

 - 请求方法：GET

 - 请求参数：
   - response_type：授权类型，此值固定为“code”。
   - client_id：2.2中配置的客户端ID。
   - redirect_uri：在批准后将用户重定向所到达的 URI。该参数必须和 2.2中配置的回调 URI保持一致。
   - scope：范围值列表，请求用户授权时向用户显示的可进行授权的列表。
   - state：应用程序的状态值。用于第三方应用防止CSRF攻击，成功授权后回调时会原样带回。请务必严格按照流程检查用户与state参数状态的绑定。

&#160; &#160; &#160; &#160;获取Authorization Code请求示例如下。  
   ```
   https://beta.steedos.com/oauth2/?response_type=code&client_id=hP9Z*****847n&
redirect_uri=http://test.mysite.com/callback.html&scope=email&state=test
   ```

 - 返回说明：  

&#160; &#160; &#160; &#160;如果用户成功登录并授权，则会跳转到指定的回调地址，并在redirect_uri地址后带上Authorization Code和原始的state值。redirect_uri 收到的请求示例如下：  
```
http://test.mysite.com/callback.html?code=9A5F************************06AF&state=test
```
&#160; &#160; &#160; &#160;注意：此code会在10分钟内过期。

 - 错误码说明：  

&#160; &#160; &#160; &#160;接口调用有错误时，会返回code和msg字段，以url参数对的形式返回。  


***Step 2：通过Authorization Code获取Access Token***

应用程序的回调URI在获得授权码之后，需要再次请求获取Access Token。

 - 请求地址：https://beta.steedos.com/oauth2/token/

 - 请求方法：POST

 - 请求参数：
   - grant_type: 授权类型，此值固定为“authorization_code”。 
   - client_id: 2.2中配置的客户端ID。
   - client_secret: 2.2中配置的Secret。
   - code: 上一步返回的authorization code。  

&#160; &#160; &#160; &#160;获取Access Token请求示例如下。  
   ```
   curl
      -X POST https://beta.steedos.com/oauth2/token/
      -H 'Content-type': 'application/x-www-form-urlencoded'
        {
          grant_type: 'authorization_code',
          client_id: 'hP9Z*****847n',
          client_secret: '5gbD************************D1I1',
          code: 9A5F************************06AF
        }
   ```

 - 返回说明：

&#160; &#160; &#160; &#160;如果成功返回，即可在返回包中获取到Access Token。 
返回如下字符串：access_token=FE04************************CCE2&expires_in=7776000。  

&#160; &#160; &#160; &#160;说明：
expires_in是该Access Token的有效期，单位为秒。

 - 错误码说明：  

&#160; &#160; &#160; &#160;接口调用有错误时，会返回code和msg字段，以url参数对的形式返回。

***Step 3. 根据Access Token登录或调用相关接口***

应用程序在获取到Access Token后，即可根据Access Token登录审批王或者调用审批王相关接口。例如，当前使用Access Token获取用户信息，请求信息如下。

 - 请求地址：https://beta.steedos.com/oauth2/getIdentity/

 - 请求方法：POST

 - 请求参数：
   - access_token: Step 2 获取到的Access Token。

&#160; &#160; &#160; &#160;请求示例如下。

   ```
   curl
      -X POST https://beta.steedos.com/oauth2/getIdentity/
      -H 'Content-type': 'application/x-www-form-urlencoded'
        {
          access_token: 'FE04************************CCE2'
        }
   ```

---

## 样例
&#160; &#160; &#160; &#160;这是一个Meteor应用,示范了从OAuth认证的过程。
https://github.com/prime-8-consulting/meteor-oauth2/tree/master/examples

认真检查这个应用的所有样例，你可以了解到更多认证的过程。
