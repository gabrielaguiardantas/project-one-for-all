SELECT 
    art.nome_artista AS 'artista',
    alb.nome_album AS 'album',
    COUNT(seg.artista_id) AS 'pessoas_seguidoras'
FROM
    SpotifyClone.album AS alb
        INNER JOIN
    SpotifyClone.artista AS art ON alb.artista_id = art.artista_id
        INNER JOIN
    SpotifyClone.seguindo_artistas AS seg ON alb.artista_id = seg.artista_id
GROUP BY seg.artista_id , alb.nome_album
ORDER BY COUNT(seg.artista_id) DESC , art.nome_artista , alb.nome_album;