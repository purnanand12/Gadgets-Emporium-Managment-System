SQL> create *
  2  from customer
  3  where categoryid = 2;
create *
       *
ERROR at line 1:
ORA-00901: invalid CREATE command 


SQL> select *
  2  from customer
  3  where categoryid =2;

CUSTOMERID FIRSTNAME                                          LASTNAME                                           ADDRESS                                            CATEGORYID                                                                                                                                                                                                                                                                                                                                      
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ----------                                                                                                                                                                                                                                                                                                                                      
         1 sandesh                                            pokhreal                                           123 biratnagar                                              2                                                                                                                                                                                                                                                                                                                                      
         4 rakesh                                             pandey                                             43 rajbiraj                                                 2                                                                                                                                                                                                                                                                                                                                      
         6 arjun                                              tandukar                                           43 ktm                                                      2                                                                                                                                                                                                                                                                                                                                      

SQL> select ordertable.*
  2  
SQL> select *
  2  from (
  3  select customer.*,sum(ordertable.totalamount) as totalspending
  4  from customer
  5  join customer_order_product on customer.customerid = customer_order_product.customerid
  6  join ordertable on customer_order_product.orderid = ordertable.orderid
  7  where to_char(ordertable.orderdate,'mm') = '08'
  8  and to_char(ordertable.orderdate,'yyyy') = to_char(sysdate,'yyyy')
  9  group by customer.customerid,customer.categoryid,customer.firstname,customer.lastname,customer.address
 10  order by
 11  sum(ordertable.totalamount) desc
 12  )
 13  where rownum <= 1;

no rows selected

SQL> select ordertable.*
  2  from ordertable
  3  join order_product on ordertable.orderid = order_product.orderid
  4  join productdetails on order_product.productid = productdetails.productid
  5  where productdetails.productname = 'laptop'
  6  and ordertable.orderdate between to_date('2023-05-01','yyyy-mm-dd') and to_date('2023-05-28','yyyy-mm-dd');

   ORDERID ORDERDATE TOTALAMOUNT PAYMENTOPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
---------- --------- ----------- --------------------------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                 
       101 10-MAY-23         150 esewa                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

SQL> select *
  2  from customer
  3  left join customer_order_product on customer.customerid = customer_order_product.customerid
  4  left join ordertable on customer_order_product.orderid = ordertable.orderid;

CUSTOMERID FIRSTNAME                                          LASTNAME                                           ADDRESS                                            CATEGORYID CUSTOMERID    ORDERID  PRODUCTID    ORDERID ORDERDATE TOTALAMOUNT PAYMENTOPTION                                                                                                                                                                                                                                                      
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ---------- ---------- ---------- ---------- ---------- --------- ----------- --------------------------------------------------                                                                                                                                                                                                                 
         1 sandesh                                            pokhreal                                           123 biratnagar                                              2          1        101        501        101 10-MAY-23         150 esewa                                                                                                                                                                                                                                                              
         2 anand                                              mishra                                             45 jnk                                                      1          2        102        502        102 15-MAY-23         150 creditcard                                                                                                                                                                                                                                                         
         3 shirshak                                           aryal                                              546 ktm                                                     3          3        103        503        103 05-JUN-23         120 debitcard                                                                                                                                                                                                                                                          
         1 sandesh                                            pokhreal                                           123 biratnagar                                              2          1        104        504        104 20-JUN-23         180 cash                                                                                                                                                                                                                                                               
         2 anand                                              mishra                                             45 jnk                                                      1          2        105        503        105 01-JUL-23          90 phonepay                                                                                                                                                                                                                                                           
         3 shirshak                                           aryal                                              546 ktm                                                     3          3        106        501        106 15-JUL-23         300 cash                                                                                                                                                                                                                                                               
         1 sandesh                                            pokhreal                                           123 biratnagar                                              2          1        107        502        107 05-AUG-23         250 cash                                                                                                                                                                                                                                                               
         4 rakesh                                             pandey                                             43 rajbiraj                                                 2                                                                                                                                                                                                                                                                                                                                      
         7 sahid                                              thapa                                              delhi                                                       3                                                                                                                                                                                                                                                                                                                                      
         6 arjun                                              tandukar                                           43 ktm                                                      2                                                                                                                                                                                                                                                                                                                                      
         5 bikram                                             gurung                                             45 jhapa                                                    1                                                                                                                                                                                                                                                                                                                                      

11 rows selected.

SQL> select customer.*
  2  from customer
  3  left join customer_order_product on customer.customerid = customer_order_product.customerid
  4  where customer_order_product.orderid is null;

CUSTOMERID FIRSTNAME                                          LASTNAME                                           ADDRESS                                            CATEGORYID                                                                                                                                                                                                                                                                                                                                      
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ----------                                                                                                                                                                                                                                                                                                                                      
         5 bikram                                             gurung                                             45 jhapa                                                    1                                                                                                                                                                                                                                                                                                                                      
         6 arjun                                              tandukar                                           43 ktm                                                      2                                                                                                                                                                                                                                                                                                                                      
         7 sahid                                              thapa                                              delhi                                                       3                                                                                                                                                                                                                                                                                                                                      
         4 rakesh                                             pandey                                             43 rajbiraj                                                 2                                                                                                                                                                                                                                                                                                                                      

