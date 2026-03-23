package com.example.ping.controller;

import com.example.ping.api.ApiApi;
import com.example.ping.model.PingResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PingController implements ApiApi {

    @Value("${description}")
    private String description;

    @Override
    public ResponseEntity<PingResponse> ping() {
        PingResponse response = new PingResponse();
        response.setStatus("ok");
        response.setDescription(description);
        return ResponseEntity.ok(response);
    }
}
