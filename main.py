import streamClasses
import os
import requests

if not os.getenv("M3U_URLS"):
    raise ValueError("M3U_URLS is not set")

# TV Shows conversion
urls = [url.strip() for url in os.getenv("M3U_URLS").split(" ")]

for url in urls:
    try:
        response = requests.get(url)
        if response.status_code == 200:
            shows = streamClasses.rawStreamList(response)
        else:
            print(f"URL '{url}' is not valid. Status code: {response.status_code}")
    except requests.RequestException as e:
        print(f"Failed to reach URL '{url}'. Error: {e}")
