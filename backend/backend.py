from typing import List, Dict
from flask import Flask
from flask import request
from urllib.parse import parse_qs
from copy import deepcopy
import mysql.connector
import json
import uuid
import requests



app = Flask(__name__)
API_BASE = 'https://api.opendota.com/api/'

@app.route('/get-heroes/', methods=['GET'])
def get_heroes() -> str:
    r = requests.get(API_BASE + 'heroes')
    return r.text

@app.route('/hero-stats/', methods=['GET'])
def get_hero_stats() -> str:
    hero_id = request.args.get('hero_id', None)
    if not hero_id:
        return 'No hero_id given :('
    r = json.loads(requests.get(API_BASE + 'heroStats').text)
    result = [x for x in r if x['id'] == int(hero_id)][0]
    return str(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
