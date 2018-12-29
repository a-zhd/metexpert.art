BEGIN;
CREATE TABLE IF NOT EXISTS images (
    id 		SERIAL  	PRIMARY KEY,
    title 	VARCHAR(40) NOT NULL,
	author	TEXT		NOT NULL
);
CREATE TABLE IF NOT EXISTS parameters (
    id  		SERIAL 			PRIMARY KEY,
    title 		VARCHAR(255) 	NOT NULL,
    pkey 		VARCHAR(255) 	NOT NULL,
	max_value 	INTEGER 		REFERENCES images(id) 	NOT NULL,
    min_value 	INTEGER			REFERENCES images(id) 	NOT NULL
);

CREATE TABLE IF NOT EXISTS registers (
    id 				SERIAL 		PRIMARY KEY,
	created_at 		DATE		NOT NULL,
	img_titles 		TEXT[],
	test_finished 	BOOLEAN
);

CREATE TABLE IF NOT EXISTS parameter_values (
    id 				SERIAL 		PRIMARY KEY,
    value 			NUMERIC 	NOT NULL,
    test_id 		INTEGER 	REFERENCES registers(id),
    parameter_id 	INTEGER 	REFERENCES parameters(id),
    image_id 		INTEGER 	REFERENCES images(id),
	UNIQUE (test_id, parameter_id, image_id)
);

CREATE TABLE IF NOT EXISTS additional_info (
	id 			serial 		PRIMARY KEY,
	start_time 	NUMERIC,
	end_time 	NUMERIC,
	sex 	    VARCHAR(1),
	year_birth 	INTEGER,
	education 	TEXT,
	profession 	TEXT,
	raw_data 	JSON 		NOT NULL,
	test_id 	INTEGER 	REFERENCES registers(id)
);

CREATE TABLE student_values (
	id					serial		PRIMARY KEY, 
	person_num			INTEGER 	NOT NULL,
	year_birth 			INTEGER,
	profession 			TEXT,
	education			TEXT,
	sex 				VARCHAR(1),
	img 				VARCHAR(40) NOT NULL, 
	pressure 			INTEGER		NOT NULL,
	definition 			INTEGER		NOT NULL,
	thickness 			INTEGER		NOT NULL,
	flexibility 		INTEGER		NOT NULL,
	stroke_frequency 	INTEGER		NOT NULL,
	gradation_tone 		INTEGER		NOT NULL,
	contrast 			INTEGER		NOT NULL
);

