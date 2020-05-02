from typing import List, Dict
from flask import Flask
from flask import request
from urllib.parse import parse_qs
from copy import deepcopy
import requests
import json
import uuid


API = 'https://api.opendota.com/api/{}/'

app = Flask(__name__)
connection = None

ids_to_names = {}

def get_hero_name(hero_id):
    if len(ids_to_names) == 0:
        heroes = json.loads(requests.get(API.format('heroes')).text)
        for hero in heroes:
            ids_to_names[hero['id']] = hero['localized_name']
    return ids_to_names[hero_id] if hero_id in ids_to_names else None

def get_id_for_hero_name(hero_name):
    if len(ids_to_names) == 0:
        heroes = json.loads(requests.get(API.format('heroes')).text)
        for hero in heroes:
            ids_to_names[hero['id']] = hero['localized_name']
    if hero_name in ids_to_names.values():
        for id in ids_to_names:
            if ids_to_names[id].lower() == hero_name.lower():
                return id
    return None

@app.route('/get-matchups/', methods=['POST'])
def update_record() -> str:
    data = parse_qs(request.get_data().decode('utf-8'))
    hero = data['hero'][0]
    try:
        num = int(hero)
    except:
        hero = get_id_for_hero_name(hero)
        if not hero:
            return 'Could not find the hero. :('
    best_worst = data['best'][0]
    matchups = json.loads(requests.get(API.format('heroes') + str(hero) + '/matchups').text)
    if not matchups:
        return 'Could not find the hero. :('
    polished_matchups = []
    for matchup in matchups:
        hero_id = matchup['hero_id']
        total = matchup['games_played']
        wins = matchup['wins']
        if total > 0:
            winrate = wins / total * 100
            polished_matchups.append({
                'hero_id': hero_id,
                'winrate': winrate
            })
    polished_matchups.sort(key=lambda matchup: matchup['winrate'])
    if best_worst == 'worst':
        polished_matchups = polished_matchups[:10]
    else:
        polished_matchups = polished_matchups[-10:]
        polished_matchups.reverse()
    res = []
    for matchup in polished_matchups:
        res.append({
            'Hero': get_hero_name(matchup['hero_id']),
            'Win rate': matchup['winrate']
        })
    return json.dumps(res)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
