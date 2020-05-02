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
        print("[2]: Book flight")
        print("[3]: Get optimal route")
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
            print(result)
            if result != 'Could not find the hero. :(':
                d = json.loads(result)
                result = ''
                for k in d:
                    result = result + str(k) + ': ' + str(d[k]) + '\n'
        elif input == BOOK_TICKET:
            print('Insert the ID\'s of the flights you want to book, separated by spaces.')
            flights = sys.stdin.readline().strip()
            flights = flights.split(' ')
            data = {'ids': flights}
            result = requests.post(API.format(BOOK_TICKET_URL), data = data).text
        elif input == OPTIMAL_ROUTE:
            print('Insert the source city')
            source = sys.stdin.readline().strip()
            print('Insert the destination city')
            destination = sys.stdin.readline().strip()
            print('Insert the maximum number of flights')
            flights = sys.stdin.readline().strip()
            print('Insert the departure day')
            departure_day = sys.stdin.readline().strip()
            data = {
                'source': source,
                'destination': destination,
                'flights': flights,
                'departure_day': departure_day
            }
            result = requests.post(API.format(OPTIMAL_ROUTE_URL), data = data).text
        else:
            result = 'Optiunea aleasa nu este valida!'
        print(result)

if __name__ == '__main__':
    main()
