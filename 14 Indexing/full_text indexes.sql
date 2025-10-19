SELECT *
FROM posts 
WHERE title LIKE '%react redux%' OR
	  body LIKE '%react redux%';
      
CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

-- fulltext serach have two mode NLM (natural langauge mode) and boolean mode
-- NLM
SELECT *, MATCH(title, body) AGAINST('react redux') AS `relevancy score`
FROM posts
WHERE MATCH(title, body) AGAINST('react redux');


-- Boolean mode
SELECT *, MATCH(title, body) AGAINST('react redux') AS `relevancy score`
FROM posts
WHERE MATCH(title, body) AGAINST('react -redux +FORM' IN BOOLEAN MODE);

-- SEARCH FULL PHRASE
SELECT *, MATCH(title, body) AGAINST('react redux') AS `relevancy score`
FROM posts
WHERE MATCH(title, body) AGAINST('"handling a form"' IN BOOLEAN MODE);