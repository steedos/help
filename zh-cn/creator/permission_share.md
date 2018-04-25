记录级权限
===

在对象级权限的基础上，通过配置共享规则，可以实现记录级权限。

### 共享规则 permission_share
对象可配置共享规则，满足一定过滤条件的记录，自动共享给某些组织或用户。
- 对象名 object_name
- 过滤条件 filters
- 授权用户 users
- 授权组织 organizations

### sharing字段格式
- 每个对象自带sharing字段，用于保存每一条记录的共享信息。
```
"sharing": [
	{
		"u": [user_id],  # 授权用户
		"o": [organization_id] # 授权组织
		"r": rule_id    # 如果由规则生成，记录对应的id，便于重新计算，如果为空，重算时不覆盖。
	}
]
```
当记录有修改或是共享规则发生变化时，系统会自动重算sharing字段。
