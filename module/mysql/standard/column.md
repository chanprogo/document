


字段 应当有 注释， 描述 该字段 的用途 及 可能存储的内容，  
如 枚举值 则建议 将该字段中 使用的内容 都定义出来；  






7. 时间字段，除特殊情况 一律采用 int 来记录 unix_timestamp；  
8. 网络 IP 字段，除特殊情况 一律用 bigint 来记录 inet_aton 值；  
9. 所有字段，均为非空，最好显示指定默认值；  
10. 有些驱动对 tinyint 支持不够好，通常建议 按容量 来选择字段；  
11. text 字段 尽量 少用，或是 拆到 冗余表 中；

CREATE TABLE `wanted_post` (

  `id` int(10) NOT NULL AUTO_INCREMENT,

  `puid` int(10) unsigned NOT NULL,

  `user_id` int(10) NOT NULL COMMENT '发贴用户的id',

  `username` varchar(50) NOT NULL COMMENT '发贴用户的用户名',

  `city` smallint(4) NOT NULL COMMENT '所在城市',

  `ip` bigint(14) NOT NULL COMMENT '发帖人的ip',

  `district_id` tinyint(2) NOT NULL COMMENT '所在区域的id',

  `district_name` varchar(20) NOT NULL COMMENT '行政区名字',

  `street_id` tinyint(2) NOT NULL COMMENT '所在街道(地标)的id',

  `street_name` varchar(20) NOT NULL COMMENT '小区名字',

  `title` varchar(255) NOT NULL COMMENT '帖子的标题',

  `description` text NOT NULL COMMENT '帖子详情描述',

  `post_at` int(11) NOT NULL COMMENT '用户发帖时间,数据创建的时间,使用整型存储',

  `refresh_at` int(11) NOT NULL COMMENT '帖子被修改的时间,整型存储',

  `show_time` int(11) NOT NULL COMMENT '帖子显示时间',

  `age_max` int(11) NOT NULL DEFAULT '0' COMMENT '招聘最小年龄',

  `age_min` int(11) NOT NULL DEFAULT '0' COMMENT '招聘最大年龄',

  `post_refresh_at` int(11) NOT NULL COMMENT '刷新时间',

  PRIMARY KEY (`id`),

  UNIQUE KEY `idx_puid` (`puid`),

  KEY `user_id_index` (`user_id`),

  KEY `post_at_index` (`post_at`),

  KEY `refresh_at_index` (`refresh_at`),

  KEY `show_time_index` (`show_time`)

) ENGINE=InnoDB AUTO_INCREMENT=55295 DEFAULT CHARSET=utf8 COMMENT='招聘帖子表';​










### 数据库字段设计规范

````
1.优先为表中的每一列选择符合存储需要的 最小的 数据类型    
2.列的字段 类型越大，建立索引占据的空间 就越大，导致一个页中的 索引越少，造成 IO 次数增加，影响性能。
3.每个字段尽可能具有NOT NULL属性
4.避免使用 Blob、Text 及 ENUM 类型
5.使用 毫秒时间戳 存储时间 
6.VARCHAR 类型 的长度 应该尽可能适中，VARCHAR 类型虽然在硬盘上是动态长度的，但是在内存中占用的空间 是固定的最大长度。
````