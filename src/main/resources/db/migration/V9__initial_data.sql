-- Dados iniciais para ambiente de desenvolvimento

-- 1) Países
INSERT INTO country (name, iso_code) VALUES
    ('Brasil', 'BR'),
    ('Argentina', 'AR'),
    ('Uruguai', 'UY');

-- 2) Estádios (ligados aos países)
INSERT INTO stadium (name, city, state, country_id, capacity) VALUES
    ('Maracanã', 'Rio de Janeiro', 'RJ',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     78838),
    ('Allianz Parque', 'São Paulo', 'SP',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     43713),
    ('La Bombonera', 'Buenos Aires', NULL,
     (SELECT id FROM country WHERE iso_code = 'AR'),
     54000);

-- 3) Clubes (ligados a estádio e país)
INSERT INTO club (name, country_id, state, stadium_id, founded_at) VALUES
    ('Flamengo',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     'RJ',
     (SELECT id FROM stadium WHERE name = 'Maracanã'),
     '1895-11-17'),
    ('Palmeiras',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     'SP',
     (SELECT id FROM stadium WHERE name = 'Allianz Parque'),
     '1914-08-26'),
    ('Boca Juniors',
     (SELECT id FROM country WHERE iso_code = 'AR'),
     NULL,
     (SELECT id FROM stadium WHERE name = 'La Bombonera'),
     '1905-04-03');

-- 4) Campeonato e temporada
INSERT INTO championship (name, country_id) VALUES
    ('Brasileirão Série A',
     (SELECT id FROM country WHERE iso_code = 'BR'));

INSERT INTO championship_season (championship_id, year, start_date, end_date, status) VALUES
    (
        (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
         AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')),
        2026,
        '2026-04-01',
        '2026-12-15',
        'IN_PROGRESS'
    );

-- 5) Clubes na temporada
INSERT INTO championship_season_club
    (championship_season_id, club_id, registered_at, status)
VALUES
    (
        (SELECT id FROM championship_season
         WHERE championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
           AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))
           AND year = 2026),
        (SELECT id FROM club WHERE name = 'Flamengo'),
        CURRENT_TIMESTAMP,
        'ACTIVE'
    ),
    (
        (SELECT id FROM championship_season
         WHERE championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
           AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))
           AND year = 2026),
        (SELECT id FROM club WHERE name = 'Palmeiras'),
        CURRENT_TIMESTAMP,
        'ACTIVE'
    ),
    (
        (SELECT id FROM championship_season
         WHERE championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
           AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))
           AND year = 2026),
        (SELECT id FROM club WHERE name = 'Boca Juniors'),
        CURRENT_TIMESTAMP,
        'INVITED'
    );

-- 6) Técnicos
INSERT INTO coach (name, country_id, birth_date) VALUES
    ('Tite',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     '1961-05-25'),
    ('Abel Ferreira',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     '1978-12-22'),
    ('Miguel Ángel Russo',
     (SELECT id FROM country WHERE iso_code = 'AR'),
     '1956-04-09');

-- 7) Vínculo técnico-clube
INSERT INTO club_coach (club_id, coach_id, start_date, end_date) VALUES
    (
        (SELECT id FROM club WHERE name = 'Flamengo'),
        (SELECT id FROM coach WHERE name = 'Tite'),
        '2026-01-01',
        NULL
    ),
    (
        (SELECT id FROM club WHERE name = 'Palmeiras'),
        (SELECT id FROM coach WHERE name = 'Abel Ferreira'),
        '2020-11-01',
        NULL
    ),
    (
        (SELECT id FROM club WHERE name = 'Boca Juniors'),
        (SELECT id FROM coach WHERE name = 'Miguel Ángel Russo'),
        '2025-07-01',
        NULL
    );

-- 8) Jogadores
INSERT INTO player (name, country_id, birth_date, preferred_foot) VALUES
    ('Pedro',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     '1997-06-20',
     'R'),
    ('Arrascaeta',
     (SELECT id FROM country WHERE iso_code = 'UY'),
     '1994-06-01',
     'L'),
    ('Dudu',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     '1992-01-07',
     'R'),
    ('Rony',
     (SELECT id FROM country WHERE iso_code = 'BR'),
     '1995-05-11',
     'R');

-- 9) Vínculo jogador-clube na temporada (squad_membership)
-- Flamengo na temporada 2026
INSERT INTO squad_membership
    (championship_season_id, championship_season_club_id, player_id, start_date, end_date)
