-- 游标 类似指针 只能用于存储过程
-- 有时需要在检索的行中前进或后退一行或多行 这时就需要游标cursor
-- 学习失败========================

-- create
create procedure processorders1()
begin
    declare o int;
    declare t decimal(8,2);
    declare done boolean default 0;

    declare ordernumbers cursor for
    select order_num from orders;

    declare continue handler for sqlstate '02000' set done = 1;
    -- create store
    create table if not exists ordertotals(order_num int,total decimal(8,2));


    -- open cursor
    open ordernumbers;


    -- loop
    repeat
        -- fetch
        fetch ordernumbers into o;

        -- get total for this order
        call ordertotals(o,1,t);

        -- insert order and total into ordertotals
        insert into ordertotals(order_num, total) values (o,t);
    until done  end repeat;
    -- close cursor
    close ordernumbers;
end;



call processorders1();


drop procedure processorders1;

select * from ordertotals;