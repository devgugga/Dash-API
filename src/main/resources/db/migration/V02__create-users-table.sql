CREATE TABLE users
(
    _id           UUID                         DEFAULT gen_random_uuid() PRIMARY KEY,
    name          VARCHAR(255)        NOT NULL,
    email         VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255)        NOT NULL,
    role          VARCHAR(20)         NOT NULL DEFAULT 'user',
    status        VARCHAR(20)         NOT NULL DEFAULT 'active',
    created_at    TIMESTAMP WITH TIME ZONE     DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP           NOT NULL DEFAULT NOW(),
    deleted_at    TIMESTAMP WITH TIME ZONE,
    CONSTRAINT valid_role CHECK ( role IN ('demo', 'user', 'customer', 'staff', 'admin') ),
    CONSTRAINT valid_status CHECK ( status IN ('active', 'inactive') )
)