--rollback

BEGIN;
DROP TABLE cluster_analyzes;

UPDATE images SET title = trim(replace(title, '.jpg', ''));
UPDATE parameters SET pkey = 'stroke_frequency' WHERE pkey = 'stroke-frequency';
UPDATE parameters SET pkey = 'gradation_tone' WHERE pkey = 'gradation-tone';

ALTER TABLE parameter_values ALTER COLUMN test_id SET NOT NULL;
ALTER TABLE parameter_values ALTER COLUMN parameter_id SET NOT NULL;
ALTER TABLE parameter_values ALTER COLUMN image_id SET NOT NULL;

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

UPDATE parameter_values 
	SET image_id = (SELECT id FROM images WHERE title = 'DCIM_0058')
	WHERE id IN (
		SELECT pv.id FROM parameter_values pv
			JOIN images i on pv.image_id = i.id
			WHERE i.title = 'DCIM_0057');
DELETE FROM registers_images_join 
	WHERE image_id in (SELECT id FROM images WHERE title = 'DCIM_0057');
DELETE FROM images WHERE title = 'DCIM_0057';

ALTER TABLE images ADD COLUMN author text NOT NULL DEFAULT '';
UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0093';
UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0092';
UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0091';
UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0090';
UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0089';
UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0088';
UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0087';
UPDATE images SET author = 'Анна К.'  WHERE title = 'DCIM_0086';
UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0134';
UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0135';
UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0136';
UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0137';
UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0138';
UPDATE images SET author = 'Елена Б.'  WHERE title = 'DCIM_0139';
UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0128';
UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0129';
UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0130';
UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0131';
UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0132';
UPDATE images SET author = 'Валерия Б.'  WHERE title = 'DCIM_0133';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0115';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0116';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0117';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0118';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0119';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0120';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0085';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0084';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0083';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0082';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0081';
UPDATE images SET author = 'Мария В.'  WHERE title = 'DCIM_0080';
UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0074';
UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0073';
UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0072';
UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0071';
UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0070';
UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0069';
UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0008';
UPDATE images SET author = 'Елена Г.'  WHERE title = 'DCIM_0011';
UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0109';
UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0110';
UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0111';
UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0112';
UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0113';
UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0114';
UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0094';
UPDATE images SET author = 'Женя Г.'  WHERE title = 'DCIM_0043';
UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0140';
UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0141';
UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0142';
UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0143';
UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0144';
UPDATE images SET author = 'Марианна Е.'  WHERE title = 'DCIM_0145';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0042';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0146';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0147';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0148';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0149';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0150';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0151';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0041';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0040';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0039';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0038';
UPDATE images SET author = 'Татьяна З.'  WHERE title = 'DCIM_0037';
UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0068';
UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0067';
UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0066';
UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0065';
UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0064';
UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0063';
UPDATE images SET author = 'Надежда З.'  WHERE title = 'DCIM_0062';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0061';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0060';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0059';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0058';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0056';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0055';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0054';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0053';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0052';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0051';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0050';
UPDATE images SET author = 'Дмитрий К.'  WHERE title = 'DCIM_0049';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0036';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0035';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0034';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0033';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0032';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0031';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0030';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0029';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0028';
UPDATE images SET author = 'Сергей Л.'  WHERE title = 'DCIM_0027';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0012';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0014';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0015';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0016';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0017';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0018';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0019';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0020';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0021';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0023';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0022';
UPDATE images SET author = 'Виктор О.'  WHERE title = 'DCIM_0096';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0004';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0025';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0024';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0026';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0005';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0006';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0007';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0009';
UPDATE images SET author = 'Владимир Р.'  WHERE title = 'DCIM_0010';
UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0103';
UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0104';
UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0105';
UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0106';
UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0107';
UPDATE images SET author = 'Любовь С.'  WHERE title = 'DCIM_0108';
UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0125';
UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0126';
UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0127';
UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0047';
UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0046';
UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0045';
UPDATE images SET author = 'Виктория С.'  WHERE title = 'DCIM_0044';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0121';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0122';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0123';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0124';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0095';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0079';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0078';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0077';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0076';
UPDATE images SET author = 'Виктор Ф.'  WHERE title = 'DCIM_0075';
UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0097';
UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0098';
UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0099';
UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0100';
UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0101';
UPDATE images SET author = 'Лев X.' WHERE title = 'DCIM_0102';

ALTER TABLE parameter_values ADD UNIQUE (test_id, parameter_id, image_id);

INSERT INTO additional_info
	(start_time, end_time, sex, year_birth, education, profession, raw_data, test_id)
	SELECT
		TO_TIMESTAMP(((additional_info::JSON ->> 'start-time')::numeric)/1000) AS start_time,
		TO_TIMESTAMP(((additional_info::JSON ->> 'end-time')::numeric)/1000) AS end_time,
		left((additional_info::JSON->>'sex')::TEXT, 1) AS sex,
		(additional_info::JSON->>'age')::INTEGER AS year_birth,
		additional_info::JSON->>'education' AS education,
		additional_info::JSON->>'profession' AS profession,
		additional_info::JSON,
		id
	FROM registers
	WHERE additional_info IS NOT NULL;

ALTER TABLE registers ADD COLUMN test_finished BOOLEAN;
ALTER TABLE registers ADD COLUMN created_at DATE;

UPDATE registers SET test_finished = additional_info IS NOT NULL;

UPDATE registers
SET
	created_at = sq.ca
FROM 
	(SELECT
		registry_id as rid, 
		to_timestamp((max(r.additional_info)::json ->> 'start-time')::numeric / 1000)::date as ca
	FROM 
		registers_images_join rij
		JOIN images i on rij.image_id = i.id
		JOIN registers r on rij.registry_id = r.id
	GROUP BY rij.registry_id) as sq
WHERE sq.rid = id;

ALTER TABLE registers DROP COLUMN answer;
ALTER TABLE registers DROP COLUMN additional_info;

DROP TABLE registers_images_join;

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

CREATE OR REPLACE VIEW all_values_view AS
	SELECT
		(pv.test_id + pv.parameter_id) AS id,
		pv.test_id AS test_id,
		ai.start_time::date AS start_date,
		pv.value AS value,
		pv.parameter_id AS parameter_id,
		i.title AS image_title,
		i.author AS author,
		i.id AS image_id,
		date_part('min', (ai.end_time - ai.start_time)) AS score_min,
		ai.id AS add_info_id
	FROM parameter_values pv
	JOIN additional_info ai USING(test_id)
	JOIN registers r ON ai.test_id = r.id
	JOIN images i ON pv.image_id = i.id
	WHERE r.test_finished IS TRUE;

CREATE OR REPLACE VIEW diff_values_view AS
	SELECT
		MAX(image_title) AS image_title,
		MAX(author) AS author,
		MIN(p.title) AS parameter_title,
		ARRAY_AGG(value) AS values,
		ROUND(AVG(value), 3) AS diff_value,
		MAX(score_min) AS score
	FROM all_values_view v
	JOIN parameters p ON p.id = v.parameter_id
	WHERE v.score_min >= 2
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
