#This query retreives all of the relationships for the user id specified
SELECT
  first_person.first_name,
  first_person.last_name,
  relationships.relationship_type,
  people.first_name,
  people.last_name
FROM 
  (
    SELECT
      people.person_id, 
      `people`.`first_name`,
      `people`.`last_name`
    FROM
      `people`
    WHERE
      people.person_id='3'
  ) AS first_person
  LEFT JOIN relationships ON (first_person.person_id=relationships.people_person_id)
  LEFT JOIN people ON (relationships.related_person_id=people.person_id)
