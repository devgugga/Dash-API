CREATE OR REPLACE FUNCTION update_updated_at_column()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION increment_project_views(
    project_id INTEGER,
    user_ip INET,
    user_agent TEXT,
    user_id uuid DEFAULT NULL
) RETURNS VOID AS
$$
DECLARE
    last_view TIMESTAMP;
BEGIN
    SELECT viewed_at
    INTO last_view
    FROM view_logs
    WHERE (ip_address = user_ip OR (user_id IS NOT NULL AND view_logs.user_id = increment_project_views.user_id))
      AND project_id = increment_project_views.project_id
    ORDER BY viewed_at DESC
    LIMIT 1;

    IF last_view IS NULL OR last_view < NOW() - INTERVAL '6 hours' THEN
        UPDATE projects SET views = views + 1 WHERE _id = project_id;

        INSERT INTO view_logs (user_id, project_id, ip_address, user_agent)
        VALUES (user_id, project_id, user_ip, user_agent);
    END IF;
END;
$$ LANGUAGE plpgsql;