对象
===

Creator默认提供了很多功能，可以用于客户、合同、服务等。为了实现这些功能，Creator提供了一系列的标准对象，比如“客户”（Account）、“合同”（Contract）、“付款”（Payment）等等。用户也可以创建自定义对象。

对象可以看作数据库中的表，在对象管理界面可以创建自定义对象。无论是标准的对象还是自定义对象，Creator都为它们提供完整的操作界面，帮助用户进行新建、编辑、存储、浏览。

创建完对象之后，您还需要继续[配置字段](object_field.md): 配置业务对象的字段。

### 对象属性
- 对象名(object_name)： 必填，是对象的唯一名称，也是对象保存在数据库中的数据表名称。只能是英文、下划线和数字组成，不可重复。通过代码、API接口调用对象时，也需要使用此名称。
- 显示名称(label)： 必填，在界面上的显示名称，最终用户看到的是此名称。
- 图标(icon)： 必填，对象的显示图标名称，对应 [LIGHTNING DESIGN SYSTEM 中的Standard Icons图标](https://www.lightningdesignsystem.com/icons/#standard)
- 已启用(is_enable): 此对象已生效，显示在最终用户界面中。
- 启用搜索功能(enable_search): 此对象可以通过全局检索查询。
- 启用附件功能(enable_files): 此对象中的业务数据，可以上传附件。
- 启用任务功能(enable_tasks): 此对象中的业务数据，可以添加任务。
- 启用备忘功能(enable_notes): 此对象中的业务数据，可以添加备忘。
- 自定义帮助(help_url)：如果设置了此字段的内容，最终用户在点击帮助时，跳转到此页面。否则跳转到默认帮助页面。
- 描述(description)

### 代码级对象属性
- 数据连接(db): 对应的Meteor Collection，如果未定义此属性，Creator 会自动生成。
- enable_audit: 启用审计跟踪功能
- enable_api: 启用API接口
- enable_schema: 是否自动Attach Schema到Collection上。默认开启。
