INSERT INTO "user" (id, email, password, registration_time, last_enter)
  SELECT
    GENERATE_SERIES(100, 10100)         AS id,
    MD5(RANDOM() :: TEXT) || '@mail.ru' AS email,
    MD5(RANDOM() :: TEXT)               AS password,
    NOW(),
    NOW();

INSERT INTO company (id, name, user_id)
  SELECT
    GENERATE_SERIES(100, 5100),
    MD5(RANDOM() :: TEXT),
    GENERATE_SERIES(100, 5100);

INSERT INTO vacancy (id, company_id, name, description, salary_from, salary_to, experience, open_time, close_time)
  SELECT
    GENERATE_SERIES(100, 1000100),
    RANDOM() * 5000 + 100,
    MD5(RANDOM() :: TEXT),
    MD5(RANDOM() :: TEXT),
    RANDOM() * 100000,
    RANDOM() * 200000,
    RANDOM() * 10,
    NOW(),
    NOW();

INSERT INTO resume (id, user_id, name, last_name, first_name, middle_name, birthday, salary_from, salary_to, experience)
  SELECT
    GENERATE_SERIES(100, 1000100),
    RANDOM() * 100 + 10000,
    MD5(RANDOM() :: TEXT),
    MD5(RANDOM() :: TEXT),
    MD5(RANDOM() :: TEXT),
    MD5(RANDOM() :: TEXT),
    NOW(),
    RANDOM() * 100000,
    RANDOM() * 200000,
    RANDOM() * 10;

INSERT INTO skill (id, name)
  SELECT
    GENERATE_SERIES(100, 1100),
    MD5(RANDOM() :: TEXT);

INSERT INTO response (id, vacancy_id, user_id, time)
  SELECT
    GENERATE_SERIES(100, 100100),
    RANDOM() * 1000000 + 100,
    RANDOM() * 10000 + 100,
    NOW();

INSERT INTO message (id, vacancy_id, resume_id, user_id, text, time)
  SELECT
    GENERATE_SERIES(100, 1000100),
    RANDOM() * 1000000 + 100,
    RANDOM() * 1000000 + 100,
    RANDOM() * 10000 + 100,
    MD5(RANDOM() :: TEXT),
    NOW();