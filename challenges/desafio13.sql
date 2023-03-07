SELECT 
    CASE
        WHEN usu.idade <= 30 THEN 'Até 30 anos'
        WHEN usu.idade BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END AS 'faixa_etaria',
    COUNT(fav.pessoa_usuaria_id) AS 'total_favoritadas',
    COUNT(DISTINCT usu.pessoa_usuaria_id) AS 'total_pessoas_usuarias'
FROM
    SpotifyClone.cancoes_favoritas AS fav
        RIGHT JOIN
    SpotifyClone.pessoas_usuarias AS usu ON fav.pessoa_usuaria_id = usu.pessoa_usuaria_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;