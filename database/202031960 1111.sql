select * from customer;
select * from orders;
select * from book;

Select orderid, orders.custid, name, addiress, bookid, orders.saleprice 
from customer, orders 
where customer.custid=orders.bookid;
order by orders.custid;

