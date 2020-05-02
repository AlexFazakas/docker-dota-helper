from typing import List, Dict
from flask import Flask
from flask import request
from urllib.parse import parse_qs
from copy import deepcopy
import mysql.connector
import json
import uuid


ID=0
SOURCE=1
DESTINATION=2
DEPARTURE_HOUR=3
DEPARTURE_DAY=4
DURATION=5
CAPACITY=6

app = Flask(__name__)
connection = None

def initialiaze_db_connection():
    global connection

    with open('config.json', 'r') as f:
        config = json.load(f)
    connection = mysql.connector.connect(**config)
    connection.autocommit = True

@app.route('/hero-stats/', methods=['POST'])
def hero_stats() -> str:
    global connection

    if not connection:
        initialiaze_db_connection()
    data = parse_qs(request.get_data().decode('utf-8'))
    cursor = connection.cursor(buffered=True)
    hero = data['hero'][0]
    cursor.execute('select * from heroes where id = \'{}\' or lower(name) = \'{}\''.format(
        hero, str(hero).lower())
    )
    basic_stats = [x for x in cursor]
    if not basic_stats:
        return 'Could not find the hero. :('
    else:
        basic_stats = basic_stats[0]
    hero_id = basic_stats[0]
    cursor.execute('select * from hero_stats where id = {}'.format(hero_id))
    fancy_stats = [x for x in cursor][0]
    res = {
        'Name': basic_stats[1],
        'Primary attribute': basic_stats[2],
        'Attack type': basic_stats[3],
        'Attack range': fancy_stats[1],
        'Base agility': fancy_stats[2],
        'Base armor': fancy_stats[3],
        'Base health': fancy_stats[4],
        'Base intelligence': fancy_stats[5],
        'Base mana': fancy_stats[6],
        'Base mana regeneration': fancy_stats[7],
        'Base strength': fancy_stats[8],
        'Intelligence gain': fancy_stats[9],
        'Agility gain': fancy_stats[10],
        'Strength gain': fancy_stats[11],
    }
    return json.dumps(res)

@app.route('/hero-winrate/', methods=['POST'])
def hero_winrate() -> str:
    global connection

    if not connection:
        initialiaze_db_connection()
    data = parse_qs(request.get_data().decode('utf-8'))
    cursor = connection.cursor(buffered=True)
    hero = data['hero'][0]
    cursor.execute('select * from hero_record where id = \'{}\' or lower(name) = \'{}\''.format(
        hero, str(hero).lower())
    )
    stats = [x for x in cursor]
    if not stats:
        return 'Could not find the hero. :('
    else:
        stats = stats[0]
    wins = stats[2]
    losses = stats[3]
    win_rate = 0
    if losses == 0:
        win_rate = 100
    else:
        win_rate = round(wins / (wins + losses) * 100, 2)
    res = {
        'Wins': str(wins),
        'Losses': str(losses),
        'Winrate': str(win_rate) + '%'
    }
    return json.dumps(res)

@app.route('/match-result/', methods=['POST'])
def update_record() -> str:
    global connection

    if not connection:
        initialiaze_db_connection()
    data = parse_qs(request.get_data().decode('utf-8'))
    cursor = connection.cursor(buffered=True)
    hero = data['hero'][0]
    cursor.execute('select * from heroes where id = \'{}\' or lower(name) = \'{}\''.format(
        hero, str(hero).lower())
    )
    stats = [x for x in cursor]
    if not stats:
        return 'Could not find the hero. :('
    else:
        stats = stats[0]
    hero_id = stats[0]
    hero_name = stats[1]
    win_loss = data['result'][0]
    column = 'wins'
    if win_loss in ['l', 'loss']:
        column = 'losses'
    cursor.execute('update hero_record set {} = {} + 1 where id = \'{}\''.format(
        column, column, hero_id
    ))
    return json.dumps({'Result': 'updated the record for {}'.format(hero_name)})

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
