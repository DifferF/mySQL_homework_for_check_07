USE MyJoinsDB;

/*
Задание 4
Создайте функции / процедуры для таких заданий:
 1) Требуется узнать контактные данные сотрудников (номера телефонов, место жительства).
 2) Требуется узнать информацию о дате рождения всех не женатых сотрудников и номера телефонов этих сотрудников.
 3) Требуется узнать информацию о дате рождения всех сотрудников с должностью менеджер и номера телефонов этих сотрудников.
*/

-- 1) Требуется узнать контактные данные сотрудников (номера телефонов, место жительства).
-- DELIMITER |
-- DROP procedure getPhoneAddress; |

DELIMITER |
CREATE PROCEDURE getPhoneAddress()
BEGIN
    SELECT phone, address FROM MyJoinsDB.Employee
    JOIN MyJoinsDB.workingStatus  ON id = EmployeeID;
END
|

DELIMITER |
CALL getPhoneAddress();
|

--  2) Требуется узнать информацию о дате рождения всех не женатых сотрудников и номера телефонов этих сотрудников.
-- DELIMITER |
-- DROP procedure getPhoneDateBirth_statusF; |

DELIMITER |
CREATE PROCEDURE getPhoneDateBirth_statusF()
BEGIN
    SELECT dateBirth, phone FROM MyJoinsDB.Employee 
    JOIN MyJoinsDB.workingStatus   ON  statusF = 'не женат' and id = EmployeeID;
END
|

DELIMITER |
CALL getPhoneDateBirth_statusF();|

-- 3) Требуется узнать информацию о дате рождения всех сотрудников с должностью менеджер и номера телефонов этих сотрудников.
-- DELIMITER |
-- DROP procedure getPhoneDateBirth_jobTitle; |

DELIMITER |
CREATE PROCEDURE getPhoneDateBirth_jobTitle()
BEGIN
    SELECT phone as ТЕЛЕФОН, dateBirth as ДЕНЬ_РОЖДЕНИЯ, CONCAT(surnamesN, ' ', nameN) as ИМЯ FROM MyJoinsDB.Employee 
    JOIN MyJoinsDB.workingPosition
    ON     jobTitle = 'менеджер'  and id = EmployeeIDPosition
    JOIN MyJoinsDB.workingStatus 
    ON id = EmployeeID;
END
|

DELIMITER |
CALL getPhoneDateBirth_jobTitle();|

