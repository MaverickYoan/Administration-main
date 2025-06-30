SELECT DISTINCT s.name, s.url, c.name as category_name
FROM Sites s
JOIN Categories c ON s.category_id = c.category_id
LEFT JOIN SiteKeywords sk ON s.site_id = sk.site_id
LEFT JOIN Keywords k ON sk.keyword_id = k.keyword_id
WHERE s.name LIKE '%passeport%'
   OR s.description LIKE '%passeport%'
   OR k.keyword_text LIKE '%passeport%';