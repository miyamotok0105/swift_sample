# -*- coding: utf-8 -*-
# sample.py
import falcon
import json

api = falcon.API()

class HelloResource(object):

    def on_get(self, req, resp):
        msg = {
            "message": "Welcome to the Falcon"
        }
        resp.body = json.dumps(msg)

api.add_route("/", HelloResource())


class ItemsResource:
    def on_get(self, req, resp):
        """Handles GET requests"""
        items = {
            'title': 'Python+FalconでWebAPI',
            'tags': [
                {
                    'name': 'Python','versions':[]
                },
                {
                    'name': 'Falcon','vresions':[]
                }
            ]
        }

        resp.body = json.dumps(items,ensure_ascii=False)

api.add_route('/items', ItemsResource())

if __name__ == "__main__":
    from wsgiref import simple_server
    httpd = simple_server.make_server("127.0.0.1", 8000, api)
    httpd.serve_forever()
    
