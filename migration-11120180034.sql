BEGIN;
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
COMMIT;
BEGIN;
	ALTER TABLE images ADD COLUMN author text NOT NULL DEFAULT '';
	UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0093.jpg';
	UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0092.jpg';
	UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0091.jpg';
	UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0090.jpg';
	UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0089.jpg';
	UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0088.jpg';
	UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0087.jpg';
	UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0086.jpg';
	UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0134.jpg';
	UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0135.jpg';
	UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0136.jpg';
	UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0137.jpg';
	UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0138.jpg';
	UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0139.jpg';
	UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0128.jpg';
	UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0129.jpg';
	UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0130.jpg';
	UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0131.jpg';
	UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0132.jpg';
	UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0133.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0115.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0116.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0117.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0118.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0119.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0120.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0085.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0084.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0083.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0082.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0081.jpg';
	UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0080.jpg';
	UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0074.jpg';
	UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0073.jpg';
	UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0072.jpg';
	UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0071.jpg';
	UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0070.jpg';
	UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0069.jpg';
	UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0008.jpg';
	UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0011.jpg';
	UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0109.jpg';
	UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0110.jpg';
	UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0111.jpg';
	UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0112.jpg';
	UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0113.jpg';
	UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0114.jpg';
	UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0094.jpg';
	UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0043.jpg';
	UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0140.jpg';
	UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0141.jpg';
	UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0142.jpg';
	UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0143.jpg';
	UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0144.jpg';
	UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0145.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0042.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0146.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0147.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0148.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0149.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0150.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0151.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0041.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0040.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0039.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0038.jpg';
	UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0037.jpg';
	UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0068.jpg';
	UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0067.jpg';
	UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0066.jpg';
	UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0065.jpg';
	UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0064.jpg';
	UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0063.jpg';
	UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0062.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0061.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0060.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0059.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0058.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0056.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0055.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0054.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0053.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0052.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0051.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0050.jpg';
	UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0049.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0036.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0035.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0034.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0033.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0032.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0031.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0030.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0029.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0028.jpg';
	UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0027.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0012.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0014.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0015.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0016.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0017.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0018.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0019.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0020.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0021.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0023.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0022.jpg';
	UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0096.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0004.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0025.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0024.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0026.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0005.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0006.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0007.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0009.jpg';
	UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0010.jpg';
	UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0103.jpg';
	UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0104.jpg';
	UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0105.jpg';
	UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0106.jpg';
	UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0107.jpg';
	UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0108.jpg';
	UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0125.jpg';
	UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0126.jpg';
	UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0127.jpg';
	UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0047.jpg';
	UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0046.jpg';
	UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0045.jpg';
	UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0044.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0121.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0122.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0123.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0124.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0095.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0079.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0078.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0077.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0076.jpg';
	UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0075.jpg';
	UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0097.jpg';
	UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0098.jpg';
	UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0099.jpg';
	UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0100.jpg';
	UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0101.jpg';
	UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0102.jpg';
COMMIT;
BEGIN;
	ALTER TABLE registers ADD COLUMN test_finished BOOLEAN;
	ALTER TABLE registers ADD COLUMN created_at DATE;
COMMIT;

BEGIN;
	UPDATE registers SET test_finished = additional_info IS NOT NULL;
COMMIT;

BEGIN;
	ALTER TABLE parameter_values ADD UNIQUE (test_id, parameter_id, image_id);
COMMIT;

BEGIN;
	INSERT INTO additional_info
		(start_time, end_time, sex, year_birth, education, profession, raw_data, test_id)
		SELECT
			(additional_info::JSON->>'start-time')::NUMERIC AS start_time,
			(additional_info::JSON->>'end-time')::NUMERIC AS end_time,
			left((additional_info::JSON->>'sex')::TEXT, 1) AS sex,
			(additional_info::JSON->>'age')::INTEGER AS year_birth,
			additional_info::JSON->>'education' AS education,
			additional_info::JSON->>'profession' AS profession,
			additional_info::JSON,
			id
		FROM registers
		WHERE additional_info IS NOT NULL;
COMMIT;

BEGIN;
	ALTER TABLE registers DROP COLUMN answer;
	ALTER TABLE registers DROP COLUMN additional_info;
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
			i.author AS author,
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
			MAX(author) AS author,
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
		author,
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
			MAX(author) as author,
			ARRAY_AGG(diff_value) AS val
		FROM diff_values_view
		GROUP BY image_title
		ORDER BY author
	) t;
COMMIT;

BEGIN;
	ALTER TABLE registers ADD COLUMN img_titles TEXT[];
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
			additional_info_not_exists boolean;
	BEGIN
		SELECT (count(*) = 0) INTO test_not_exists FROM registers WHERE id = testid;
		IF test_not_exists THEN
			RAISE NOTICE  'Quiz with id % not found', testid;
			RETURN false;
		END IF;
		SELECT (count(*) = 0) INTO additional_info_not_exists FROM additional_info WHERE test_id = testid;
		IF additional_info_not_exists THEN
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

BEGIN;
	DROP TABLE registers_images_join;
	UPDATE parameter_values
	SET image_id = (SELECT id FROM images WHERE title = 'DCIM_0058.jpg')
	WHERE id IN (
		SELECT pv.id FROM parameter_values pv
	JOIN images i on pv.image_id = i.id
	WHERE i.title = 'DCIM_0057.jpg'
	);
	DELETE FROM images WHERE title = 'DCIM_0057.jpg';
COMMIT;
BEGIN;
	create or replace view additional_info_view_1 as
	select 
			profession,
			sex,
			year_birth,
			count(*)
		from additional_info
		where 
			profession is not null 
			and 
				sex is not null
			and
				year_birth is not null
		group by profession, sex, year_birth
		order by profession;
COMMIT;
