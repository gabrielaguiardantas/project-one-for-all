SELECT 
    can.nome_cancao AS 'cancao',
    COUNT(his.cancoes_id) AS 'reproducoes'
FROM
    SpotifyClone.historico_rep AS his
        INNER JOIN
    SpotifyClone.cancoes AS can ON his.cancoes_id = can.cancoes_id
GROUP BY his.cancoes_id
ORDER BY COUNT(cancoes_id) DESC , can.nome_cancao
LIMIT 2;