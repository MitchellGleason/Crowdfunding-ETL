select cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;

SELECT DISTINCT b.cf_id, c.backers_count
FROM backers AS b
JOIN campaign AS c
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
ORDER BY c.backers_count DESC;

SELECT *
--INTO email_contacts_remaining_goal_amount
FROM (
	SELECT DISTINCT ON (b.cf_id) b.first_name, b.last_name, b.email,
	(c.goal - c.pledged) AS "Remaining Goal Amount"
	FROM backers AS b
	JOIN campaign AS c
	ON c.cf_id = b.cf_id
	WHERE c.outcome = 'live'
	ORDER BY b.cf_id
	) AS subq
ORDER BY "Remaining Goal Amount" DESC;

SELECT b.email, b.first_name, b.last_name, b.cf_id,
	c.company_name, c.description, c.end_date, (c.goal - c.pledged) AS "Left of Goal"
--INTO email_backers_remaining_goal_amount
FROM backers AS b
JOIN campaign AS c
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
ORDER BY b.email DESC;