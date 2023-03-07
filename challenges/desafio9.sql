SELECT 
    COUNT(*) AS 'musicas_no_historico'
FROM
    SpotifyClone.historico_rep
WHERE
    pessoa_usuaria_id = 1;