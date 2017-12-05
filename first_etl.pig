data = LOAD '/dualcore/ad_data1.txt' AS(keyword:chararray, campaign_id:chararray, date:chararray, time:chararray, display_site:chararray, was_clicked:int, cpc:int, country:chararray, placement:chararray); -- TODO finish the LOAD statement
usa = FILTER data BY country == 'USA';
newRelation = FOREACH usa GENERATE campaign_id, date, time,TRIM(UPPER(keyword)), display_site, placement, was_clicked, cpc;
STORE newRelation INTO '/dualcore/ad_data1';
