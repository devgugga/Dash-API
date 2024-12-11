CREATE TABLE projects
(
    _id              SERIAL PRIMARY KEY,
    title            VARCHAR(255)                           NOT NULL,
    description      TEXT,
    type             VARCHAR(50)                            NOT NULL,
    status           VARCHAR(100),
    cover_url        VARCHAR(255),
    customer_project BOOLEAN                  DEFAULT FALSE,
    project_url      VARCHAR(255)                           NOT NULL,
    views            INTEGER                  DEFAULT 0,
    created_at       TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP                DEFAULT NOW() NOT NULL,
    CONSTRAINT valid_type CHECK ( type IN ('frontend', 'backend', 'mobile', 'fullstack', 'others') ),
    CONSTRAINT valid_status CHECK ( status IN ('ongoing', 'completed'))
);

CREATE TABLE project_tags
(
    project_id INTEGER REFERENCES projects (_id),
    tag_id     INTEGER REFERENCES tags (_id),
    PRIMARY KEY (project_id, tag_id)
)