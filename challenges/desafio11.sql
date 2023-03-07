SELECT 
    alb.nome_album AS 'album',
    COUNT(fav.cancoes_id) AS 'favoritadas'
FROM
    SpotifyClone.cancoes_favoritas AS fav
        INNER JOIN
    SpotifyClone.cancoes AS can ON fav.cancoes_id = can.cancoes_id
        INNER JOIN
    SpotifyClone.album AS alb ON can.album_id = alb.album_id
GROUP BY can.album_id
ORDER BY COUNT(fav.cancoes_id) DESC , alb.nome_album
LIMIT 3;