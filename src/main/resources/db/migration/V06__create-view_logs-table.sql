CREATE TABLE view_logs
(
    id         SERIAL PRIMARY KEY,
    user_id    uuid REFERENCES users (_id),
    project_id INTEGER NOT NULL,
    viewed_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    ip_address INET,
    user_agent TEXT
)