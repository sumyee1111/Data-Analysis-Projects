-- Query 1: Average Mathematics Achievement by Gender
SELECT gender, ROUND(AVG(math_score), 2) AS avg_math_score
FROM students
GROUP BY gender;

-- Query 2: The impact of test preparation on maths performance
SELECT test_preparation, ROUND(AVG(math_score), 2) AS avg_math_score
FROM students
GROUP BY test_preparation;

-- Query 3: Parental Education Level and Achievement Distribution
SELECT parental_education, COUNT(*) AS student_count, ROUND(AVG(math_score), 2) AS avg_math_score
FROM students
GROUP BY parental_education
ORDER BY avg_math_score DESC;

-- Query 4: Maths pass rate (>=60)
SELECT gender, 
       ROUND(100.0 * SUM(CASE WHEN math_score >= 60 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pass_rate
FROM students
GROUP BY gender;

-- Query 5: Screening of students in the top 10 per cent in mathematics
SELECT gender, math_score
FROM students
ORDER BY math_score DESC
-- Assuming 1000 rows, 10% ≈ 100
LIMIT 100;  