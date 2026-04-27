-- Sample data population script for the provided astronomy organization schema

INSERT INTO role (id, name, description) VALUES
(1, 'Director', 'Oversees the overall astronomy program and operations.'),
(2, 'Lead Researcher', 'Leads scientific research projects and mentors team members.'),
(3, 'Telescope Operator', 'Operates and configures telescopes for scheduled observations.'),
(4, 'Data Analyst', 'Processes captured measurements, spectra, and image data.'),
(5, 'Equipment Technician', 'Maintains observatory equipment and performs calibrations.'),
(6, 'Event Coordinator', 'Plans and manages public workshops and outreach events.'),
(7, 'Student Researcher', 'Supports research projects while learning astronomy methods.'),
(8, 'Volunteer', 'Assists with events, logistics, and general support tasks.'),
(9, 'Publication Editor', 'Prepares reports and research papers for publication.'),
(10, 'Collaboration Liaison', 'Coordinates with partner institutions and shared initiatives.');


INSERT INTO person (id, first_name, last_name, phone, affiliation_type, start_date) VALUES
(1, 'Amelia', 'Hart', '989-555-0101', 'Staff', '2023-01-10'),
(2, 'Noah', 'Bennett', '989-555-0102', 'Researcher', '2023-02-14'),
(3, 'Olivia', 'Parker', '989-555-0103', 'Researcher', '2023-03-01'),
(4, 'Liam', 'Foster', '989-555-0104', 'Staff', '2023-03-20'),
(5, 'Emma', 'Reed', '989-555-0105', 'Student', '2023-09-05'),
(6, 'Mason', 'Cole', '989-555-0106', 'Student', '2023-09-05'),
(7, 'Sophia', 'Ward', '989-555-0107', 'Volunteer', '2024-01-12'),
(8, 'James', 'Brooks', '989-555-0108', 'Staff', '2024-02-08'),
(9, 'Isabella', 'Hayes', '989-555-0109', 'Researcher', '2024-02-15'),
(10, 'Ethan', 'Price', '989-555-0110', 'Volunteer', '2024-03-01');


INSERT INTO person_role (person_id, role_id, start_date, end_date) VALUES
(1, 1, '2023-01-10', NULL),
(2, 2, '2023-02-14', NULL),
(3, 4, '2023-03-01', NULL),
(4, 3, '2023-03-20', NULL),
(5, 7, '2023-09-05', NULL),
(6, 7, '2023-09-05', NULL),
(7, 8, '2024-01-12', NULL),
(8, 5, '2024-02-08', NULL),
(9, 10, '2024-02-15', NULL),
(10, 6, '2024-03-01', NULL);


INSERT INTO work_assignment (id, person_id, description, start_date, end_date) VALUES
(1, 1, 'Prepare annual observatory operations plan and budget.', '2024-01-02', '2024-03-31'),
(2, 2, 'Lead exoplanet transit observation campaign.', '2024-02-01', '2024-07-31'),
(3, 1, 'Analyze archived nebula spectra for emission line trends.', '2024-02-15', '2024-06-30'),
(4, 4, 'Manage nightly telescope alignment and observation setup.', '2024-03-01', '2024-10-31'),
(5, 1, 'Catalog deep sky images for the student archive project.', '2024-03-10', '2024-05-30'),
(6, 6, 'Assist in asteroid tracking measurements and logs.', '2024-03-10', '2024-06-15'),
(7, 7, 'Support guest check-in for public skywatch events.', '2024-04-01', '2024-09-30'),
(8, 8, 'Perform quarterly calibration of mount and imaging systems.', '2024-04-05', '2024-04-20'),
(9, 9, 'Coordinate research partnership proposals with universities.', '2024-04-10', '2024-08-31'),
(10, 10, 'Organize astronomy camp activity materials and schedules.', '2024-04-12', '2024-07-15');


