-- LABORATORY WORK 3
-- BY Pasko_Volodymyr
/*1. Ќаписати PL/SQL код, що по вказаному ключу покупцЯ дода№ в його замовленнЯ, що було зроблено першим будь-Який продукт 10 разґв, змґнюючи order_item у циклґ.
ЋперацґЯ викону№тьсЯ, Якщо у даному замовленнґ вже № хочаб один товар. 10 балґв*/
SET SERVEROUTPUT ON;
DECLARE
  order_item INT := 1;
  cust_key int := 5000001;
BEGIN
  FOR i IN order_item..order_item + 9 LOOP
    DBMS_OUTPUT.PUT_LINE(order_item);
    order_item := order_item + 1;
    END LOOP;
END;

/*2. Ќаписати PL/SQL код, що по вказаному ключу продукту виводить у консоль його назму та изнача№  його статус.
џкщо продукт не прода№тьсЯ  - статус  = "poor"
џкщо продукт продано до 2 рґзних замовлень включно - статус  = "common"
џкщо продукт продано бґльше нґж у 2 замовленнЯ - статус  = "rich" 4 бали*/
SET SERVEROUTPUT ON;
DECLARE
  product_key int := 1500;
BEGIN
  
END;

/*3. ‘творити предсавленнЯ та використати його у двох запитах:
3.1. ‚ивести ґм'Я постачальника та номер замовленнЯ, куди не прода№ постачальник сво» продукти.
3.2. ‚ивести ґм'Я постачальника та загальну кґлькґсть замовлень, куди постачальник продавам сво» продукти 6 балґв.*/

