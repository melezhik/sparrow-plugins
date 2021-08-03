from sparrow6lib import *
from jinja2 import Template

#jsonFile = open('links.json', 'r')
#jsonData = json.load(linksFile)

template = config()['template']
variables = config()['variables']
#get_state

template = Template(template)

out = template.render(variables)

result = { 'result': out }

update_state(result)

#template = jinjaEnv.get_template('index.html')
#return template.render(linksList=linksList)
