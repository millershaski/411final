

-- 1.) Find the titles of all projects assigned to 'Sophia Ward'
SELECT rp.title
FROM research_project rp, project_assignee pa, person p
WHERE p.id = pa.person_id AND pa.project_id = rp.id 
    AND p.first_name = 'Sophia' AND p.last_name = 'Ward';


-- 2.) Find the title of the public event that had the most participants
SELECT pe.title
FROM public_event pe
WHERE  
    ( 
        SELECT COUNT(*)
        FROM event_participant ep
        WHERE ep.event_id = pe.id
    ) = 
    (
        SELECT MAX(event_count)
        FROM 
        (
            SELECT COUNT(*) as event_count
            FROM event_participant epo            
            GROUP BY epo.event_id
        ) counts
    );


-- 3.) What are the names of all celestial targets that have been observed since 2025?
SELECT ct.name
FROM celestial_target ct, observation_session os
WHERE ct.id = os.target_id AND os.start_date >= '2025-01-01';


-- 4.) What are the titles of all publications that were produced by staff?
SELECT p.title
FROM publication p, person prsn, publication_author pa
WHERE prsn.affiliation_type = 'Staff' AND pa.author_id = prsn.id AND p.id = pa.publication_id;


-- 5.) What are the first and last names of all volunteers?
SELECT p.first_name, p.last_name
FROM person p, person_role pr
WHERE p.id = pr.person_id AND pr.role_id = 8;


-- 6.) What is the title and progress of the research project that has the least progress?
SELECT rp.title, rp.progress
FROM research_project rp
WHERE rp.progress = (
    SELECT MIN(rpo.progress)
    FROM research_project rpo
);


-- 7.) What is the first and last name of all people who have performed maintenance on telescopes?
SELECT DISTINCT p.first_name, p.last_name
FROM person p, equipment e, maintenance_record mr
WHERE p.id = mr.maintainer AND mr.equipment_id = e.id AND e.type = 'Telescope';


-- 8.) What are the start dates of all work assignments that Amelia Hart has?
SELECT wa.start_date
FROM work_assignment wa, person p
WHERE wa.person_id = p.id AND p.first_name = 'Amelia' AND p.last_name = 'Hart';


-- 9.) Who booked the most equipment overall?
SELECT p.first_name, p.last_name
FROM person p
WHERE 
    (
        SELECT COUNT(*)
        FROM equipment_booking eb
        WHERE eb.person_id = p.id
    ) = 
    (
        SELECT MAX(count)
        FROM
        (
            SELECT COUNT(*) as count
            FROM equipment_booking ebo
            GROUP BY ebo.person_id
        ) all_counts
    );


-- 10.) What is the average participant count of public events that had at least 1 student participant?
SELECT AVG(count)
FROM
(
    SELECT COUNT(*) as count
    FROM public_event pe, event_participant ep, person p
    WHERE pe.id = ep.event_id
        AND p.id = ep.person_id 
        AND p.affiliation_type = 'Student'
    GROUP BY pe.id
) all_counts;
