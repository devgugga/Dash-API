CREATE TABLE customer_projects
(
    _id          UUID                     DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id      UUID REFERENCES users (_id),
    name         VARCHAR(255) NOT NULL,
    description  TEXT         NOT NULL,
    ideas        TEXT,
    has_design   BOOLEAN                  DEFAULT FALSE,
    design_url   VARCHAR(255),
    type         VARCHAR(50)  NOT NULL    DEFAULT 'others',
    status       VARCHAR(50)  NOT NULL    DEFAULT 'sent',
    budget       VARCHAR(255) NOT NULL,
    deadline     VARCHAR(255) NOT NULL,
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP                DEFAULT NOW() NOT NULL,
    published_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT valid_type CHECK ( type IN ('frontend', 'backend', 'mobile', 'fullstack', 'others') ),
    CONSTRAINT valid_status CHECK ( status IN
                                    ('sent', 'ongoing', 'completed', 'cancelled', 'waitingline', 'inreview') )
)