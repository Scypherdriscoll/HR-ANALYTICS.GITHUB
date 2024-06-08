---creating a join table---
select * from Absenteeism_at_work a
left join  compensation b
 on a.ID = b.ID
 left join Reasons r on
 a.Reason_for_absence =r.Number


 ---finding  the healthiest employee for the bonus---
 select * from Absenteeism_at_work
 where Social_drinker = 0 and Social_smoker = 0
 and Body_mass_index < 25 and
 Absenteeism_time_in_hours < ( select AVG(Absenteeism_time_in_hours)from Absenteeism_at_work)


 ---compensation rate increases for non-smokers--
 select count(*) as nonsmokers from Absenteeism_at_work
 where Social_smoker = 0

 ---optimizing this query---
 select 
 a.ID,
 Reason,
 Month_of_absence,
 Body_mass_index,
 CASE  when Body_mass_index < 18.5 then 'underwieght'
       when Body_mass_index between 18.5 and 25 then 'Healthy'
	   when Body_mass_index between 25 and 30 then 'Overwieght'
	   when Body_mass_index > 30 then 'Obese'
	   ELSE 'unkown' end as BMI_category,
 CASE when Month_of_absence in (12,1,2) then 'Winter'
      when Month_of_absence in (3,4,5) then 'Spring'
	  when Month_of_absence in (6,7,8) then 'Summer'
	  when Month_of_absence in (9,10,11) then 'Fall'
	  ELSE 'unkown' END as Season_Names,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_smoker,
Social_drinker,
Pet,
Disciplinary_failure,
Age,
Work_load_average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join  compensation b
 on a.ID = b.ID
 left join Reasons r on
 a.Reason_for_absence =r.Number