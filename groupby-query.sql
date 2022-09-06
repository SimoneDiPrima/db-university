-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*) as 'student`s number' , YEAR('enrolment_date') as 'enrolment year'
FROM `students`
GROUP BY `enrolment year`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*) as 'Teacher`offices', `office_address` as 'offices address'
FROM `teachers`
GROUP BY `offices address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT ROUND(AVG(`vote`)),`exam_id` 
FROM `exam_student`
GROUP BY exam_id;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(*) as 'number`degrees' ,`department_id`
FROM `degrees`
GROUP BY department_id;