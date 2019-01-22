BEGIN;
CREATE TABLE IF NOT EXISTS images (
	id 		SERIAL  	PRIMARY KEY,
	title 	VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS parameters (
	id  		SERIAL 			PRIMARY KEY,
	title 		VARCHAR(255) 	NOT NULL,
	pkey 		VARCHAR(255) 	NOT NULL,
	max_value 	INTEGER 		REFERENCES images(id) 	NOT NULL,
	min_value 	INTEGER			REFERENCES images(id) 	NOT NULL
);

CREATE TABLE IF NOT EXISTS registers (
    id 		SERIAL 	PRIMARY KEY,
    answer 	TEXT 	NOT NULL,
	additional_info	TEXT
);

CREATE TABLE IF NOT EXISTS parameter_values (
    id 				SERIAL 		PRIMARY KEY,
    value 			NUMERIC 	NOT NULL,
    test_id 		INTEGER 	REFERENCES registers(id),
    parameter_id 	INTEGER 	REFERENCES parameters(id),
    image_id 		INTEGER 	REFERENCES images(id)
);

CREATE TABLE IF NOT EXISTS registers_images_join (
    registry_id 	INTEGER 	REFERENCES registers(id),
    image_id 		INTEGER 	REFERENCES images(id)
);

INSERT INTO images (title) 
VALUES 	('DCIM_0004.jpg'), ('DCIM_0005.jpg'), ('DCIM_0006.jpg'), ('DCIM_0007.jpg'), ('DCIM_0008.jpg'),
		('DCIM_0009.jpg'), ('DCIM_0010.jpg'), ('DCIM_0011.jpg'), ('DCIM_0012.jpg'), ('DCIM_0014.jpg'),
		('DCIM_0015.jpg'), ('DCIM_0016.jpg'), ('DCIM_0017.jpg'), ('DCIM_0018.jpg'), ('DCIM_0019.jpg'),
		('DCIM_0020.jpg'), ('DCIM_0021.jpg'), ('DCIM_0022.jpg'), ('DCIM_0023.jpg'), ('DCIM_0024.jpg'),
		('DCIM_0025.jpg'), ('DCIM_0026.jpg'), ('DCIM_0027.jpg'), ('DCIM_0028.jpg'), ('DCIM_0029.jpg'),
		('DCIM_0030.jpg'), ('DCIM_0031.jpg'), ('DCIM_0032.jpg'), ('DCIM_0033.jpg'), ('DCIM_0034.jpg'),
		('DCIM_0035.jpg'), ('DCIM_0036.jpg'), ('DCIM_0037.jpg'), ('DCIM_0038.jpg'), ('DCIM_0039.jpg'),
		('DCIM_0040.jpg'), ('DCIM_0041.jpg'), ('DCIM_0042.jpg'), ('DCIM_0043.jpg'), ('DCIM_0044.jpg'),
		('DCIM_0045.jpg'), ('DCIM_0046.jpg'), ('DCIM_0047.jpg'), ('DCIM_0049.jpg'), ('DCIM_0050.jpg'),
		('DCIM_0051.jpg'), ('DCIM_0052.jpg'), ('DCIM_0053.jpg'), ('DCIM_0054.jpg'), ('DCIM_0055.jpg'),
		('DCIM_0056.jpg'), ('DCIM_0057.jpg'), ('DCIM_0058.jpg'), ('DCIM_0059.jpg'), ('DCIM_0060.jpg'),
		('DCIM_0061.jpg'), ('DCIM_0062.jpg'), ('DCIM_0063.jpg'), ('DCIM_0064.jpg'), ('DCIM_0065.jpg'),
		('DCIM_0066.jpg'), ('DCIM_0067.jpg'), ('DCIM_0068.jpg'), ('DCIM_0069.jpg'), ('DCIM_0070.jpg'),
		('DCIM_0071.jpg'), ('DCIM_0072.jpg'), ('DCIM_0073.jpg'), ('DCIM_0074.jpg'), ('DCIM_0075.jpg'),
		('DCIM_0076.jpg'), ('DCIM_0077.jpg'), ('DCIM_0078.jpg'), ('DCIM_0079.jpg'), ('DCIM_0080.jpg'),
		('DCIM_0081.jpg'), ('DCIM_0082.jpg'), ('DCIM_0083.jpg'), ('DCIM_0084.jpg'), ('DCIM_0085.jpg'),
		('DCIM_0086.jpg'), ('DCIM_0087.jpg'), ('DCIM_0088.jpg'), ('DCIM_0089.jpg'), ('DCIM_0090.jpg'),
		('DCIM_0091.jpg'), ('DCIM_0092.jpg'), ('DCIM_0093.jpg'), ('DCIM_0094.jpg'), ('DCIM_0095.jpg'),
		('DCIM_0096.jpg'), ('DCIM_0097.jpg'), ('DCIM_0098.jpg'), ('DCIM_0099.jpg'), ('DCIM_0100.jpg'),
		('DCIM_0101.jpg'), ('DCIM_0102.jpg'), ('DCIM_0103.jpg'), ('DCIM_0104.jpg'), ('DCIM_0105.jpg'),
		('DCIM_0106.jpg'), ('DCIM_0107.jpg'), ('DCIM_0108.jpg'), ('DCIM_0109.jpg'), ('DCIM_0110.jpg'),
		('DCIM_0111.jpg'), ('DCIM_0112.jpg'), ('DCIM_0113.jpg'), ('DCIM_0114.jpg'), ('DCIM_0115.jpg'),
		('DCIM_0116.jpg'), ('DCIM_0117.jpg'), ('DCIM_0118.jpg'), ('DCIM_0119.jpg'), ('DCIM_0120.jpg'),
		('DCIM_0121.jpg'), ('DCIM_0122.jpg'), ('DCIM_0123.jpg'), ('DCIM_0124.jpg'), ('DCIM_0125.jpg'),
		('DCIM_0126.jpg'), ('DCIM_0127.jpg'), ('DCIM_0128.jpg'), ('DCIM_0129.jpg'), ('DCIM_0130.jpg'),
		('DCIM_0131.jpg'), ('DCIM_0132.jpg'), ('DCIM_0133.jpg'), ('DCIM_0134.jpg'), ('DCIM_0135.jpg'),
		('DCIM_0136.jpg'), ('DCIM_0137.jpg'), ('DCIM_0138.jpg'), ('DCIM_0139.jpg'), ('DCIM_0140.jpg'),
		('DCIM_0141.jpg'), ('DCIM_0142.jpg'), ('DCIM_0143.jpg'), ('DCIM_0144.jpg'), ('DCIM_0145.jpg'),
		('DCIM_0146.jpg'), ('DCIM_0147.jpg'), ('DCIM_0148.jpg'), ('DCIM_0149.jpg'), ('DCIM_0150.jpg'),
		('DCIM_0151.jpg');

INSERT INTO parameters (title, pkey, max_value, min_value) 
VALUES  ('Нажим', 'pressure', (SELECT id FROM images WHERE title = 'DCIM_0058.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0077.jpg')),
		('Четкость', 'definition', (SELECT id FROM images WHERE title = 'DCIM_0093.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0134.jpg')),
		('Толщина', 'thickness', (SELECT id FROM images WHERE title = 'DCIM_0125.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0105.jpg')),
		('Гибкость', 'flexibility', (SELECT id FROM images WHERE title = 'DCIM_0040.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0088.jpg')),
		('Частота штриха', 'stroke-frequency', (SELECT id FROM images WHERE title = 'DCIM_0050.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0139.jpg')),
		('Градации тона', 'gradation-tone', (SELECT id FROM images WHERE title = 'DCIM_0141.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0138.jpg')),
		('Контраст', 'contrast', (SELECT id FROM images WHERE title = 'DCIM_0136.jpg'), (SELECT id FROM images WHERE title = 'DCIM_0151.jpg'));
	
COMMIT;
	
	
