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
	test_finished 	BOOLEAN
);

CREATE TABLE IF NOT EXISTS parameter_values (
    id 				SERIAL 		PRIMARY KEY,
    value 			NUMERIC 	NOT NULL,
    test_id 		INTEGER 	REFERENCES registers(id) NOT NULL,
    parameter_id 	INTEGER 	REFERENCES parameters(id) NOT NULL,
    image_id 		INTEGER 	REFERENCES images(id) NOT NULL,
	UNIQUE (test_id, parameter_id, image_id)
);

CREATE TABLE IF NOT EXISTS additional_info (
	id 			serial 		PRIMARY KEY,
	start_time 	TIMESTAMP,
	end_time 	TIMESTAMP,
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
	contrast 			INTEGER		NOT NULL,
	test_id				INTEGER 	REFERENCES registers(id)
);

CREATE TABLE IF NOT EXISTS external_systems (
	id			serial 	PRIMARY KEY,
	key 		VARCHAR(5) 	NOT NULL,
	UNIQUE (key)
);

INSERT INTO external_systems (key) VALUES ('web');

INSERT INTO images (title, author) 
VALUES 	('DCIM_0093',	'Анна К.'),
		('DCIM_0092',	'Анна К.'),
		('DCIM_0091',	'Анна К.'),
		('DCIM_0090',	'Анна К.'),
		('DCIM_0089',	'Анна К.'),
		('DCIM_0088',	'Анна К.'),
		('DCIM_0087',	'Анна К.'),
		('DCIM_0086',	'Анна К.'),
		('DCIM_0134',	'Елена Б.'),
		('DCIM_0135',	'Елена Б.'),
		('DCIM_0136',	'Елена Б.'),
		('DCIM_0137',	'Елена Б.'),
		('DCIM_0138',	'Елена Б.'),
		('DCIM_0139',	'Елена Б.'),
		('DCIM_0128',	'Валерия Б.'),
		('DCIM_0129',	'Валерия Б.'),
		('DCIM_0130',	'Валерия Б.'),
		('DCIM_0131',	'Валерия Б.'),
		('DCIM_0132',	'Валерия Б.'),
		('DCIM_0133',	'Валерия Б.'),
		('DCIM_0115',	'Мария В.'),
		('DCIM_0116',	'Мария В.'),
		('DCIM_0117',	'Мария В.'),
		('DCIM_0118',	'Мария В.'),
		('DCIM_0119',	'Мария В.'),
		('DCIM_0120',	'Мария В.'),
		('DCIM_0085',	'Мария В.'),
		('DCIM_0084',	'Мария В.'),
		('DCIM_0083',	'Мария В.'),
		('DCIM_0082',	'Мария В.'),
		('DCIM_0081',	'Мария В.'),
		('DCIM_0080',	'Мария В.'),
		('DCIM_0074',	'Елена Г.'),
		('DCIM_0073',	'Елена Г.'),
		('DCIM_0072',	'Елена Г.'),
		('DCIM_0071',	'Елена Г.'),
		('DCIM_0070',	'Елена Г.'),
		('DCIM_0069',	'Елена Г.'),
		('DCIM_0008',	'Елена Г.'),
		('DCIM_0011',	'Елена Г.'),
		('DCIM_0109',	'Женя Г.'),
		('DCIM_0110',	'Женя Г.'),
		('DCIM_0111',	'Женя Г.'),
		('DCIM_0112',	'Женя Г.'),
		('DCIM_0113',	'Женя Г.'),
		('DCIM_0114',	'Женя Г.'),
		('DCIM_0094',	'Женя Г.'),
		('DCIM_0043',	'Женя Г.'),
		('DCIM_0140',	'Марианна Е.'),
		('DCIM_0141',	'Марианна Е.'),
		('DCIM_0142',	'Марианна Е.'),
		('DCIM_0143',	'Марианна Е.'),
		('DCIM_0144',	'Марианна Е.'),
		('DCIM_0145',	'Марианна Е.'),
		('DCIM_0042',	'Татьяна З.'),
		('DCIM_0146',	'Татьяна З.'),
		('DCIM_0147',	'Татьяна З.'),
		('DCIM_0148',	'Татьяна З.'),
		('DCIM_0149',	'Татьяна З.'),
		('DCIM_0150',	'Татьяна З.'),
		('DCIM_0151',	'Татьяна З.'),
		('DCIM_0041',	'Татьяна З.'),
		('DCIM_0040',	'Татьяна З.'),
		('DCIM_0039',	'Татьяна З.'),
		('DCIM_0038',	'Татьяна З.'),
		('DCIM_0037',	'Татьяна З.'),
		('DCIM_0068',	'Надежда З.'),
		('DCIM_0067',	'Надежда З.'),
		('DCIM_0066',	'Надежда З.'),
		('DCIM_0065',	'Надежда З.'),
		('DCIM_0064',	'Надежда З.'),
		('DCIM_0063',	'Надежда З.'),
		('DCIM_0062',	'Надежда З.'),
		('DCIM_0061',	'Дмитрий К.'),
		('DCIM_0060',	'Дмитрий К.'),
		('DCIM_0059',	'Дмитрий К.'),
		('DCIM_0058',	'Дмитрий К.'),
		('DCIM_0056',	'Дмитрий К.'),
		('DCIM_0055',	'Дмитрий К.'),
		('DCIM_0054',	'Дмитрий К.'),
		('DCIM_0053',	'Дмитрий К.'),
		('DCIM_0052',	'Дмитрий К.'),
		('DCIM_0051',	'Дмитрий К.'),
		('DCIM_0050',	'Дмитрий К.'),
		('DCIM_0049',	'Дмитрий К.'),
		('DCIM_0036',	'Сергей Л.'),
		('DCIM_0035',	'Сергей Л.'),
		('DCIM_0034',	'Сергей Л.'),
		('DCIM_0033',	'Сергей Л.'),
		('DCIM_0032',	'Сергей Л.'),
		('DCIM_0031',	'Сергей Л.'),
		('DCIM_0030',	'Сергей Л.'),
		('DCIM_0029',	'Сергей Л.'),
		('DCIM_0028',	'Сергей Л.'),
		('DCIM_0027',	'Сергей Л.'),
		('DCIM_0012',	'Виктор О.'),
		('DCIM_0014',	'Виктор О.'),
		('DCIM_0015',	'Виктор О.'),
		('DCIM_0016',	'Виктор О.'),
		('DCIM_0017',	'Виктор О.'),
		('DCIM_0018',	'Виктор О.'),
		('DCIM_0019',	'Виктор О.'),
		('DCIM_0020',	'Виктор О.'),
		('DCIM_0021',	'Виктор О.'),
		('DCIM_0023',	'Виктор О.'),
		('DCIM_0022',	'Виктор О.'),
		('DCIM_0096',	'Виктор О.'),
		('DCIM_0004',	'Владимир Р.'),
		('DCIM_0025',	'Владимир Р.'),
		('DCIM_0024',	'Владимир Р.'),
		('DCIM_0026',	'Владимир Р.'),
		('DCIM_0005',	'Владимир Р.'),
		('DCIM_0006',	'Владимир Р.'),
		('DCIM_0007',	'Владимир Р.'),
		('DCIM_0009',	'Владимир Р.'),
		('DCIM_0010',	'Владимир Р.'),
		('DCIM_0103',	'Любовь С.'),
		('DCIM_0104',	'Любовь С.'),
		('DCIM_0105',	'Любовь С.'),
		('DCIM_0106',	'Любовь С.'),
		('DCIM_0107',	'Любовь С.'),
		('DCIM_0108',	'Любовь С.'),
		('DCIM_0125',	'Виктория С.'),
		('DCIM_0126',	'Виктория С.'),
		('DCIM_0127',	'Виктория С.'),
		('DCIM_0047',	'Виктория С.'),
		('DCIM_0046',	'Виктория С.'),
		('DCIM_0045',	'Виктория С.'),
		('DCIM_0044',	'Виктория С.'),
		('DCIM_0121',	'Виктор Ф.'),
		('DCIM_0122',	'Виктор Ф.'),
		('DCIM_0123',	'Виктор Ф.'),
		('DCIM_0124',	'Виктор Ф.'),
		('DCIM_0095',	'Виктор Ф.'),
		('DCIM_0079',	'Виктор Ф.'),
		('DCIM_0078',	'Виктор Ф.'),
		('DCIM_0077',	'Виктор Ф.'),
		('DCIM_0076',	'Виктор Ф.'),
		('DCIM_0075',	'Виктор Ф.'),
		('DCIM_0097',	'Лев Х.'),
		('DCIM_0098',	'Лев Х.'),
		('DCIM_0099',	'Лев Х.'),
		('DCIM_0100',	'Лев Х.'),
		('DCIM_0101',	'Лев Х.'),
		('DCIM_0102',	'Лев Х.');

