import requests
import json
import os

def main():
    '''
    '''
    SERVICE = os.environ.get('REPO_NAME')
    REVIEWER_NAME = os.environ.get('REVIEWER_NAME')
    DESCRIPTION = os.environ.get('DESCRIPTION')
    LINK_TO_PR = os.environ.get('LINK_TO_PR')
    # get the name of the repo from the event
    msg = f"Deploying {SERVICE} reviewed by {REVIEWER_NAME} - {DESCRIPTION} [{LINK_TO_PR}]"
    print(msg)
    # res = requests.post("https://hooks.slack.com/services/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", data = json.dumps({"text": msg}))
    # print(res)

if __name__ == '__main__':
    main()