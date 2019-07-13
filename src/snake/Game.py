from pygame.locals import *
import pygame


class Game():

    def __init__(self, width: int, height: int):
        self._width = width
        self._height = height
        self._running = False
        self._display_surface = None

    def start(self):
        pygame.init()
        self._display = pygame.display.set_mode(
            [self._width, self._height]
        )
        pygame.display.set_caption('Snake')
        self._display.fill((255, 255, 255))
        self._running = True

    def update(self, events: list):
        events.reverse()
        while(len(events) > 0):
            event = events.pop()
            if event == QUIT:
                self._running = False
                return
            pygame.display.flip()
        pass

    def run(self):
        self.start()
        while(self._running):
            pygame.event.pump()
            self.update(pygame.event.get())
        self.stop()

    def stop(self):
        self._running = False
        pygame.quit()
