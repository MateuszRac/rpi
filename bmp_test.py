from bmp280 import BMP280
import os
import re
from datetime import datetime
import adafruit_ahtx0
import board
import requests
from dotenv import load_dotenv
import statistics
import time

load_dotenv()


try:
    from smbus2 import SMBus
except ImportError:
    from smbus import SMBus


# Initialise the BMP280
try:
    bus = SMBus(1)
    bmp280 = BMP280(i2c_dev=bus)

    current_time = datetime.utcnow()
    timestamp = current_time.strftime("%Y-%m-%dT%H:%M:%SZ")

    print(bmp280.get_pressure())
except:
    print('BMP280 error')
    