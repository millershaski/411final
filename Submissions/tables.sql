

CREATE TABLE role (
    id              INT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL UNIQUE,
    description     TEXT
);


CREATE TABLE person (
    id        INT PRIMARY KEY,
    first_name       VARCHAR(100) NOT NULL,
    last_name        VARCHAR(100) NOT NULL,
    phone            VARCHAR(50),
    affiliation_type VARCHAR(50) NOT NULL, -- Staff, Researcher, Student, Volunteer
    start_date        DATE -- note that a student's start date is when they were first enrolled in the system
);


CREATE TABLE person_role (
    person_id        INT NOT NULL,
    role_id          INT NOT NULL,
    start_date       DATE,
    end_date         DATE,
    
    PRIMARY KEY(person_id, role_id),
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);


CREATE TABLE work_assignment (
    id                  INT PRIMARY KEY,
    person_id           INT NOT NULL,
    description         TEXT,
    start_date          DATE,
    end_date            DATE,
    
    FOREIGN KEY (person_id) REFERENCES person(id)
);


CREATE TABLE research_project (
    id                      INT PRIMARY KEY,
    title                   VARCHAR(255) NOT NULL,
    objectives              TEXT,
    description             TEXT,
    progress                DECIMAL(5,2) DEFAULT 0.00
);


CREATE TABLE project_assignee (
    project_id           INT NOT NULL,
    person_id            INT NOT NULL,
    
    PRIMARY KEY(project_id, person_id),
    FOREIGN KEY (project_id) REFERENCES research_project(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);


CREATE TABLE equipment (
    id                      INT PRIMARY KEY,
    name                    VARCHAR(200) NOT NULL,
    type                    VARCHAR(100) NOT NULL, -- Telescope, Lens, Sensor, Computer, Mount, Camera
    maintenance_interval     INT -- The number of days required between maintenance
);


CREATE TABLE equipment_booking(
    id                  INT PRIMARY KEY,
    equipment_id        INT,
    person_id           INT,
    start_date          DATETIME NOT NULL,
    end_date            DATETIME NOT NULL,
    
    FOREIGN KEY(equipment_id) REFERENCES equipment(id),
    FOREIGN KEY(person_id) REFERENCES person(id)
);


CREATE TABLE celestial_target (
    id            INT PRIMARY KEY,
    name          VARCHAR(200) NOT NULL,
    type          VARCHAR(100), -- Planet, Star, Galaxy, Nebula, Comet, etc.    
    notes         TEXT
);


CREATE TABLE observation_session (
    id                      INT PRIMARY KEY,
    target_id               INT NOT NULL, -- The celestial target's id
    performed_by            INT NOT NULL,
    start_date              DATETIME NOT NULL,
    end_date                DATETIME NOT NULL,
    notes                   TEXT,
    
    FOREIGN KEY (target_id) REFERENCES celestial_target(id),
    FOREIGN KEY (performed_by) REFERENCES person(id)
);


CREATE TABLE observation_data (
    id                    INT PRIMARY KEY,
    session_id            INT NOT NULL,
    data_type             VARCHAR(100) NOT NULL, -- Image, Spectrum, Measurement, Reading, Analysis
    file_path             VARCHAR(500),
    description           TEXT,
    
    FOREIGN KEY (session_id) REFERENCES observation_session(id)
);


CREATE TABLE maintenance_record (
    id                      INT PRIMARY KEY,
    equipment_id            INT NOT NULL,
    maintainer              INT,
    date                    DATE NOT NULL,
    type                    VARCHAR(100), -- Inspection, Repair, Calibration, Upgrade
    notes                   TEXT,
    
    FOREIGN KEY (equipment_id) REFERENCES equipment(id),
    FOREIGN KEY (maintainer) REFERENCES person(id)
);


CREATE TABLE equipment_usage_history (
    id                      INT PRIMARY KEY,
    equipment_id            INT NOT NULL,
    user                    INT,
    date                    DATETIME,
    purpose                 TEXT,
    
    FOREIGN KEY (equipment_id) REFERENCES equipment(id),
    FOREIGN KEY (user) REFERENCES person(id)
);


CREATE TABLE public_event (
    id              INT PRIMARY KEY,
    title           VARCHAR(255) NOT NULL,
    type            VARCHAR(100) NOT NULL, -- Workshop, Seminar, Camp, Public Viewing
    date            DATETIME NOT NULL
);


CREATE TABLE event_participant (
    event_id              INT,
    person_id             INT,
    
    PRIMARY KEY(event_id, person_id),
    FOREIGN KEY (event_id) REFERENCES public_event(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);


CREATE TABLE partner_institution (
    id        INT PRIMARY KEY,
    name      VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE project_collaboration (
    id                      INT PRIMARY KEY,
    project_id              INT NOT NULL,
    institution_id          INT NOT NULL,
    details                 TEXT,
    
    FOREIGN KEY (project_id) REFERENCES research_project(id),
    FOREIGN KEY (institution_id) REFERENCES partner_institution(id),
    UNIQUE (project_id, institution_id)
);


CREATE TABLE publication (
    id                    INT PRIMARY KEY,
    title                 VARCHAR(255),
    type                  VARCHAR(100), -- Research Paper, Report
    date                  DATE
);


CREATE TABLE publication_author (
    publication_id            INT,
    author_id                 INT,
    
    PRIMARY KEY(publication_id, author_id),
    FOREIGN KEY(publication_id) REFERENCES publication(id),
    FOREIGN KEY(author_id) REFERENCES person(id)
);