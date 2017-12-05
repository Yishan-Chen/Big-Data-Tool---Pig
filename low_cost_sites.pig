-- Replace 'FIXME' to load the test_ad_data.txt file.

data = LOAD '/dualcore{/ad_data1/part*,/ad_data2/part*}' AS (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray, 
             placement:chararray, was_clicked:int, cpc:int);

-- Include only records where was_clicked has a value of 1
data_B = FILTER data BY was_clicked == 1; 

-- Group the data by the appropriate field
data_C = GROUP data_B BY display_site;

/* Create a new relation which includes only the 
 * display site and the total cost of all clicks 
 * on that site
 */
data_D = FOREACH data_C GENERATE data_B.display_site, SUM(data_B.cpc) AS total_cost;

-- Sort that new relation by cost (ascending)
data_E = ORDER data_D BY total_cost;

-- Display just the first three records to the screen
data_F = LIMIT data_E 4;

DUMP data_F;
