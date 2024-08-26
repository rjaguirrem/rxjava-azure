package com.architecture.rxjava_azure.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class Boss {
    private Long id;
    private String name;
}
