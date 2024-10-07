-- Queries to compare the top 5 revenue of companies with and without healthcare benefits

SELECT * 
FROM fortune_companies
WHERE healthcare_benefits = 1
ORDER BY revenue DESC
LIMIT 5
;

SELECT *
FROM fortune_companies
WHERE healthcare_benefits = 0
ORDER BY revenue DESC
LIMIT 5
;

-- Compare average revenue between with and wihtout healcare benefits

SELECT ROUND(AVG(revenue),1) AS average_revenue, healthcare_benefits
FROM fortune_companies
GROUP BY healthcare_benefits
ORDER BY average_revenue DESC
;

-- Aggregate the amount of companies in each industry with an average revenue of 200+

SELECT industry, COUNT(industry) AS industry_count, ROUND(AVG(revenue),1) AS average_revenue 
FROM fortune_companies
GROUP BY industry
HAVING average_revenue >= 200
ORDER BY average_revenue DESC
;

-- Find out if there is a correlation between average tenure and paid holidays

SELECT avg_employee_tenure AS tenure,
CASE WHEN paid_time_off_days <= 15 THEN '15 or less'
WHEN paid_time_off_days <= 18 THEN '18 or less'
WHEN paid_time_off_days <= 20 THEN '20 or less'
ELSE '21 and above'
END 'paid_holiday'
FROM fortune_companies
GROUP BY paid_holiday
ORDER BY tenure ASC
;

-- To find out if companies with healthcare benefits have a higher average maternity leave weeks

SELECT ROUND(AVG(maternity_leave_weeks),1), healthcare_benefits
FROM fortune_companies
WHERE healthcare_benefits=1 OR healthcare_benefits=0
GROUP BY healthcare_benefits
;