INSERT INTO research_project (id, title, objectives, description, progress) VALUES
(1, 'Exoplanet Transit Monitoring', 'Detect periodic dips in brightness from selected host stars.', 'A long-term monitoring project focused on transit timing and confirmation.', 62.50),
(2, 'Variable Star Brightness Survey', 'Measure seasonal magnitude changes in known variable stars.', 'Students and staff collect repeated brightness measurements across months.', 48.00),
(3, 'Nebula Spectral Mapping', 'Compare emission lines across several bright nebulae.', 'Spectral data is used to identify chemical composition differences.', 55.75),
(4, 'Asteroid Motion Tracking', 'Estimate trajectories from repeated positional measurements.', 'A project devoted to imaging and logging near-Earth asteroid movement.', 71.20),
(5, 'Galaxy Imaging Archive', 'Build a catalog of high-resolution galaxy photographs.', 'Creates a searchable archive of processed deep sky galaxy images.', 80.00),
(6, 'Lunar Surface Change Study', 'Document visible lighting and shadow changes on the moon.', 'Observation sessions track recurring features over multiple lunar phases.', 34.60),
(7, 'Comet Tail Evolution', 'Observe structural changes in comet tails over time.', 'Combines imaging and observational notes during active comet periods.', 29.40),
(8, 'Meteor Shower Rate Analysis', 'Estimate hourly meteor rates during major shower peaks.', 'Public and internal observations contribute counts and weather context.', 43.10),
(9, 'Solar Spot Activity Review', 'Track sunspot counts and imaging summaries.', 'Solar observations are compiled into a quarterly activity report.', 67.85),
(10, 'Open Cluster Photometry', 'Measure star brightness distributions in open clusters.', 'Photometry data supports educational analysis and publication practice.', 51.30);


INSERT INTO project_assignee (project_id, person_id) VALUES
(1, 2),
(2, 5),
(3, 3),
(4, 6),
(5, 4),
(6, 1),
(7, 9),
(8, 7),
(9, 8),
(10, 10);


INSERT INTO equipment (id, name, type, maintenance_interval) VALUES
(1, 'Celestron EdgeHD 11', 'Telescope', 180),
(2, 'SkyWatcher EQ6-R Pro', 'Mount', 120),
(3, 'ZWO ASI2600MC Pro', 'Camera', 90),
(4, 'SBIG Spectrograph Unit', 'Sensor', 150),
(5, 'Explore Scientific 2x Barlow', 'Lens', 365),
(6, 'Dell Precision Observatory PC', 'Computer', 180),
(7, 'Orion StarShoot Autoguider', 'Camera', 120),
(8, 'Meade LX200 10', 'Telescope', 180),
(9, 'QHYCCD Monochrome Sensor', 'Sensor', 120),
(10, 'Portable Outreach Refractor', 'Telescope', 240);


INSERT INTO equipment_booking (id, equipment_id, person_id, start_date, end_date) VALUES
(1, 1, 2, '2024-04-01 20:00:00', '2024-04-01 23:00:00'),
(2, 2, 4, '2024-04-02 19:00:00', '2024-04-02 22:00:00'),
(3, 3, 3, '2024-04-03 18:30:00', '2024-04-03 21:30:00'),
(4, 4, 9, '2024-04-04 20:15:00', '2024-04-04 23:15:00'),
(5, 5, 5, '2024-04-05 17:00:00', '2024-04-05 19:00:00'),
(6, 6, 2, '2024-04-06 09:00:00', '2024-04-06 12:00:00'),
(7, 7, 6, '2024-04-07 20:00:00', '2024-04-07 22:30:00'),
(8, 8, 1, '2024-04-08 21:00:00', '2024-04-08 23:45:00'),
(9, 9, 2, '2024-04-09 19:30:00', '2024-04-09 22:00:00'),
(10, 10, 10, '2024-04-10 18:00:00', '2024-04-10 20:00:00');


INSERT INTO celestial_target (id, name, type, notes) VALUES
(1, 'Mars', 'Planet', 'Observed near opposition for surface detail imaging.'),
(2, 'Betelgeuse', 'Star', 'Included in variability monitoring set.'),
(3, 'Andromeda Galaxy', 'Galaxy', 'Used for long-exposure imaging sessions.'),
(4, 'Orion Nebula', 'Nebula', 'Strong emission lines make it useful for spectra.'),
(5, 'Comet 12P/Pons-Brooks', 'Comet', 'Tracked during active tail development.'),
(6, 'Moon', 'Natural Satellite', 'Used for recurring phase and shadow studies.'),
(7, 'Jupiter', 'Planet', 'Observed for band detail and moon transits.'),
(8, 'Pleiades', 'Open Cluster', 'Photometry target for brightness comparisons.'),
(9, 'Vesta', 'Asteroid', 'Included in positional tracking measurements.'),
(10, 'Perseus Double Cluster', 'Star Cluster', 'Captured for archival imaging and outreach.');


