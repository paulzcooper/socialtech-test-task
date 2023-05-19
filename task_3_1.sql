-- 3.1.1. Calculate the number of registrations for new users by day and country group
SELECT DATE(u.date_reg) date_reg,
	   c.country_group,
	   COUNT(u.id) n_users
FROM users u
		JOIN countries c ON u.id_country = c.id
GROUP BY date(u.date_reg), c.country_group;

-- 3.1.2. Calculate the percent of emails, that were clicked during the first 10 mins after the email was sent,
-- within the last 7 days; 
WITH last_week_emails AS (
SELECT es.id id_email,
        es.date_sent,
        es.id_type,
        ec.date_click,
      TIMESTAMPDIFF(MINUTE, es.date_sent, ec.date_click) AS min_delta
FROM emails_sent es
        LEFT JOIN emails_clicks ec ON es.id = ec.id_email
WHERE DATE(es.date_sent) >= NOW() - INTERVAL 7 DAY
),
clicked_in_ten AS (
SELECT id_type,
        COUNT(id_email) n_clicked 
FROM last_week_emails
WHERE min_delta <= 10
GROUP BY id_type
),
total_sent AS (
SELECT id_type, 
        COUNT(id_email) n_sent 
FROM last_week_emails
GROUP BY id_type
)
SELECT ts.id_type,
        100*n_clicked / n_sent
FROM total_sent ts
        LEFT JOIN clicked_in_ten ct ON ts.id_type = ct.id_type;
