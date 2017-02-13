CREATE TABLE IF NOT EXISTS "user" (
  id                SERIAL PRIMARY KEY,
  email             VARCHAR(255) UNIQUE      NOT NULL,
  password          VARCHAR(128)             NOT NULL,
  registration_time TIMESTAMP WITH TIME ZONE NOT NULL,
  last_enter        TIMESTAMP WITH TIME ZONE NOT NULL
);


CREATE TABLE IF NOT EXISTS company (
  id      SERIAL PRIMARY KEY,
  name    VARCHAR(100) UNIQUE            NOT NULL,
  user_id INTEGER REFERENCES "user" (id) NOT NULL
);


CREATE TABLE IF NOT EXISTS vacancy (
  id          SERIAL PRIMARY KEY,
  company_id  INTEGER REFERENCES company (id) NOT NULL,
  name        VARCHAR(255)                    NOT NULL,
  description TEXT,
  salary_from INTEGER,
  salary_to   INTEGER,
  experience  SMALLINT,
  open_time   TIMESTAMP WITH TIME ZONE,
  close_time  TIMESTAMP WITH TIME ZONE
);


CREATE TABLE IF NOT EXISTS resume (
  id          SERIAL PRIMARY KEY,
  user_id     INTEGER REFERENCES "user" (id) NOT NULL,
  name        VARCHAR(255)                   NOT NULL,
  last_name   VARCHAR(50)                    NOT NULL,
  first_name  VARCHAR(50)                    NOT NULL,
  middle_name VARCHAR(50)                    NULL,
  birthday    DATE,
  salary_from INTEGER,
  salary_to   INTEGER,
  experience  SMALLINT
);


CREATE TABLE IF NOT EXISTS skill (
  id   SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS resume_skill (
  resume_id INTEGER NOT NULL,
  skill_id  INTEGER NOT NULL,
  FOREIGN KEY (resume_id) REFERENCES resume (id),
  FOREIGN KEY (skill_id) REFERENCES skill (id)
);
CREATE UNIQUE INDEX resume_skill_uniq
  ON resume_skill USING BTREE (resume_id, skill_id);
CREATE INDEX resume_skill_resume_idx
  ON resume_skill USING BTREE (resume_id);
CREATE INDEX resume_skill_skill_idx
  ON resume_skill USING BTREE (skill_id);


CREATE TABLE IF NOT EXISTS vacancy_skill (
  vacancy_id INTEGER NOT NULL,
  skill_id   INTEGER NOT NULL,
  FOREIGN KEY (vacancy_id) REFERENCES vacancy (id),
  FOREIGN KEY (skill_id) REFERENCES skill (id)
);
CREATE UNIQUE INDEX vacancy_skill_uniq
  ON vacancy_skill USING BTREE (vacancy_id, skill_id);
CREATE INDEX vacancy_skill_vacancy_idx
  ON vacancy_skill USING BTREE (vacancy_id);
CREATE INDEX vacancy_skill_skill_idx
  ON vacancy_skill USING BTREE (skill_id);


CREATE TABLE IF NOT EXISTS chat (
  id         SERIAL PRIMARY KEY,
  vacancy_id INT NOT NULL,
  resume_id  INT NOT NULL,
  FOREIGN KEY (vacancy_id) REFERENCES vacancy (id),
  FOREIGN KEY (resume_id) REFERENCES resume (id)
);
CREATE UNIQUE INDEX chat_vacancy_resume_uniq
  ON chat (vacancy_id, resume_id);
CREATE INDEX chat_vacancy_idx
  ON chat (vacancy_id);
CREATE INDEX chat_resume_idx
  ON chat (resume_id);


CREATE TABLE IF NOT EXISTS message (
  id      SERIAL PRIMARY KEY,
  chat_id INT                      NOT NULL,
  text    TEXT,
  time    TIMESTAMP WITH TIME ZONE NOT NULL,
  FOREIGN KEY (chat_id) REFERENCES chat (id)
);
CREATE INDEX message_chat_id_idx
  ON message (chat_id);
