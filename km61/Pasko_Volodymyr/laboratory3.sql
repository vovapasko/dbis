-- LABORATORY WORK 3
-- BY Pasko_Volodymyr
SET SERVEROUTPUT ON;
/*1. Написати PL/SQL код, що додає продукт з ціною 10 постачальнику з ключем BRS01, щоб сумарна вартість його продуктів була менша 400. 
Ключі нових продуктів   - prod1…prodn. Решта обов’язкових полів береться з продукту з ключем BRO1.
10 балів*/


/*2. Написати PL/SQL код, що по вказаному ключу замовника виводить у консоль його ім'я та визначає  його статус.
Якщо він купив два продукти - статус  = "yes"
Якщо він купив більше двох продуктів- статус  = "no"
Якщо він немає замовлення - статус  = "unknown*/
--SELECT CUSTOMERS.CUST_ID 
--FROM CUSTOMERS;

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
