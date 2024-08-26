package com.architecture.rxjava_azure.controller;

import com.architecture.rxjava_azure.entity.Boss;
import io.reactivex.rxjava3.core.Maybe;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BossController {
    @GetMapping("/boss")
    public Maybe<ResponseEntity<Boss>> getCustomer() {
        return Maybe.just(
            Boss.builder().id(1L).name("Juan").build())
            .map(ResponseEntity::ok);
    }
}
