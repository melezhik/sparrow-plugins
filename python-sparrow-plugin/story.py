import hackhttp
from outthentic import *

url = config()['url']
hh = hackhttp.hackhttp()

code, head, html, redirect_url, log = hh.http(url)

print code
