package br.com.gustavgomes.dashapi.domain.customersProject;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.UUID;

@Table(name = "customers_project")
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CustomersProject {
    @Id
    @GeneratedValue
    private UUID _id;
    private UUID userID;

    private String name;
    private String description;
    private String ideas;
    private String design_url;
    private String budget;
    private String deadline;

    private Boolean has_design;

    private CustomerProjectType type;
    private CustomerProjectStatus status;

    private OffsetDateTime createdAt;
    private OffsetDateTime updatedAt;
    private OffsetDateTime publishedAt;
}
