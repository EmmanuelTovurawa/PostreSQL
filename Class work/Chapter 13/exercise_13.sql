#1
The trim function can be used to remove the unwanted comma between the prefix and the suffix.

A regular expression may not work to remove the unwanted comma

SELECT substring('Alvarez, Jr.' from '\w+.$');

#3
SELECT president,
       speech_date,
       ts_rank_cd(search_speech_text,
               to_tsquery('war & security & threat & enemy')) AS score
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('war & security & threat & enemy')
ORDER BY score DESC
LIMIT 5;