INSERT INTO parameters (title, pkey, max_value, min_value) 
VALUES  ('Нажим', 'pressure', (SELECT id FROM images WHERE title = 'DCIM_0058'), (SELECT id FROM images WHERE title = 'DCIM_0077')),
		('Четкость', 'definition', (SELECT id FROM images WHERE title = 'DCIM_0093'), (SELECT id FROM images WHERE title = 'DCIM_0134')),
		('Толщина', 'thickness', (SELECT id FROM images WHERE title = 'DCIM_0125'), (SELECT id FROM images WHERE title = 'DCIM_0105')),
		('Гибкость', 'flexibility', (SELECT id FROM images WHERE title = 'DCIM_0040'), (SELECT id FROM images WHERE title = 'DCIM_0088')),
		('Частота штриха', 'stroke-frequency', (SELECT id FROM images WHERE title = 'DCIM_0050'), (SELECT id FROM images WHERE title = 'DCIM_0139')),
		('Градации тона', 'gradation-tone', (SELECT id FROM images WHERE title = 'DCIM_0141'), (SELECT id FROM images WHERE title = 'DCIM_0138')),
		('Контраст', 'contrast', (SELECT id FROM images WHERE title = 'DCIM_0136'), (SELECT id FROM images WHERE title = 'DCIM_0151'));
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
	
	CREATE OR REPLACE FUNCTION get_quiz(testid INTEGER) RETURNS json AS $$
		select row_to_json(ss)
		from (
			select 
				test_id, json_agg(vals) as vls
			from (
				select 
				pv.test_id as test_id, 
				json_build_object(
					'parameter_id', pv.parameter_id, 
					'image_id',  pv.image_id, 
					'img_title', i.title, 
					'parameter_title', p.title, 
					'parameter_pkey', p.pkey, 	
					'parameter_value', pv.value, 
					'parameter_min_img_title', imin.title, 
					'parameter_max_img_title', imax.title) as vals
			from registers r
			join parameter_values pv on pv.test_id = r.id
			join parameters p on p.id = pv.parameter_id
			join images i on pv.image_id = i.id
			join images imin on p.min_value = imin.id
			join images imax on p.max_value = imax.id
			where r.id = testid
			) sub 
			group by test_id
		) ss;
	$$ LANGUAGE sql;

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
			INSERT INTO registers (created_at, test_finished) values (NOW(), false) returning id
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
	
COMMIT;


