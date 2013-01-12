#This query will get all churches with all of its people
SELECT 
  `churches`.`church_name`,
  `people`.`first_name`,
  `people`.`last_name`,
  `churches_have_people`.`type`
FROM
  `churches_have_people`
  INNER JOIN `churches` ON (`churches_have_people`.`churches_church_id` = `churches`.`church_id`)
  INNER JOIN `people` ON (`churches_have_people`.`people_person_id` = `people`.`person_id`)
