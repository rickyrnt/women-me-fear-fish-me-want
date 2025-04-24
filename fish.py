#!/usr/bin/env python

import random
import pyttsx3
from xdg import xdg_config_home

with open(xdg_config_home() / 'women-me-fear-fish-me-want/fishlines.txt', 'r') as f:
    line = random.choice(f.readlines())

    engine = pyttsx3.init()
    engine.setProperty('rate', 120)
    voices = engine.getProperty('voices')
    engine.setProperty('voice', voices[2].id) 

    print(line)
    engine.say(line)
    engine.runAndWait()

    engine.stop()
