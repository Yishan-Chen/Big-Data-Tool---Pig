data = LOAD '/dualcore/ad_data2.txt' USING PigStorage(',') AS (campaign_id:chararray, date:chararray, time:chararray, display_site:chararray, placement:chararray, was_clicked:int, cpc:int, keyword:chararray);-- TODO finish the LOAD statement

uni_data = DISTINCT data;
uni_data = FOREACH uni_data GENERATE campaign_id, REPLACE(date, '-', '/'), time,TRIM(UPPER(keyword)), display_site, placement, was_clicked, cpc; 
STORE uni_data INTO '/dualcore/ad_data2';
