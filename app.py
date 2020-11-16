from flask import Flask
from waitress import serve
app = Flask(__name__)

@app.route('/api/v1/hello-world-<zminna>')
def hello_world(zminna):
    return 'Hello, World!%s' %zminna
    
  #/api/v1/hello-world-{zminna}
  
serve(app, host="0.0.0.0", port=8000)