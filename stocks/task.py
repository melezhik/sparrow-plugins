import yfinance as yf

from sparrow6lib import config

#define the ticker symbol
tickerSymbol = config()['name']

#get data on this ticker
tickerData = yf.Ticker(tickerSymbol)

#info on the company

print (tickerSymbol,'stocks price:',tickerData.info['currentPrice'])
