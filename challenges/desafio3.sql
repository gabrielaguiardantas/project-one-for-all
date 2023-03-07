SELECT 
    pes.nome_pessoa_usuaria AS 'pessoa_usuaria',
    COUNT(his.pessoa_usuaria_id) AS 'musicas_ouvidas',
    ROUND((SUM(can.duracao_segundos) / 60), 2) AS 'total_minutos'
FROM
    SpotifyClone.historico_rep AS his
        INNER JOIN
    SpotifyClone.pessoas_usuarias AS pes ON his.pessoa_usuaria_id = pes.pessoa_usuaria_id
        INNER JOIN
    SpotifyClone.cancoes AS can ON his.cancoes_id = can.cancoes_id
GROUP BY pes.nome_pessoa_usuaria
ORDER BY pes.nome_pessoa_usuaria;