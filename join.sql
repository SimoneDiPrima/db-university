-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name` ,
`students`.`surname`,
`degrees`.`name` as "Degree's course"
FROM `students`
RIGHT JOIN  `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- -- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `departments`.`name` as "Departments 's Name",
`degrees`.`name` as "Course's Name"
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

-- -- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name`,
`teachers`.`surname`,
`course_teacher`.`course_id`,
`courses`.`name`
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id`= `course_teacher`.`teacher_id`
WHERE `teachers`.`id` = 44;

-- -- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- -- relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT DISTINCT `departments`.`name`,`degrees`.*,
`students`.`name`,`students`.`surname`
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `students`
ON `degrees`.`department_id` = `students`.`degree_id`
ORDER BY `students`.`surname`,`students`.`name` asc;



-- -- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name`,`degrees`.`id`, `courses`.`name`,`course_teacher`.*,`teachers`.`name`,`teachers`.`surname`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`degree_id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`course_id` = `teachers`.`id`;
-- -- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name`,
`teachers`.`surname`,
`teachers`.`id`,
`course_teacher`.`teacher_id`
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id`= `course_teacher`.`teacher_id`
JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id` =  `degrees`.`id`
JOIN `departments`
ON  `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name`= 'Dipartimento di Matematica';
