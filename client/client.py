import requests
import json
import sys


NO_INPUT = 1
HERO_STATS = 1
HERO_WINRATE = 2
MATCH_RESULT = 3
BEST_MATCHUPS = 4
WORST_MATCHUPS = 5
HERO_STATS_URL = '/hero-stats/'
HERO_WINRATE_URL = '/hero-winrate/'
MATCH_RESULT_URL = '/match-result/'
MATCHUPS_URL = '/get-matchups/'

def stringify_result(result) -> str:
    if result != 'Could not find the hero. :(':
        d = json.loads(result)
        result = ''
        for k in d:
            result = result + str(k) + ': ' + str(d[k]) + '\n'
    return result

def stringify_matchups(result, matchups='Best matchups') -> str:
    res = matchups + '\n'
    for matchup in result:
        res = res + matchup['Hero'] + ' - ' + str(matchup['Win rate']) + '\n'
    return res

def main():
    API = sys.argv[1] + '{}'
    API_2 = sys.argv[2] + '{}'
    while True:
        print("Choose an option:")
        print("[1]: Get hero stats")
        print("[2]: Get hero winrate")
        print("[3]: Add a match result")
        print("[4]: Get best matchups for a hero")
        print("[5]: Get worst matchups for a hero")
        input = sys.stdin.readline()
        result = ''
        if not input:
            sys.exit(NO_INPUT)
        try:
            input = int(input)
        except ValueError:
            input = 0
        if input == HERO_STATS:
            print('Insert the ID or the name of the hero you want stats for:')
            hero_id = sys.stdin.readline().strip()
            data = {'hero': hero_id}
            result = requests.post(API.format(HERO_STATS_URL), data = data).text
            result = stringify_result(result)
        elif input == HERO_WINRATE:
            print('Insert the ID or the name of the hero you want the winrate for:')
            hero_id = sys.stdin.readline().strip()
            data = {'hero': hero_id}
            result = requests.post(API.format(HERO_WINRATE_URL), data = data).text
            result = stringify_result(result)
        elif input == MATCH_RESULT:
            print('Insert the ID or the name of the hero you want to update the record for:')
            hero_id = sys.stdin.readline().strip()
            print('Was it a win or a loss? [W / L]:')
            win_loss = sys.stdin.readline().strip().lower()
            if win_loss not in ['w', 'l', 'win', 'loss']:
                result = 'That\'s not really a legitimate outcome for a match, is it?'
            else:
                data = {'hero': hero_id, 'result': win_loss}
                result = requests.post(API.format(MATCH_RESULT_URL), data = data).text
                result = stringify_result(result)
        elif input == BEST_MATCHUPS:
            print('Insert the ID of the hero you want the best matchups for:')
            hero_id = sys.stdin.readline().strip()
            data = {'hero': hero_id, 'best': 'best'}
            result = json.loads(requests.post(API_2.format(MATCHUPS_URL), data = data).text)
            result = stringify_matchups(result)
        elif input == WORST_MATCHUPS:
            print('Insert the ID of the hero you want the worst matchups for:')
            hero_id = sys.stdin.readline().strip()
            data = {'hero': hero_id, 'best': 'worst'}
            result = json.loads(requests.post(API_2.format(MATCHUPS_URL), data = data).text)
            result = stringify_matchups(result, matchups='Worst matchups')
        else:
            result = 'That\'s not a valid option!'
        print(result)

if __name__ == '__main__':
    main()
