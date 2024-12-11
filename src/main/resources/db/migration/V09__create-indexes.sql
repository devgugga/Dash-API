CREATE INDEX idx_projects_views ON projects (views);
CREATE INDEX idx_customer_projects_user ON customer_projects (user_id);
CREATE INDEX idx_customer_projects_status ON customer_projects (status);
CREATE INDEX idx_view_logs_project ON view_logs (project_id);