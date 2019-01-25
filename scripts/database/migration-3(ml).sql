--rollback

BEGIN;

INSERT INTO external_systems (key) VALUES ('ml');

COMMIT;
