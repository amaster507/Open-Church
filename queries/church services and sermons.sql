#This query will retrieve all churches with all of their services and the sermon that was preached and who preached it.
SELECT 
  `churches`.`church_name`,
  `services`.`service_date`,
  `services`.`service_type`,
  `sermons`.`sermon_title`,
  `people`.`first_name`,
  `people`.`last_name`
FROM
  `churches_have_services`
  LEFT JOIN `churches` ON (`churches_have_services`.`churches_church_id` = `churches`.`church_id`)
  LEFT JOIN `services` ON (`churches_have_services`.`services_service_id` = `services`.`service_id`)
  LEFT JOIN `sermons` ON (`sermons`.`services_service_id` = `services`.`service_id`)
  LEFT JOIN `preachers` ON (`sermons`.`preachers_preacher_id` = `preachers`.`preacher_id`)
  LEFT JOIN `people` ON (`preachers`.`people_person_id` = `people`.`person_id`)
