package br.com.gustavgomes.dashapi.domain.tags;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.OffsetDateTime;

@Table(name = "tags")
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Tags {
    @Id
    @GeneratedValue
    private Long _id;

    private String name;

    private OffsetDateTime createdAt;
}