INSERT INTO images (title, author) 
VALUES 	('DCIM_0093.jpg',	'Анна К.'),
		('DCIM_0092.jpg',	'Анна К.'),
		('DCIM_0091.jpg',	'Анна К.'),
		('DCIM_0090.jpg',	'Анна К.'),
		('DCIM_0089.jpg',	'Анна К.'),
		('DCIM_0088.jpg',	'Анна К.'),
		('DCIM_0087.jpg',	'Анна К.'),
		('DCIM_0086.jpg',	'Анна К.'),
		('DCIM_0134.jpg',	'Елена Б.'),
		('DCIM_0135.jpg',	'Елена Б.'),
		('DCIM_0136.jpg',	'Елена Б.'),
		('DCIM_0137.jpg',	'Елена Б.'),
		('DCIM_0138.jpg',	'Елена Б.'),
		('DCIM_0139.jpg',	'Елена Б.'),
		('DCIM_0128.jpg',	'Валерия Б.'),
		('DCIM_0129.jpg',	'Валерия Б.'),
		('DCIM_0130.jpg',	'Валерия Б.'),
		('DCIM_0131.jpg',	'Валерия Б.'),
		('DCIM_0132.jpg',	'Валерия Б.'),
		('DCIM_0133.jpg',	'Валерия Б.'),
		('DCIM_0115.jpg',	'Мария В.'),
		('DCIM_0116.jpg',	'Мария В.'),
		('DCIM_0117.jpg',	'Мария В.'),
		('DCIM_0118.jpg',	'Мария В.'),
		('DCIM_0119.jpg',	'Мария В.'),
		('DCIM_0120.jpg',	'Мария В.'),
		('DCIM_0085.jpg',	'Мария В.'),
		('DCIM_0084.jpg',	'Мария В.'),
		('DCIM_0083.jpg',	'Мария В.'),
		('DCIM_0082.jpg',	'Мария В.'),
		('DCIM_0081.jpg',	'Мария В.'),
		('DCIM_0080.jpg',	'Мария В.'),
		('DCIM_0074.jpg',	'Елена Г.'),
		('DCIM_0073.jpg',	'Елена Г.'),
		('DCIM_0072.jpg',	'Елена Г.'),
		('DCIM_0071.jpg',	'Елена Г.'),
		('DCIM_0070.jpg',	'Елена Г.'),
		('DCIM_0069.jpg',	'Елена Г.'),
		('DCIM_0008.jpg',	'Елена Г.'),
		('DCIM_0011.jpg',	'Елена Г.'),
		('DCIM_0109.jpg',	'Женя Г.'),
		('DCIM_0110.jpg',	'Женя Г.'),
		('DCIM_0111.jpg',	'Женя Г.'),
		('DCIM_0112.jpg',	'Женя Г.'),
		('DCIM_0113.jpg',	'Женя Г.'),
		('DCIM_0114.jpg',	'Женя Г.'),
		('DCIM_0094.jpg',	'Женя Г.'),
		('DCIM_0043.jpg',	'Женя Г.'),
		('DCIM_0140.jpg',	'Марианна Е.'),
		('DCIM_0141.jpg',	'Марианна Е.'),
		('DCIM_0142.jpg',	'Марианна Е.'),
		('DCIM_0143.jpg',	'Марианна Е.'),
		('DCIM_0144.jpg',	'Марианна Е.'),
		('DCIM_0145.jpg',	'Марианна Е.'),
		('DCIM_0042.jpg',	'Татьяна З.'),
		('DCIM_0146.jpg',	'Татьяна З.'),
		('DCIM_0147.jpg',	'Татьяна З.'),
		('DCIM_0148.jpg',	'Татьяна З.'),
		('DCIM_0149.jpg',	'Татьяна З.'),
		('DCIM_0150.jpg',	'Татьяна З.'),
		('DCIM_0151.jpg',	'Татьяна З.'),
		('DCIM_0041.jpg',	'Татьяна З.'),
		('DCIM_0040.jpg',	'Татьяна З.'),
		('DCIM_0039.jpg',	'Татьяна З.'),
		('DCIM_0038.jpg',	'Татьяна З.'),
		('DCIM_0037.jpg',	'Татьяна З.'),
		('DCIM_0068.jpg',	'Надежда З.'),
		('DCIM_0067.jpg',	'Надежда З.'),
		('DCIM_0066.jpg',	'Надежда З.'),
		('DCIM_0065.jpg',	'Надежда З.'),
		('DCIM_0064.jpg',	'Надежда З.'),
		('DCIM_0063.jpg',	'Надежда З.'),
		('DCIM_0062.jpg',	'Надежда З.'),
		('DCIM_0061.jpg',	'Дмитрий К.'),
		('DCIM_0060.jpg',	'Дмитрий К.'),
		('DCIM_0059.jpg',	'Дмитрий К.'),
		('DCIM_0058.jpg',	'Дмитрий К.'),
		('DCIM_0056.jpg',	'Дмитрий К.'),
		('DCIM_0055.jpg',	'Дмитрий К.'),
		('DCIM_0054.jpg',	'Дмитрий К.'),
		('DCIM_0053.jpg',	'Дмитрий К.'),
		('DCIM_0052.jpg',	'Дмитрий К.'),
		('DCIM_0051.jpg',	'Дмитрий К.'),
		('DCIM_0050.jpg',	'Дмитрий К.'),
		('DCIM_0049.jpg',	'Дмитрий К.'),
		('DCIM_0036.jpg',	'Сергей Л.'),
		('DCIM_0035.jpg',	'Сергей Л.'),
		('DCIM_0034.jpg',	'Сергей Л.'),
		('DCIM_0033.jpg',	'Сергей Л.'),
		('DCIM_0032.jpg',	'Сергей Л.'),
		('DCIM_0031.jpg',	'Сергей Л.'),
		('DCIM_0030.jpg',	'Сергей Л.'),
		('DCIM_0029.jpg',	'Сергей Л.'),
		('DCIM_0028.jpg',	'Сергей Л.'),
		('DCIM_0027.jpg',	'Сергей Л.'),
		('DCIM_0012.jpg',	'Виктор О.'),
		('DCIM_0014.jpg',	'Виктор О.'),
		('DCIM_0015.jpg',	'Виктор О.'),
		('DCIM_0016.jpg',	'Виктор О.'),
		('DCIM_0017.jpg',	'Виктор О.'),
		('DCIM_0018.jpg',	'Виктор О.'),
		('DCIM_0019.jpg',	'Виктор О.'),
		('DCIM_0020.jpg',	'Виктор О.'),
		('DCIM_0021.jpg',	'Виктор О.'),
		('DCIM_0023.jpg',	'Виктор О.'),
		('DCIM_0022.jpg',	'Виктор О.'),
		('DCIM_0096.jpg',	'Виктор О.'),
		('DCIM_0004.jpg',	'Владимир Р.'),
		('DCIM_0025.jpg',	'Владимир Р.'),
		('DCIM_0024.jpg',	'Владимир Р.'),
		('DCIM_0026.jpg',	'Владимир Р.'),
		('DCIM_0005.jpg',	'Владимир Р.'),
		('DCIM_0006.jpg',	'Владимир Р.'),
		('DCIM_0007.jpg',	'Владимир Р.'),
		('DCIM_0009.jpg',	'Владимир Р.'),
		('DCIM_0010.jpg',	'Владимир Р.'),
		('DCIM_0103.jpg',	'Любовь С.'),
		('DCIM_0104.jpg',	'Любовь С.'),
		('DCIM_0105.jpg',	'Любовь С.'),
		('DCIM_0106.jpg',	'Любовь С.'),
		('DCIM_0107.jpg',	'Любовь С.'),
		('DCIM_0108.jpg',	'Любовь С.'),
		('DCIM_0125.jpg',	'Виктория С.'),
		('DCIM_0126.jpg',	'Виктория С.'),
		('DCIM_0127.jpg',	'Виктория С.'),
		('DCIM_0047.jpg',	'Виктория С.'),
		('DCIM_0046.jpg',	'Виктория С.'),
		('DCIM_0045.jpg',	'Виктория С.'),
		('DCIM_0044.jpg',	'Виктория С.'),
		('DCIM_0121.jpg',	'Виктор Ф.'),
		('DCIM_0122.jpg',	'Виктор Ф.'),
		('DCIM_0123.jpg',	'Виктор Ф.'),
		('DCIM_0124.jpg',	'Виктор Ф.'),
		('DCIM_0095.jpg',	'Виктор Ф.'),
		('DCIM_0079.jpg',	'Виктор Ф.'),
		('DCIM_0078.jpg',	'Виктор Ф.'),
		('DCIM_0077.jpg',	'Виктор Ф.'),
		('DCIM_0076.jpg',	'Виктор Ф.'),
		('DCIM_0075.jpg',	'Виктор Ф.'),
		('DCIM_0097.jpg',	'Лев Х.'),
		('DCIM_0098.jpg',	'Лев Х.'),
		('DCIM_0099.jpg',	'Лев Х.'),
		('DCIM_0100.jpg',	'Лев Х.'),
		('DCIM_0101.jpg',	'Лев Х.'),
		('DCIM_0102.jpg',	'Лев Х.');

