delimiter $$
create function ran_email()
    returns varchar(20)  -- 定义返回类型
begin -- 开始
    declare em163 varchar(20) default '163'; -- 定义变量
    declare emqq varchar(20) default 'qq';
    declare i int default ceiling(rand()*((100-99)+1));
    if i=1 then return em163;
    else return emqq;

    end if;
    end;  -- 结束

    select ran_email();


