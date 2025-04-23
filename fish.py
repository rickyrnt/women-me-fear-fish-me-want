import random
import pyttsx3

with open('/etc/fishe.txt', 'r') as f:
    line = random.choice(f.readlines())

    engine = pyttsx3.init()
    engine.setProperty('rate', 120)
    voices = engine.getProperty('voices')
    engine.setProperty('voice', voices[2].id) 

    print(line)
    engine.say(line)
    engine.runAndWait()

    engine.stop()
