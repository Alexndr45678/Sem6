-- 1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'.

CREATE DATABASE IF NOT EXISTS lesson6;
USE lesson6;
DELIMITER //
DROP FUNCTION IF EXISTS format_seconds//
CREATE FUNCTION format_seconds(sec INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(100);
    SET days = sec DIV 86400;
    SET sec = sec MOD 86400;
    SET hours = sec DIV 3600;
    SET sec = sec MOD 3600;
    SET minutes = sec DIV 60;
    SET sec = sec MOD 60;
    SET result = CONCAT(days, ' дней ', hours, ' часов ', minutes, ' минут ', sec, ' секунд');
    RETURN result;
END //
DELIMITER ;
SELECT format_seconds(456) AS "Result";


-- 2.	Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2).

DELIMITER //
DROP PROCEDURE IF EXISTS even_nums//
CREATE PROCEDURE even_nums()
BEGIN
    DECLARE x INT;
    SET x = 2;
    WHILE x <= 10 DO
        SELECT x;
        SET x = x + 2;
    END WHILE;
END //
DELIMITER ;
CALL even_nums();