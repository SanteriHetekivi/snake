from Game import Game


def main():
    try:
        game = Game(800, 600)
        game.run()
    except:
        print("Error!")
        raise


if __name__ == '__main__':
    main()
