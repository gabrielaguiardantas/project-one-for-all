SELECT 
    art.nome_artista AS 'artista', alb.nome_album AS 'album'
FROM
    SpotifyClone.album AS alb
        INNER JOIN
    SpotifyClone.artista AS art ON alb.artista_id = art.artista_id
HAVING art.nome_artista = 'Elis Regina'
ORDER BY alb.nome_album;