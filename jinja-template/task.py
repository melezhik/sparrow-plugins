from sparrow6lib import *
from jinja2 import Template

template = config()['template']
variables = config()['variables']

template = Template(template)

out = template.render(variables)

result = { 'result': out }

update_state(result)

