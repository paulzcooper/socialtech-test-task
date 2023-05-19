-- 3.2 Calculate the total time (unrounded) of all user sessions for each user,
-- for every day for the last 10 days (including the current day).
WITH sessions AS (
SELECT DISTINCT us.id_user, DATE(us.date_action) date,
      CASE WHEN us.action = 'open' THEN us.date_action
          WHEN us.action = 'close' THEN LAG(us.date_action,1) OVER
          (PARTITION BY us.id_user ORDER BY us.date_action)
      END AS session_opened,
      CASE WHEN us.action = 'close' THEN us.date_action
          WHEN us.action = 'open' THEN LEAD(us.date_action,1) OVER
          (PARTITION BY us.id_user ORDER BY us.date_action)
      END AS session_closed
FROM users_sessions us
WHERE us.date_action > us.date_action - 10
),
session_dur AS (
SELECT s.id_user,
      s.date,
      s.session_opened,
      s.session_closed,
      TIMESTAMPDIFF(SECOND, s.session_opened, s.session_closed) session_duration_sec
FROM sessions s
),
last_10_days AS (
SELECT CURDATE() AS date
   UNION SELECT CURDATE() - INTERVAL 1 DAY
   UNION SELECT CURDATE() - INTERVAL 2 DAY
   UNION SELECT CURDATE() - INTERVAL 3 DAY
   UNION SELECT CURDATE() - INTERVAL 4 DAY
   UNION SELECT CURDATE() - INTERVAL 5 DAY
   UNION SELECT CURDATE() - INTERVAL 6 DAY
   UNION SELECT CURDATE() - INTERVAL 7 DAY
   UNION SELECT CURDATE() - INTERVAL 8 DAY
   UNION SELECT CURDATE() - INTERVAL 9 DAY
   UNION SELECT CURDATE() - INTERVAL 10 DAY
),
user_date AS (
SELECT u.id id_user,
       l10d.date
FROM last_10_days l10d, users u
)
SELECT ud.id_user,
       ud.date,
       SUM(sd.session_duration_sec) / 3600 total_dur_hours,
       sd.session_opened,
       sd.session_closed
FROM user_date ud
      LEFT JOIN session_dur sd ON ud.id_user = sd.id_user AND sd.date = ud.date
GROUP BY ud.id_user, ud.date, sd.session_opened, sd.session_closed
ORDER BY ud.date DESC, ud.id_user;