VALUES
    (
        (SELECT id FROM championship_season
         WHERE championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
           AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))
           AND year = 2026),
        (SELECT id FROM championship_season_club
         WHERE club_id = (SELECT id FROM club WHERE name = 'Flamengo')
           AND championship_season_id = (SELECT id FROM championship_season
             WHERE year = 2026
               AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                 AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        (SELECT id FROM player WHERE name = 'Pedro'),
        '2026-01-01',
        NULL
    ),
    (
        (SELECT id FROM championship_season
         WHERE championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
           AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))
           AND year = 2026),
        (SELECT id FROM championship_season_club
         WHERE club_id = (SELECT id FROM club WHERE name = 'Flamengo')
           AND championship_season_id = (SELECT id FROM championship_season
             WHERE year = 2026
               AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                 AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        (SELECT id FROM player WHERE name = 'Arrascaeta'),
        '2026-01-01',
        NULL
    );

-- Palmeiras na temporada 2026
INSERT INTO squad_membership
    (championship_season_id, championship_season_club_id, player_id, start_date, end_date)
VALUES
    (
        (SELECT id FROM championship_season
         WHERE championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
           AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))
           AND year = 2026),
        (SELECT id FROM championship_season_club
         WHERE club_id = (SELECT id FROM club WHERE name = 'Palmeiras')
           AND championship_season_id = (SELECT id FROM championship_season
             WHERE year = 2026
               AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                 AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        (SELECT id FROM player WHERE name = 'Dudu'),
        '2026-01-01',
        NULL
    ),
    (
        (SELECT id FROM championship_season
         WHERE championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
           AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))
           AND year = 2026),
        (SELECT id FROM championship_season_club
         WHERE club_id = (SELECT id FROM club WHERE name = 'Palmeiras')
           AND championship_season_id = (SELECT id FROM championship_season
             WHERE year = 2026
               AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                 AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        (SELECT id FROM player WHERE name = 'Rony'),
        '2026-01-01',
        NULL
    );

-- 10) Camisas e posições (squad_membership_assignment)
INSERT INTO squad_membership_assignment
    (squad_membership_id, championship_season_club_id, shirt_number, position, start_date, end_date)
VALUES
    (
        (SELECT id FROM squad_membership
         WHERE player_id = (SELECT id FROM player WHERE name = 'Pedro')),
         (SELECT id FROM championship_season_club
          WHERE club_id = (SELECT id FROM club WHERE name = 'Flamengo')
            AND championship_season_id = (SELECT id FROM championship_season
              WHERE year = 2026
                AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                  AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        9,
        'CENTER_FORWARD',
        '2026-01-01',
        NULL
    ),
    (
        (SELECT id FROM squad_membership
         WHERE player_id = (SELECT id FROM player WHERE name = 'Arrascaeta')),
         (SELECT id FROM championship_season_club
           WHERE club_id = (SELECT id FROM club WHERE name = 'Flamengo')
             AND championship_season_id = (SELECT id FROM championship_season
               WHERE year = 2026
                 AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                   AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        14,
        'ATTACKING_MIDFIELDER',
        '2026-01-01',
        NULL
    ),
    (
        (SELECT id FROM squad_membership
         WHERE player_id = (SELECT id FROM player WHERE name = 'Dudu')),
        (SELECT id FROM championship_season_club
           WHERE club_id = (SELECT id FROM club WHERE name = 'Palmeiras')
             AND championship_season_id = (SELECT id FROM championship_season
               WHERE year = 2026
                 AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                   AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        7,
        'WINGER',
        '2026-01-01',
        NULL
    ),
    (
        (SELECT id FROM squad_membership
         WHERE player_id = (SELECT id FROM player WHERE name = 'Rony')),
        (SELECT id FROM championship_season_club
            WHERE club_id = (SELECT id FROM club WHERE name = 'Palmeiras')
              AND championship_season_id = (SELECT id FROM championship_season
                WHERE year = 2026
                  AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                    AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        10,
        'SECOND_STRIKER',
        '2026-01-01',
        NULL
    );

-- 11) Jogos
INSERT INTO game
    (championship_season_id, scheduled_at,
     home_championship_season_club_id, away_championship_season_club_id,
     stadium_id, status, home_score, away_score)
VALUES
    (
        (SELECT id FROM championship_season
         WHERE year = 2026
           AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
             AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))),
        '2026-05-01 16:00:00',
        (SELECT id FROM championship_season_club
         WHERE club_id = (SELECT id FROM club WHERE name = 'Flamengo')
           AND championship_season_id = (SELECT id FROM championship_season
             WHERE year = 2026
               AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                 AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        (SELECT id FROM championship_season_club
         WHERE club_id = (SELECT id FROM club WHERE name = 'Palmeiras')
           AND championship_season_id = (SELECT id FROM championship_season
             WHERE year = 2026
               AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                 AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        (SELECT id FROM stadium WHERE name = 'Maracanã'),
        'SCHEDULED',
        NULL,
        NULL
    ),
    (
        (SELECT id FROM championship_season
         WHERE year = 2026
           AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
             AND country_id = (SELECT id FROM country WHERE iso_code = 'BR'))),
        '2026-05-15 18:00:00',
        (SELECT id FROM championship_season_club
         WHERE club_id = (SELECT id FROM club WHERE name = 'Palmeiras')
           AND championship_season_id = (SELECT id FROM championship_season
             WHERE year = 2026
               AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                 AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        (SELECT id FROM championship_season_club
         WHERE club_id = (SELECT id FROM club WHERE name = 'Flamengo')
           AND championship_season_id = (SELECT id FROM championship_season
             WHERE year = 2026
               AND championship_id = (SELECT id FROM championship WHERE name = 'Brasileirão Série A'
                 AND country_id = (SELECT id FROM country WHERE iso_code = 'BR')))),
        (SELECT id FROM stadium WHERE name = 'Allianz Parque'),
        'FINISHED',
        0,
        3
    );