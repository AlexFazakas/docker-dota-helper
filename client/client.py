import requests
import json
import sys


GET_HEROES = 'get-heroes/'
GET_HERO_STATS = 'hero-stats/'

NO_INPUT = 1

def main():
    API_BASE = 'http://' + sys.argv[1] + '/'
    while True:
        print("Choose an option:")
        print("[1]: Get heroes")
        print("[2]: Get stats for a particular hero")
        input = sys.stdin.readline()
        result = ''
        if not input:
            sys.exit(NO_INPUT)
        try:
            input = int(input)
        except ValueError:
            input = 0
        if input == 1:
            print(API_BASE + GET_HEROES)
            r = requests.get(API_BASE + GET_HEROES)
            print(r.text)
            result = 'lmao'
        elif input == 2:
            print('Insert the ID of the hero:')
            id = sys.stdin.readline().strip()
            result = json.loads(requests.get(API_BASE + GET_HERO_STATS + "?hero_id=" + id).text)
        else:
            result = 'Optiunea aleasa nu este valida!'
        print(result)

if __name__ == '__main__':
    main()