INSERT INTO parameters (title, pkey, max_value, min_value) 
VALUES  ('Нажим', 'pressure', (SELECT id FROM images WHERE title = 'DCIM_0058.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0077.jpg')),
		('Четкость', 'definition', (SELECT id FROM images WHERE title = 'DCIM_0093.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0134.jpg')),
		('Толщина', 'thickness', (SELECT id FROM images WHERE title = 'DCIM_0125.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0105.jpg')),
		('Гибкость', 'flexibility', (SELECT id FROM images WHERE title = 'DCIM_0040.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0088.jpg')),
		('Частота штриха', 'stroke-frequency', (SELECT id FROM images WHERE title = 'DCIM_0050.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0139.jpg')),
		('Градации тона', 'gradation-tone', (SELECT id FROM images WHERE title = 'DCIM_0141.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0138.jpg')),
		('Контраст', 'contrast', (SELECT id FROM images WHERE title = 'DCIM_0136.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0151.jpg'));
COMMIT;

BEGIN;
	CREATE OR REPLACE view all_values_view AS
		SELECT 
			(pv.test_id + pv.parameter_id) AS id,
			pv.test_id AS test_id,
			TO_TIMESTAMP(ai.start_time/1000) AS start_date,
			pv.value AS value,
			pv.parameter_id AS parameter_id,
			i.title AS image_title,
			i.id AS image_id,
			((ai.end_time - ai.start_time)/1000)/60 AS score_min,
			ai.id AS add_info_id
		FROM parameter_values pv
		JOIN additional_info ai USING(test_id)
		JOIN registers r ON ai.test_id = r.id
		JOIN images i ON pv.image_id = i.id
		WHERE r.test_finished IS TRUE;
COMMIT;

BEGIN;
	CREATE OR REPLACE VIEW diff_values_view AS	
		SELECT  
			MAX(image_title) AS image_title,
			MIN(p.title) AS parameter_title,
			ARRAY_AGG(value) AS values,
			ROUND(AVG(value), 3) AS diff_value, 
			ROUND(MAX(score_min), 1) AS score
		FROM all_values_view v
		JOIN parameters p ON p.id = v.parameter_id
		GROUP BY image_id, parameter_id
		ORDER BY image_id, parameter_id;
		
	CREATE OR REPLACE VIEW diff_values_view2 AS	
	SELECT
		title, 
		val[1] AS pressure, 
		val[2] AS definition, 
		val[3] AS thickness, 
		val[4] AS flexibility, 
		val[5] AS stroke_frequency, 
		val[6] AS gradation_tone, 
		val[7] AS contrast
	FROM (
		SELECT 
			image_title AS title,
			ARRAY_AGG(diff_value) AS val
		FROM diff_values_view 
		GROUP BY image_title
	) t;
