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
  LEFT JOIN chat ch ON v.id = ch.vacancy_id
  INNER JOIN message m ON v.id = m.chat_id
WHERE v.close_time >= NOW() AND v.open_time < NOW() - INTERVAL '1 week' AND m.user_id != u.id
GROUP BY v.name, c.name, u.email
HAVING COUNT(*) = 0;
