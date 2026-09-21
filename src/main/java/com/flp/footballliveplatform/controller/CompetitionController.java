package com.flp.footballliveplatform.controller;

import com.flp.footballliveplatform.dto.competition.CompetitionResponse;
import com.flp.footballliveplatform.service.CompetitionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/competitions")
@RequiredArgsConstructor
public class CompetitionController {

    private final CompetitionService competitionService;

    @GetMapping
    public List<CompetitionResponse> getCompetitions() {
        return competitionService.getCompetitions();
    }
}