COMMIT;

BEGIN;
	
	CREATE OR REPLACE FUNCTION create_quiz() RETURNS JSON AS $$
		WITH image_rate AS (
			WITH nils AS (
				SELECT i.id, i.title, 0 as rait FROM parameter_values pv
				RIGHT JOIN images i ON i.id = pv.image_id
				WHERE pv.value IS NULL
			), maxvals AS (
				SELECT i.id, MAX(i.title) as title, (COUNT(pv.value) * CASE WHEN SUM(pv.value)=0 THEN 1 ELSE 10 END) as rait
				FROM parameter_values pv
				RIGHT JOIN images i ON i.id = pv.image_id
				WHERE pv.value IS NOT NULL
				GROUP BY i.id
			)
			select * from nils
			union 
			select * from maxvals
			ORDER BY rait
			LIMIT 2
		), quiz AS (
			INSERT INTO registers (created_at, img_titles, test_finished) 
			SELECT NOW(), ARRAY_AGG(title), false FROM image_rate
			returning id, img_titles
		), insert_params_value AS (
			INSERT INTO parameter_values (value, test_id, image_id, parameter_id) 
			VALUES  (0, (SELECT id FROM quiz), (SELECT (array_agg(id))[1] FROM image_rate), 1),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[2] FROM image_rate), 1),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[1] FROM image_rate), 2),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[2] FROM image_rate), 2),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[1] FROM image_rate), 3),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[2] FROM image_rate), 3),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[1] FROM image_rate), 4),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[2] FROM image_rate), 4),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[1] FROM image_rate), 5),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[2] FROM image_rate), 5),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[1] FROM image_rate), 6),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[2] FROM image_rate), 6),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[1] FROM image_rate), 7),
					(0, (SELECT id FROM quiz), (SELECT (array_agg(id))[2] FROM image_rate), 7)																			 
		)
		SELECT ROW_TO_JSON(quiz) FROM  quiz;
	$$ LANGUAGE sql;	
	
	CREATE OR REPLACE FUNCTION addValue(test_id INTEGER, image_id INTEGER, parameter_id INTEGER, value float) RETURNS BOOLEAN AS 
	$$
	BEGIN
			INSERT INTO parameter_values (value, test_id, parameter_id, image_id) 
			VALUES (value, test_id, parameter_id, image_id);
			RETURN true;
			EXCEPTION 
			WHEN unique_violation THEN
			RETURN false;
	END;
	$$ LANGUAGE plpgsql;
	
	CREATE OR REPLACE FUNCTION finish(testid INTEGER) RETURNS BOOLEAN AS 
	$$
	DECLARE full_fill boolean; 
			test_not_exists boolean; 
	BEGIN
		SELECT (count(*) = 0) INTO test_not_exists FROM registers WHERE id = testid;
		IF test_not_exists THEN
			RAISE NOTICE  'Quiz with id % not found', testid;
			RETURN false;
		END IF;
		SELECT (count(value) = 0) INTO full_fill FROM parameter_values WHERE test_id = testid and value = 0;
		RAISE NOTICE  'Quiz values is full fill % ', full_fill;
		IF full_fill THEN 
			RETURN true;
		END IF;
		RETURN false;
	END;
	$$ LANGUAGE plpgsql;
	
	CREATE OR REPLACE FUNCTION countReport() RETURNS JSON AS $$
		SELECT ROW_TO_JSON(cn) FROM (
			SELECT (ARRAY_AGG(count))[1] AS not_finished, (ARRAY_AGG(count))[2] AS finished FROM (
			SELECT test_finished, COUNT(test_finished) 
			FROM registers 
			WHERE test_finished IS NOT NULL
			GROUP BY test_finished
			ORDER BY test_finished
			) t
	) cn;
	$$ LANGUAGE sql;
	
	CREATE OR REPLACE FUNCTION allRowReport() RETURNS JSON AS $$
		SELECT ARRAY_TO_JSON(ARRAY_AGG(all_values_view)) FROM all_values_view;
	$$ LANGUAGE sql;
	
	CREATE OR REPLACE FUNCTION diffValuesReport() RETURNS JSON AS $$
		SELECT ARRAY_TO_JSON(ARRAY_AGG(diff_values_view2)) FROM diff_values_view2;
	$$ LANGUAGE sql;
	
	--CREATE OR REPLACE FUNCTION importStudentData() RETURN INTEGER AS $$
	--	WITH 
	--$$ LANGUAGE SQL;
	
COMMIT;


