import requests
import json
import os

def main():
    '''
    '''
    service = os.environ['SERVICE']
    reviewer_name = os.environ['REVIEWER_NAME']
    description = os.environ['DESCRIPTION']
    link_to_PR = os.environ['LINK_TO_PR']
    # get the name of the repo from the event
    msg = f"Deploying ${service} reviewed by ${reviewer_name} - ${description} ${link_to_PR}"
    print(msg)
    # res = requests.post("https://hooks.slack.com/services/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", data = json.dumps({"text": msg}))
    # print(res)

if __name__ == '__main__':
    main()