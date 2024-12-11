CREATE TABLE customer_projects
(
    _id            UUID                     DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id        UUID REFERENCES users (_id),
    name           VARCHAR(255) NOT NULL,
    description    TEXT         NOT NULL,
    ideas          TEXT,
    has_design     BOOLEAN                  DEFAULT FALSE,
    project_type   VARCHAR(50)  NOT NULL,
    project_status VARCHAR(50)  NOT NULL    DEFAULT 'sent',
    budget         VARCHAR(255) NOT NULL,
    time           VARCHAR(255) NOT NULL,
    created_at     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP                DEFAULT NOW() NOT NULL,
    published_at   TIMESTAMP WITH TIME ZONE,
    CONSTRAINT valid_project_type CHECK ( project_type IN ('front-end', 'back-end', 'mobile', 'fullstack', 'others') ),
    CONSTRAINT valid_project_status CHECK ( project_status IN
                                            ('sent', 'ongoing', 'completed', 'cancelled', 'waiting line', 'in review') )
)