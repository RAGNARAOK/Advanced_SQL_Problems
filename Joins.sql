--- Leetcode problem 1280. Students and Examinations
Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key (column with unique values) for this table.
Each row of this table contains the ID and the name of one student in the school.
 

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key (column with unique values) for this table.
Each row of this table contains the name of one subject in the school.
 

Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each student from the Students table takes every course from the Subjects table.
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example.


-------- Solution
SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e. subject_name) AS attended_exams
FROM Students AS s
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;


----------- Explaination
Let me help you visualize and understand the joins and the COUNT usage in this query step by step.

First, let's visualize the CROSS JOIN between Students and Subjects:
Students:               Subjects:
ID  Name               Subject
1   Alice              Math
2   Bob                Physics
                       Chemistry

After CROSS JOIN:
ID  Name    Subject
1   Alice   Math
1   Alice   Physics
1   Alice   Chemistry
2   Bob     Math
2   Bob     Physics
2   Bob     Chemistry
Then the LEFT JOIN with Examinations:
After LEFT JOIN:
ID  Name    Subject    Exam_Record
1   Alice   Math       Math_exam1
1   Alice   Math       Math_exam2
1   Alice   Physics    Physics_exam1
1   Alice   Chemistry  NULL
2   Bob     Math       Math_exam1
2   Bob     Physics    NULL
2   Bob     Chemistry  Chemistry_exam1
Now, why use COUNT(e.student_id) instead of just COUNT(*)?

COUNT(e.student_id) counts only non-NULL values from the Examinations table
For example, if Alice hasn't taken Chemistry exam:

ID  Name    Subject    Exam_Record   COUNT(e.student_id)
1   Alice   Chemistry  NULL          0

If Alice took Math exam twice:

ID  Name    Subject    Exam_Record   COUNT(e.student_id)
1   Alice   Math       Math_exam1    2
                      Math_exam2
Using COUNT(*) would count NULL values too, which would incorrectly show 1 exam taken even when the student hasn't taken that subject's exam.
The GROUP BY ensures we count exams separately for each student-subject combination, while maintaining all possible combinations from the CROSS JOIN even when no exams were taken.
