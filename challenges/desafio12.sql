SELECT 
    art.nome_artista AS 'artista',
    CASE
        WHEN COUNT(fav.cancoes_id) >= 5 THEN 'A'
        WHEN COUNT(fav.cancoes_id) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(fav.cancoes_id) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
    END AS 'ranking'
FROM
    SpotifyClone.cancoes_favoritas AS fav
        RIGHT JOIN
    SpotifyClone.cancoes AS can ON fav.cancoes_id = can.cancoes_id
        INNER JOIN
    SpotifyClone.artista AS art ON can.artista_id = art.artista_id
GROUP BY can.artista_id
ORDER BY COUNT(fav.cancoes_id) DESC , art.nome_artista;