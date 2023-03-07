SELECT 
    pes.nome_pessoa_usuaria AS 'pessoa_usuaria',
    IF(YEAR(MAX(his.data_reproducao)) >= '2021',
        'Ativa',
        'Inativa') AS 'status_pessoa_usuaria'
FROM
    SpotifyClone.historico_rep AS his
        INNER JOIN
    SpotifyClone.pessoas_usuarias AS pes ON his.pessoa_usuaria_id = pes.pessoa_usuaria_id
GROUP BY his.pessoa_usuaria_id
ORDER BY pes.nome_pessoa_usuaria;