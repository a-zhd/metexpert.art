--psql sripts for creating csv document
		
COPY(SELECT * FROM all_values_view) TO 'path.csv' WITH DELIMITER ';' CSV HEADER;		
COPY(SELECT * FROM diff_values_view where score > 1.5) TO 'path.csv' WITH DELIMITER ';' CSV HEADER;
COPY(SELECT * FROM diff_values_view2) TO 'path.csv' WITH DELIMITER ';' CSV HEADER;	