INSERT INTO observation_session (id, target_id, performed_by, start_date, end_date, notes) VALUES
(1, 1, 2, '2025-04-01 20:30:00', '2025-04-01 22:30:00', 'Good seeing conditions for planetary imaging.'),
(2, 2, 5, '2024-04-02 21:00:00', '2024-04-02 23:00:00', 'Brightness measurements recorded every 10 minutes.'),
(3, 3, 4, '2025-04-03 20:00:00', '2025-04-03 23:30:00', 'Deep sky imaging session with long exposures.'),
(4, 4, 3, '2024-04-04 19:45:00', '2024-04-04 22:15:00', 'Spectral capture completed for central region.'),
(5, 5, 9, '2024-04-05 20:15:00', '2024-04-05 22:45:00', 'Comet tail appeared broader than prior session.'),
(6, 6, 1, '2022-04-06 18:30:00', '2022-04-06 20:00:00', 'Lunar terminator images taken for comparison.'),
(7, 7, 6, '2024-04-07 21:00:00', '2024-04-07 23:30:00', 'Observed Jovian cloud bands and moon positions.'),
(8, 8, 5, '2020-04-08 20:30:00', '2020-04-08 22:30:00', 'Photometry test run with student team.'),
(9, 9, 8, '2024-04-09 19:30:00', '2024-04-09 21:00:00', 'Asteroid positions logged against reference stars.'),
(10, 10, 10, '2024-04-10 20:00:00', '2024-04-10 22:00:00', 'Images taken for outreach presentation materials.');


INSERT INTO observation_data (id, session_id, data_type, file_path, description) VALUES
(1, 1, 'Image', '/data/observations/session1/mars_stack.png', 'Stacked RGB image of Mars.'),
(2, 2, 'Measurement', '/data/observations/session2/betelgeuse_lightcurve.csv', 'Brightness readings captured during the session.'),
(3, 3, 'Image', '/data/observations/session3/andromeda_master.fit', 'Processed deep sky master frame.'),
(4, 4, 'Spectrum', '/data/observations/session4/orion_spectrum.fits', 'Spectral file for Orion Nebula core.'),
(5, 5, 'Analysis', '/data/observations/session5/comet_tail_notes.pdf', 'Summary of visible tail changes compared with previous night.'),
(6, 6, 'Image', '/data/observations/session6/lunar_terminator.jpg', 'High-contrast lunar surface image.'),
(7, 7, 'Reading', '/data/observations/session7/jupiter_moons.txt', 'Logged moon positions during observation.'),
(8, 8, 'Measurement', '/data/observations/session8/pleiades_photometry.csv', 'Photometry values for selected stars.'),
(9, 9, 'Reading', '/data/observations/session9/vesta_positions.csv', 'Timestamped positional measurements.'),
(10, 10, 'Image', '/data/observations/session10/double_cluster.png', 'Final outreach image prepared from the session.');


INSERT INTO maintenance_record (id, equipment_id, maintainer, date, type, notes) VALUES
(1, 1, 2, '2024-01-15', 'Inspection', 'Primary mirror and housing inspected.'),
(2, 2, 8, '2024-01-20', 'Calibration', 'Mount tracking error recalibrated.'),
(3, 3, 8, '2024-02-05', 'Inspection', 'Cooling system and sensor housing checked.'),
(4, 4, 8, '2024-02-18', 'Repair', 'Loose connector replaced on spectrograph unit.'),
(5, 5, 8, '2024-03-01', 'Inspection', 'Lens coatings checked for wear.'),
(6, 6, 8, '2024-03-10', 'Upgrade', 'Storage drive and RAM upgraded.'),
(7, 7, 8, '2024-03-22', 'Calibration', 'Autoguider alignment recalibrated.'),
(8, 8, 8, '2024-03-28', 'Inspection', 'Optical tube and focus mechanism inspected.'),
(9, 9, 8, '2024-04-02', 'Repair', 'Sensor power issue corrected.'),
(10, 10, 8, '2024-04-05', 'Inspection', 'Portable refractor cleaned and packed for outreach.');


INSERT INTO equipment_usage_history (id, equipment_id, user, date, purpose) VALUES
(1, 1, 2, '2024-04-01 22:35:00', 'Planetary imaging of Mars.'),
(2, 2, 4, '2024-04-02 22:05:00', 'Mounted and tracked observation rig for galaxy session.'),
(3, 3, 3, '2024-04-03 21:45:00', 'Captured long-exposure image frames.'),
(4, 4, 9, '2024-04-04 22:10:00', 'Recorded Orion Nebula spectral data.'),
(5, 5, 5, '2024-04-05 18:40:00', 'Used for optics lab demonstration.'),
(6, 6, 8, '2024-04-06 11:15:00', 'Processed archived images and backups.'),
(7, 7, 6, '2024-04-07 22:20:00', 'Autoguiding for Jupiter observation.'),
(8, 8, 1, '2024-04-08 23:10:00', 'Backup telescope used for lunar comparison imaging.'),
(9, 9, 2, '2024-04-09 21:50:00', 'Collected monochrome sensor data for asteroid tracking.'),
(10, 10, 10, '2024-04-10 19:50:00', 'Public outreach viewing setup.' );


