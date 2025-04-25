#!/usr/bin/env python

import random
import pyttsx3
from pathlib import Path
from xdg import xdg_config_home

linefile = Path("./fishlines.txt")
if Path.exists(xdg_config_home() / 'women-me-fear-fish-me-want/fishlines.txt'):
    linefile = xdg_config_home() / 'women-me-fear-fish-me-want/fishlines.txt'

with open(linefile, 'r') as f:
    line = random.choice(f.readlines())

    engine = pyttsx3.init()
    engine.setProperty('rate', 120)
    voices = engine.getProperty('voices')
    engine.setProperty('voice', voices[1].id) 

    print(line)
    engine.say(line)
    engine.runAndWait()

    engine.stop()