SQL> select *
  2  from productdetails
  3  where productname like '_a%' and productquanntity > 50;
where productname like '_a%' and productquanntity > 50
                                 *
ERROR at line 3:
ORA-00904: "PRODUCTQUANNTITY": invalid identifier 


SQL> select *
  2  from productdetails
  3  where productname like '_a%' and productquantity > 50;

 PRODUCTID   VENDORID PRODUCTNAME                                        PRODUCTCATEGORY                                    DESCRIPTION                                        PRODUCTPRICE PRODUCTQUANTITY                                                                                                                                                                                                                                                                                                         
---------- ---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ------------ ---------------                                                                                                                                                                                                                                                                                                         
       501          1 laptop                                             electronics                                        core processor                                             1200              60                                                                                                                                                                                                                                                                                                         

SQL> 
SQL> SQL> select *
SP2-0734: unknown command beginning "SQL> selec..." - rest of line ignored.
SQL>   2  from customer
SQL>   3  where customerid in (
SQL>   4  select distinct customerid
SQL>   5  from customer_order_product
SQL>   6
SP2-0226: Invalid line number 
SQL> 
SQL> select *
  2  from customer
  3  where customerid in (
  4  select distinct customerid
  5  from customer_order_product
  6  );

CUSTOMERID FIRSTNAME                                          LASTNAME                                           ADDRESS                                            CATEGORYID                                                                                                                                                                                                                                                                                                                                      
---------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ----------                                                                                                                                                                                                                                                                                                                                      
         1 sandesh                                            pokhreal                                           123 biratnagar                                              2                                                                                                                                                                                                                                                                                                                                      
         2 anand                                              mishra                                             45 jnk                                                      1                                                                                                                                                                                                                                                                                                                                      
         3 shirshak                                           aryal                                              546 ktm                                                     3                                                                                                                                                                                                                                                                                                                                      

SQL> select *
  2  ordertable
  3  where totalamount  >= (select avg(totalamount) from ordertable);
ordertable
*
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> select *
  2  from ordertable
  3  where totalamount  >= (select avg(totalamount) from ordertable);

   ORDERID ORDERDATE TOTALAMOUNT PAYMENTOPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
---------- --------- ----------- --------------------------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                 
       104 20-JUN-23         180 cash                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       106 15-JUL-23         300 cash                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       107 05-AUG-23         250 cash                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

SQL> select to_char(orderdate,'yyyy') as year,
  2  to_char(orderdate,'mm') as month,
  3  sum(totalamount) as totalrevenue
  4  from ordertable
  5  group by to_char(orderdate,'yyyy'),to_char(orderdate,'mm')
  6  order by year,month;

YEAR MO TOTALREVENUE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
---- -- ------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
2023 05          300                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
2023 06          300                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
2023 07          390                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
2023 08          250                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

SQL> select vendor.*
  2  from vendor
  3  join productdetails on vendor.vendorid = productdetails.vendorid
  4  group by vendor.vendorid,vendor.vendorname,vendor.vendoraddress,vendor.vendorcontact
  5  having count (productdetails.productid) > 3;

no rows selected

SQL> select vendor.*
  2  from vendor
  3  join productdetails on vendor.vendorid = productdetails.vendorid
  4  group by vendor.vendorid,vendor.vendorname,vendor.vendoraddress,vendor.vendorcontact
  5  having count (productdetails.productid) >= 3;

  VENDORID VENDORNAME                                         VENDORADDRESS                                      VENDORCONTACT                                                                                                                                                                                                                                                                                                                                                                                      
---------- -------------------------------------------------- -------------------------------------------------- --------------------                                                                                                                                                                                                                                                                                                                                                                               
         1 kamlelecropvtltd                                   345 kamalpokhari                                   984566654                                                                                                                                                                                                                                                                                                                                                                                          

SQL> 
SQL> SQL> select * from (
SP2-0734: unknown command beginning "SQL> selec..." - rest of line ignored.
SQL>   2  select
SQL>   3  productid,
SQL>   4  productname,
SQL>   5  sum(productquantity) as totalorder
SQL>   6  from
SQL>   7  productdetails
SQL>   8  group by
SQL>   9  productid,productname
SQL>  10  order by
SQL>  11  totalorder desc
SQL>  12  )
SQL>  13  where rownum <=3;
SQL> select * from (
  2  select
  3  productid,
  4  productname,
  5  sum(productquantity) as totalorder
  6  from
  7  productdetails
  8  group by
  9  productid,productname
 10  order by
 11  totalorder desc
 12  )
 13  where rownum <=3;

 PRODUCTID PRODUCTNAME                                        TOTALORDER                                                                                                                                                                                                                                                                                                                                                                                                                                            
---------- -------------------------------------------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                            
       503 headphones                                                 80                                                                                                                                                                                                                                                                                                                                                                                                                                            
       501 laptop                                                     60                                                                                                                                                                                                                                                                                                                                                                                                                                            
       502 smartphone                                                 30                                                                                                                                                                                                                                                                                                                                                                                                                                            

SQL> spool off;