INSERT INTO public_event (id, title, type, date) VALUES
(1, 'Spring Stargazing Night', 'Public Viewing', '2024-04-12 20:00:00'),
(2, 'Intro to Telescope Operation', 'Workshop', '2024-04-19 14:00:00'),
(3, 'Nebulae and Star Formation Seminar', 'Seminar', '2024-04-26 18:00:00'),
(4, 'Youth Astronomy Camp Day 1', 'Camp', '2024-06-10 09:00:00'),
(5, 'Youth Astronomy Camp Day 2', 'Camp', '2024-06-11 09:00:00'),
(6, 'Meteor Shower Watch Party', 'Public Viewing', '2024-08-11 22:00:00'),
(7, 'Astrophotography Basics', 'Workshop', '2024-05-03 17:30:00'),
(8, 'Planetary Science Public Talk', 'Seminar', '2024-05-17 19:00:00'),
(9, 'Lunar Viewing Evening', 'Public Viewing', '2024-05-24 20:30:00'),
(10, 'Community Space Exploration Fair', 'Workshop', '2024-09-14 11:00:00');


INSERT INTO event_participant (event_id, person_id) VALUES
(1, 7),
(2, 10),
(3, 1),
(5, 5),
(5, 6),
(6, 2),
(7, 3),
(8, 4),
(9, 8),
(10, 9);


INSERT INTO partner_institution (id, name) VALUES
(1, 'Great Lakes Planetarium'),
(2, 'Midwest Space Science Institute'),
(3, 'Northern Sky University'),
(4, 'Lakeview Community College'),
(5, 'Saginaw Valley STEM Center'),
(6, 'Michigan Astronomical Society'),
(7, 'Bay City Science Museum'),
(8, 'Huron Regional Observatory'),
(9, 'Central Research Laboratory'),
(10, 'National Amateur Astronomy Network');


INSERT INTO project_collaboration (id, project_id, institution_id, details) VALUES
(1, 1, 1, 'Transit data comparison and shared observation windows.'),
(2, 2, 2, 'Variable star reference calibration exchange.'),
(3, 3, 3, 'Joint spectral analysis review meetings.'),
(4, 4, 4, 'Student participation in asteroid tracking exercises.'),
(5, 5, 5, 'Archive hosting and public image gallery support.'),
(6, 6, 6, 'Shared lunar feature observation guides.'),
(7, 7, 7, 'Comet outreach exhibit and imaging coordination.'),
(8, 8, 8, 'Meteor count comparison across observation sites.'),
(9, 9, 9, 'Solar report review and instrument benchmarking.'),
(10, 10, 10, 'Cluster photometry educational collaboration.');


INSERT INTO publication (id, title, type, date) VALUES
(1, 'Transit Timing Results for Spring Survey Targets', 'Research Paper', '2024-05-15'),
(2, 'Seasonal Brightness Trends in Selected Variable Stars', 'Research Paper', '2024-05-22'),
(3, 'Spectral Notes from the Orion Nebula Mapping Project', 'Report', '2024-05-29'),
(4, 'Asteroid Tracking Procedures and Early Findings', 'Report', '2024-06-05'),
(5, 'Building a Community Galaxy Imaging Archive', 'Report', '2024-06-12'),
(6, 'Lunar Illumination Comparisons Across Phases', 'Research Paper', '2024-06-19'),
(7, 'Observed Tail Morphology in Comet 12P/Pons-Brooks', 'Research Paper', '2024-06-26'),
(8, 'Meteor Shower Rate Estimation Methods for Public Programs', 'Report', '2024-07-03'),
(9, 'Quarterly Solar Spot Activity Review', 'Report', '2024-07-10'),
(10, 'Teaching Photometry with Open Cluster Data', 'Research Paper', '2024-07-17');


INSERT INTO publication_author (publication_id, author_id) VALUES
(1, 2),
(2, 5),
(3, 3),
(4, 6),
(5, 4),
(6, 1),
(7, 9),
(8, 7),
(9, 8),
(10, 10);
