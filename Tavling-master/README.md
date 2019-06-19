# Tavling
### All-in-one competition management system for Track and Field
Emil Åberg  
Naman Bansal  
Morgan Law  
Thomas Welsh  

### Deliverables CHECKLIST
- [x] Cover Page
- [x] SQL DDL
- [x] SQL to create and populate tables
- [x] Screenshots of Sample Output
- [x] PDF describing deliverables
- [x] Copy of formal specs with explanation of changed E/R / SQL statements
- [x] E/R Diagram
- [x] Logical Design Document


### CHECKLIST FOR DEMO Deliverables
- [x] Same Deliverables as Hand In?
- [x] Selection Query
- [x] INSERT Statement
- [x] DELETE Statement
- [x] UPDATE Statement
- [x] Join Query
- [x] View
- [x] Aggregation Query
- [x] Division Query
- [x] User Data


##### EVENT for expiryDate of DrugTest
```
CREATE EVENT `DrugTestExpiry`   
  ON SCHEDULE EVERY 1 DAY  
    STARTS '2018-11-14 00:00:00.000000' ENDS '2020-03-31 00:00:00.000000'  
      ON COMPLETION PRESERVE  
      ENABLE 
      DO DELETE FROM athletetakestest  
        WHERE CURRENT_DATE > expDate;  
```
##### NewSeason Resets Rank for everySeason
```
DROP EVENT `NewSeason`;
CREATE EVENT `NewSeason` 
  ON SCHEDULE EVERY 1 YEAR 
    STARTS '2018-12-31 23:59:59' ENDS '2037-12-31 23:59:59' 
      ON COMPLETION PRESERVE 
        ENABLE COMMENT 'Reset points of every athlete after season finishes' 
          DO UPDATE rank SET points = 0 
            WHERE 1=1;
```
