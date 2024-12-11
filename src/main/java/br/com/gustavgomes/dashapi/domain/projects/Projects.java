package br.com.gustavgomes.dashapi.domain.projects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.OffsetDateTime;

@Table(name = "projects")
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Projects {
    @Id
    @GeneratedValue
    private Long _id;

    private String title;
    private String description;
    private String cover_url;
    private String project_url;

    private Integer views;

    private Boolean customer_project;

    private ProjectType type;
    private ProjectStatus status;

    private OffsetDateTime createdAt;
    private OffsetDateTime updatedAt;
}
