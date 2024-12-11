package br.com.gustavgomes.dashapi.response;

import lombok.Builder;
import lombok.Data;

import java.util.Map;

@Data
@Builder
public class ErrorDetails {
    private String code;

    private String details;

    private Map<String, String> validationErrors;
}
