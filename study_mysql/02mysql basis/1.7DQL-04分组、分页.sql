/*============== 分组 ================
语法 : select sum(*) from 表名 where 条件 group by 列名 [HAVING 约束条件]

*/




/*============== 分页 ================
语法 : select * from table limit [offset,] rows | rows offset offset
好处 : (用户体验,网络传输,查询压力)
推导:
第一页 : limit 0,5
第二页 : limit 5,5
第三页 : limit 10,5
......
第N页 : limit (pageNo-1)*pageSzie,pageSzie
[pageNo:页码,pageSize:单页面显示条数]
*/


