INSERT INTO "user" (email, password, registration_time, last_enter) VALUES
  ('kernigan@mail.ru', '123456', '2015-01-01 00:00:00', '2017-01-01 00:00:00'),
  ('linus@mail.ru', 'qwerty', '2014-01-01 00:00:00', '2017-01-01 00:00:00'),
  ('torvalds@mail.ru', 'secret', '2013-01-01 00:00:00', '2017-01-01 00:00:00'),
  ('aaa@mail.ru', 'pass', '2014-01-01 00:00:00', '2017-01-01 00:00:00'),
  ('qwe@mail.ru', 'zaqwsx', '2011-01-01 00:00:00', '2017-01-01 00:00:00');


INSERT INTO company (name, user_id) VALUES
  ('yandex', 1),
  ('mail', 2),
  ('yahoo', 3),
  ('google', 4),
  ('rambler', 5);


INSERT INTO skill VALUES
  (1, 'python'),
  (2, 'java'),
  (3, 'sql'),
  (4, 'unix'),
  (5, 'postgres');


INSERT INTO vacancy VALUES
  (1, 1, 'first company job', 'very long description', NULL, 200000, 3, '2016-01-01 00:00:00', '2017-02-13 12:00:00'),
  (2, 2, 'second company job', 'very long description', 160000, NULL, NULL, '2017-02-11 00:00:00',
   '2017-02-18 12:00:00'),
  (3, 2, 'second company job', 'very long description', 160000, NULL, NULL, '2016-01-01 00:00:00',
   '2017-02-19 12:00:00');


INSERT INTO vacancy_skill VALUES
  (1, 4),
  (2, 3),
  (2, 4),
  (3, 1);


INSERT INTO resume VALUES
  (1, 1, 'Python разработчик', 'Petr', 'Ivanov', 'Vasilevich', '1991-02-12', 100000, 200000, 3),
  (2, 2, 'hh', 'Andrey', 'Sundukov', NULL, NULL, 100000, 200000, 2),
  (3, 3, 'Java dev', 'JVMov', 'JVM', 'JVMovich', '1900-02-02', NULL, 100500, 3),
  (4, 3, 'Тестировщик', 'Pop', 'Iggy', 'Popovich', NULL, 30000, NULL, 3);


INSERT INTO resume_skill VALUES
  (1, 4),
  (2, 3),
  (2, 4),
  (3, 1);


INSERT INTO chat VALUES
  (1, 1, 1),
  (2, 1, 2),
  (3, 2, 1),
  (4, 2, 3);


INSERT INTO message (chat_id, user_id, text, time) VALUES
  (1, 2, 'hello work', '2017-01-01 00:00:00'),
  (2, 3, 'give me a job', '2017-01-02 13:00:00'),
  (3, 1, 'take this job', '2017-01-02 14:00:00'),
  (4, 4, 'hi', '2017-01-12 10:00:00');
