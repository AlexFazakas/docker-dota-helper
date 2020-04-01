import requests
import json
import sys


NO_INPUT = 1
HERO_STATS = 1
BOOK_TICKET = 2
OPTIMAL_ROUTE = 3
HERO_STATS_URL = '/hero-stats/'
BOOK_TICKET_URL = '/book-ticket/'
OPTIMAL_ROUTE_URL = '/optimal-route/'

def main():
    API = sys.argv[1] + '{}'
    while True:
        print("Choose an option:")
        print("[1]: Get hero stats")
        input = sys.stdin.readline()
        result = ''
        print(input == HERO_STATS)
        if not input:
            sys.exit(NO_INPUT)
        try:
            input = int(input)
        except ValueError:
            input = 0
        if input == HERO_STATS:
            print('Insert the ID or the (case insensitive) name of the hero, pls')
            hero = sys.stdin.readline().strip()
            data = {'hero': hero}
            result = requests.post(API.format(HERO_STATS_URL), data = data).text    
        else:
            result = 'No can do, brother'
        print(result)

if __name__ == '__main__':
    main()
