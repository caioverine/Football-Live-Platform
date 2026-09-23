package com.flp.footballliveplatform.controller;

import com.flp.footballliveplatform.dto.match.MatchResponse;
import com.flp.footballliveplatform.service.MatchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/matches")
@RequiredArgsConstructor
public class MatchController {

    private final MatchService matchService;

    @GetMapping
    public List<MatchResponse> getMatches() {
        return matchService.getMatches();
    }

    @GetMapping("/{id}")
    public MatchResponse getMatch(@PathVariable Long id) {
        return matchService.getMatch(id);
    }
}
