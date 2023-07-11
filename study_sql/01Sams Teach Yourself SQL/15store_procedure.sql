-- 存储过程 定义 不懂  类似方法


-- 创建
create procedure productpricing()
begin
    select avg(prod_price) as priveaverage
    from products;
end ;

-- 使用
call productpricing();

-- 删除存储过程
drop procedure productpricing;

-- 使用变量
create procedure productpricing(
    out pl decimal(8,2),
    out ph decimal(8,2),
    out pa decimal(8,2)
)
begin
    select min(prod_price)
        into pl
    from products;
    select max(prod_price)
        into ph
    from products;
    select avg(prod_price)
        into pa
    from products;
end;

call productpricing(
    @pricelow,
    @pricehigh,
    @priceaverage
    );

select @priceaverage;




-- 建立智能存储过程
/*
    1、获得合计
    2、把营业税有条件地添加到合计
    3、返回合计
*/

create procedure ordertotal(
    in onumber int,
    in taxable boolean,
    out ototal decimal(8,2)
)
begin

    declare total decimal(8,2);

    declare taxrate int default 6;

    select sum(item_price*quantity)
        from orderitems
            where order_num = onumber
    into total;


    if taxable then
        select total+(total/100*taxrate) into total;
    end if;

    select total into ototal;

end;

call ordertotal(20005,1,@total);

select @total;



-- 检查存储过程
show create procedure ordertotal;