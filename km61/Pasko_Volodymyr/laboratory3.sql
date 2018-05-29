SET SERVEROUTPUT ON;
/*1. Написати PL/SQL код, що додає продукт з ціною 10 постачальнику з ключем BRS01, щоб сумарна вартість його продуктів була менша 400. 
Ключі нових продуктів   - prod1…prodn. Решта обов’язкових полів береться з продукту з ключем BRO1.
10 балів*/
declare 
product_price product.product_price%type;
begin
end;

/*2. Написати PL/SQL код, що по вказаному ключу замовника виводить у консоль його ім'я та визначає  його статус.
Якщо він купив два продукти - статус  = "yes"
Якщо він купив більше двох продуктів- статус  = "no"
Якщо він немає замовлення - статус  = "unknown*/
declare
vendor_name vendors.vend_name%type;
vendors_name vendors.vend_name%type;
min_price products.prod_price%type;
vendor_id vendors.vend_id%type;
vendor_type char(10) := '';
begin
vendor_id := 'BRS01';
product_price := 0;
select vendors.vend_name, min(ORDERITEMS.ITEM_PRICE) into vendor_name, min_price
from orderitems join products on orderitems.prod_id = products.prod_id
right join vendors on products.vend_id = VENDORS.VEND_ID
where vendors.vend_id = vendor_id
GROUP by vendors.vend_name;

select vendors.vendors_name, count(product.proid_id) into vendor_name, count_product
from vendors left join product on vendors.vend_id = product.vend_id

if product_price > 0 then vendor_type := 'yes'
elsif product_price = 0 then vendor_type := 'unknown'
else vendor_type := 'no'
end if;

dbms_output.put_line(vendor_name || vendor_type);


end;

/*3. Створити представлення та використати його у двох запитах:
3.1. Скільки продуктів було замовлено покупцями з Германії.
3.2. Вивести назву продукту та у скількох замовленнях його купляли.
6 балів.*/
CREATE OR REPLACE VIEW Info AS
    SELECT
        Customers.cust_id,
        Customers.cust_country
    FROM
        Customers LEFT JOIN Orders
            ON Customers.cust_id = Orders.cust_id
        LEFT JOIN OrderItems
            ON Orders.order_num = OrderItems.order_num
        LEFT JOIN Products
            ON OrderItems.prod_id = Products.prod_id;

SELECT
    Count(cust_id)
FROM
    Info
WHERE
    cust_country = 'Germany';
