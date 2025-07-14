-- homework 6

--Puzle 1
1)
SELECT DISTINCT col1, col2 --  This keeps both (a, b) and (b, a) — they are treated as different
FROM InputTbl

2)
SELECT DISTINCT
  CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS value1, -- This will return only one of (a, b) or (b, a) — whichever comes first alphabetically
  CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS value2
FROM InputTbl

-- Puzle 2

SELECT *
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);


-- Puzle 3 

SELECT *
FROM section1
WHERE id % 2 = 1;


-- Puzle 4

SELECT TOP 1 *
FROM section1
ORDER BY id ASC

-- Puzle 5 

SELECT TOP 1 *
FROM section1
ORDER BY id DESC

-- Puzle 6 

SELECT *
FROM section1
WHERE name LIKE 'B%';

-- Puzle 7 


SELECT *
FROM ProductCodes
WHERE code LIKE '%\_%' ESCAPE '\';














