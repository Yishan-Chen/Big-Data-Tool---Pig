data = LOAD '/dualcore{/ad_data1/part*,/ad_data2/part*}' AS (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray,
             placement:chararray, was_clicked:int, cpc:int);
sorted_data = ORDER data BY cpc DESC;
sorted_data = FOREACH sorted_data GENERATE keyword,cpc;
group_data = GROUP sorted_data BY keyword;
top_3 = LIMIT group_data 3;
DUMP top_3;
