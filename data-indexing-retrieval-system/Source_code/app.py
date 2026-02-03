from flask import Flask, request, render_template
from elasticsearch import Elasticsearch
import math

# Change password
ELASTIC_PASSWORD = "HP2E+ix_-dmrFlvnJx6g"

es = Elasticsearch("https://localhost:9200", http_auth=("elastic", ELASTIC_PASSWORD), verify_certs=False)
app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search')
def search():
    page_size = 12
    keyword = request.args.get('keyword', '').strip()  # Get keyword from the search box, default to empty string
    page_no = int(request.args.get('page', 1))

    # If keyword is empty, show all results in ascending order based on 'name'
    if keyword == "":
        body = {
            "size": page_size,
            "from": page_size * (page_no - 1),
            "sort": [
                {"name": {"order": "asc"}}  # Sort by 'name' in ascending order
            ]
        }
    else:
        # Define search body with multi_match and match_phrase for exact sequence matching
        body = {
            "size": page_size,
            "from": page_size * (page_no - 1),
            "query": {
                "bool": {
                    "should": [
                        # Exact phrase match for the name field
                        {
                            "match_phrase": {
                                "name": {
                                    "query": keyword,
                                    "boost": 5  # Give the 'name' field a higher boost (more important)
                                }
                            }
                        },
                        # Exact match or partial match (wildcard) for the name field
                        {
                            "wildcard": {
                                "name": {
                                    "value": f"{keyword.lower()}*",
                                    "boost": 4  # Boost partial matches (lower priority than match_phrase)
                                }
                            }
                        },
                        # Match query across multiple fields with a focus on name
                        {
                            "multi_match": {
                                "query": keyword,
                                "fields": ["name^3", "description^2", "creator_name", "species"],
                                "type": "best_fields",
                                "fuzziness": "AUTO"
                            }
                        }
                    ],
                    "minimum_should_match": 1
                }
            }
        }

    res = es.search(index='sanrio2', body=body)
    hits = [
        {
            'id': doc['_id'],  # Add the Elasticsearch document ID
            'name': doc['_source']['name'],
            'description': doc['_source']['description'],
            'gender': doc['_source']['gender'],
            'first_appearance': doc['_source']['first_appearance'],
            'picture_url': doc['_source'].get('picture_url', ''),  # Add picture_url from Elasticsearch
            'score': doc['_score']  # Include the score in each hit
        }
        for doc in res['hits']['hits']
    ]
    page_total = math.ceil(res['hits']['total']['value'] / page_size)

    return render_template('search.html', keyword=keyword, hits=hits, page_no=page_no, page_total=page_total)

# Add route for character detail page
# @app.route('/character/<string:character_id>')
# def character_detail(character_id):
#     # Fetch the character document using its ID
#     res = es.get(index='sanrio2', id=character_id)
#     character = res['_source']

#     return render_template('character_detail.html', character=character)

@app.route('/character/<id>')
def character_detail(id):
    keyword = request.args.get('keyword', '')  # Retrieve the keyword if it exists in the query
    doc = es.get(index='sanrio2', id=id)

    character = {
        'name': doc['_source']['name'],
        'picture_url': doc['_source']['picture_url'],
        'description': doc['_source']['description'],
        'first_appearance': doc['_source']['first_appearance'],
        'creator_name': doc['_source']['creator_name'],
        'species': doc['_source']['species'],
        'gender': doc['_source']['gender'],
        'score': doc.get('score', None)
    }
    return render_template('character_detail.html', character=character, keyword=keyword)


if __name__ == "__main__":
    app.run(debug=True)
