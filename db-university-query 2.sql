-- Contare quanti iscritti ci sono stati ogni anno (la data di iscrizione sulla tabella students è enrolment_date)
select year(enrolment_date) as anno_iscrizione , count(s.id) 
from students s
group by year (s.enrolment_date) ;

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
 select s.name,s.surname, d.name from students s 
 inner join degrees d
 on s.degree_id = d.id
 where d.name = "Corso di Laurea in Economia";
 
-- Selezionare tutti i corsi in cui insegna Fulvio Amato
select t.name,t.surname, c.name  from course_teacher ct 
inner join courses c 
on ct.course_id  = c.id
inner join teachers t 
on ct.teacher_id = t.id 
where t.name = "Fulvio" and t.surname = "Amato";

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select s.name,s.surname ,d.name,d2.name from students s 
inner join degrees d 
on s.degree_id = d.id
inner join departments d2 
on d.department_id = d2.id 
order by s.name ,s.surname ;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento e mostrare nome dipartimento e numero di corsi
select count(d2.id) as numero_corsi_di_laurea, d2.name from degrees d 
inner join departments d2 
on d.department_id = d2.id
group by d2.name ;