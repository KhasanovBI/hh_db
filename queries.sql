-- Работодатели без вакансий (название компании, один из емейлов работодателя, время регистрации, время последнего входа)
SELECT
  c.name,
  u.email,
  u.registration_time,
  u.last_enter
FROM "user" u
  INNER JOIN company c ON u.id = c.user_id
  LEFT JOIN vacancy v ON c.id = v.company_id
WHERE v.id IS NULL;

-- Вакансии срок размещения которых истекает менее чем через сутки (название должности, название компании, один из емейлов работодателя, время истечения размещения)
SELECT
  v.name,
  c.name,
  u.email,
  v.close_time
FROM vacancy v
  INNER JOIN company c ON v.company_id = c.id
  INNER JOIN "user" u ON c.user_id = u.id
WHERE v.close_time < NOW() + INTERVAL '1 day';

-- Активные вакансии, которые размещены более чем неделю, но без сообщений от соискателей (название должности, название компании, один из емейлов работодателя,)
SELECT
  v.name,
  c.name AS company_name,
  u.email
FROM "user" u
  INNER JOIN company c ON u.id = c.user_id
  INNER JOIN vacancy v ON c.id = v.company_id
  INNER JOIN message m ON v.id = m.vacancy_id
WHERE v.close_time >= NOW() AND v.open_time < NOW() - INTERVAL '1 week' AND m.user_id != u.id
GROUP BY v.name, c.name, u.email
HAVING COUNT(*) = 0;

-- Количество уникальных откликов/приглашений на вакансию - количество пользователей откликнувшихся на вакансию (название должности, название компании, количество уникальных откликов)
SELECT
  v.name,
  c.name,
  count(r.user_id)
FROM vacancy v
  LEFT OUTER JOIN response r
    ON v.id = r.vacancy_id
  INNER JOIN company c
    ON v.company_id = c.id
GROUP BY v.id, c.id;

-- Среднее количество откликов/приглашений на вакансию у компаний (название компании, количество)
SELECT
  c.name,
  (CASE WHEN COUNT(DISTINCT v.id) = 0
    THEN 0
   ELSE CAST(COUNT(r.id) AS REAL) / COUNT(DISTINCT v.id)
   END) AS average
FROM company c
  LEFT JOIN vacancy v ON c.id = v.company_id
  LEFT JOIN response r ON v.id = r.vacancy_id
GROUP BY c.id;
