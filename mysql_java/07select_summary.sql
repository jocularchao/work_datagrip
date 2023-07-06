/*select [all |distinct]
    {* | table.* | table.field1[as alias1][,table.field2[as alias2]][,....]};
from table_name [as table_alias]
    [left | right | inner join table_name2] -- 联合查询
    [where ....]  -- 指定结果须满足条件
    [group by ...] -- 指定结果按照哪几个字段来分组
    [having]  -- 过滤分组的记录必须满足的必要条件
    [order by] -- 指定查询记录按一个或多个条件排序
    [limit {[offset,] row_count | row_countOFFSET offset}];  --  指定查询的记录从哪条至哪条*/

