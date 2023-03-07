SELECT 
    CAST(RPAD(MIN(pla.valor_plano), 4, '.00') AS CHAR (45)) AS 'faturamento_minimo',
    CAST(ROUND(MAX(pla.valor_plano), 2) AS CHAR (5)) AS 'faturamento_maximo',
    CAST(ROUND(AVG(pla.valor_plano), 2) AS CHAR (5)) AS 'faturamento_medio',
    CAST(ROUND(SUM(pla.valor_plano), 2) AS CHAR (5)) AS 'faturamento_total'
FROM
    SpotifyClone.pessoas_usuarias AS usu
        INNER JOIN
    SpotifyClone.plano AS pla ON usu.plano_id = pla.plano_id;