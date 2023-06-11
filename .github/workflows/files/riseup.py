import requests
import json
import os

def main():
    '''
    '''
    context = json.loads(os.getenv("GITHUB_CONTEXT"))
    service = context.get('repository').get('event').get('repository').get('name')
    reviewer_name = context['event']
    description = context['event']
    link_to_PR = context.get('html_url')
    # get the name of the repo from the event
    msg = f"Deploying ${service} reviewed by ${reviewer_name} - ${description} ${link_to_PR}"
    print(msg)
    # res = requests.post("https://hooks.slack.com/services/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", data = json.dumps({"text": msg}))
    # print(res)

if __name__ == '__main__':
    main()