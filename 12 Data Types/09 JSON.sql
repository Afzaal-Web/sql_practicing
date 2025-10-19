UPDATE products
SET properties = '
{
	"dimensions": [1,2,3],
    "weight" : [1,2,3],
    "manufactor": {
    "name":"sony"
    }
}'
WHERE product_id IN (2,3,4,5,6,7,8,9,10);

UPDATE products
SET properties = JSON_OBJECT(
'weight', 10,
'dimensions', JSON_ARRAY(1,2,3),
'manufactor', JSON_OBJECT('NAME', 'arIAL')
)
WHERE product_id IN (2,4,6,8,10);

-- Extract values from JSON object

SELECT product_id, JSON_EXTRACT(properties, '$.weight')
from products
WHERE product_id IN (2,4,6,8,10);


SELECT product_id, JSON_EXTRACT(properties, '$')
from products
WHERE product_id IN (2,4,6,8,10);

SELECT product_id, properties ->> '$.manufactor.NAME'
from products
WHERE product_id IN (2,4,6,8,10);

