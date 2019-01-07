--psql sripts for creating csv document
		
COPY(SELECT * FROM all_values_view) TO 'path.csv' WITH DELIMITER ';' CSV HEADER;		
COPY(SELECT * FROM diff_values_view where score > 1.5) TO 'path.csv' WITH DELIMITER ';' CSV HEADER;
COPY(SELECT * FROM diff_values_view2) TO 'path.csv' WITH DELIMITER ';' CSV HEADER;	
COPY(SELECT * FROM additional_info_view_1) TO '/opt/reports/aiv1.csv' WITH DELIMITER ';' CSV HEADER;
