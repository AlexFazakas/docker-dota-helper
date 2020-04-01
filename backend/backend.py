from typing import List, Dict
from flask import Flask
from flask import request
from urllib.parse import parse_qs
from copy import deepcopy
from collections import OrderedDict
import mysql.connector
import json
import uuid


app = Flask(__name__)
connection = None

def initialiaze_db_connection():
    global connection

    with open('config.json', 'r') as f:
        config = json.load(f)
    print(config)
    connection = mysql.connector.connect(**config)
    print(connection)
    connection.autocommit = True

@app.route('/hero-stats/', methods=['POST'])
def book_ticket() -> str:
    global connection

    data = parse_qs(request.get_data().decode('utf-8'))
    hero = data['hero']
    if not connection:
        initialiaze_db_connection()
    cursor = connection.cursor(buffered=True)
    attributes = ['name',
        'attack_type',
        'primary_attribute',
        'attack_range',
        'base_agility',
        'base_armor',
        'base_health',
        'base_mana',
        'base_mana_regeneration',
        'base_strength',
        'intelligence_gain',
        'agility_gain',
        'strength_gain'
    ]
    cursor.execute('call get_hero_stats(\'{}\')'.format(hero), multi=True)
    result = [x for x in cursor]
    initialiaze_db_connection()
    if not result:
        return 'No result found'
    result = list(result[0])
    dictionary = collections.OrderedDict()
    for i in range(len(attributes)):
        fancy_attribute = attributes[i][:1].upper() + attributes[i].replace('_',' ')[1:]
        dictionary[fancy_attribute] = result[i]
    for attrib in ['Intelligence gain', 'Agility gain', 'Strength gain']:
        dictionary[attrib] = round(dictionary[attrib], 2)
    hero_information = ''
    for attribute in dictionary:
        hero_information = hero_information + attribute + ': ' + str(dictionary[attribute]) + '\n'

    return hero_information

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
