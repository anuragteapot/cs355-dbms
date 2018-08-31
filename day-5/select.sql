-- Select

-- 1
select substring(sno,2,length(sno)-1) as Only_number from supplier;

-- 2
select sname from supplier where length(sname)-length(replace(sname, 'a', '')) = '2';

-- 3
select sno,concat("sp",substring(sno,2,length(sno)-1), substring(pno,2,length(sno)-1)) as combination from sp;

-- 4
select sno from supplier where substring(sno,2,length(sno)-1) =  REVERSE(substring(sno,2,length(sno)-1));

-- 5
select sno,concat("suppl",substring(sno,2,length(sno)-1)) as New from supplier;

-- 6
select phone,concat(substring(phone,5,length(phone)-5),"-",substring(phone,6,length(phone)-1)) as New_Format from supplier;

-- 7
select sno,phone,concat(right(sno,1),substring(phone,5,1),substring(phone,8,1),round((rand() * (99-0))+99)) as key_generate from supplier;

-- 8
select weight,round(weight/1000,2) as Weight from parts;

-- 9
select email,substring(email, position("@" IN email)+1, position("." IN email)-position("@" IN email)-1) as Domain from supplier;

-- 10
select pno,repeat("*", truncate(weight/10,0)+1) as new_weight from parts;
