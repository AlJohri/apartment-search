.PHONY: clean
.DELETE_ON_ERROR:

all: data/posts.json data/stations.json data/ranked_posts.csv

data/posts.json:
	craigslist search washingtondc apa --postal 20071 --search_distance 1 --min_price 900 --max_price 1500 --hasPic --availability within_30_days > $@

data/stations.json:
	curl -s -H 'api_key: ${WMATA_API_KEY}' https://api.wmata.com/Rail.svc/json/jStations | jsonpp > $@

data/ranked_posts.csv:
	./rank.py --posts data/posts.json > $@

clean:
	rm -f posts.json
	rm -f stations.json
	rm -f ranked_posts.csv
	find . -type f -name '*.py[co]' -delete
	find . -type d -name '__pycache__' -delete
