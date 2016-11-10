#!/usr/bin/env python3

import csv
import json
import arrow
import argparse
from geopy.distance import vincenty

parser = argparse.ArgumentParser()
parser.add_argument('--posts')
args = parser.parse_args()

with open(args.posts) as f:
	posts = [json.loads(line) for line in f]

print(posts)