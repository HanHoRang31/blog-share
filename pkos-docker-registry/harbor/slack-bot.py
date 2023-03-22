import os
from flask import Flask, request, jsonify
from slack_sdk import WebClient
from slack_sdk.errors import SlackApiError

app = Flask(__name__)
slack_bot_token = os.environ['SLACK_BOT_TOKEN']
client = WebClient(token=slack_bot_token)

@app.route('/webhook', methods=['POST'])
def handle_webhook():
    data = request.json
    try:
        # Harbor에서 받은 웹훅 데이터를 슬랙 메시지로 변환합니다.
        message = convert_to_slack_message(data)
        summary_text = f"Event: {data.get('event_type', 'N/A')}"

        # 변환된 메시지를 슬랙 채널에 전송합니다.
        response = client.chat_postMessage(
            channel='test',
            text=summary_text,
            blocks=message
        )
        return jsonify({'result': 'success'}), 200
    except SlackApiError as e:
        return jsonify({'error': str(e)}), 500

def convert_to_slack_message(data):
    event_type = data.get("event_type", "N/A")
    operator = data.get("operator", "N/A")
    resources = data.get("event_data", {}).get("resources", [])

    if len(resources) > 0:
        resource_url = resources[0].get("resource_url", "N/A")
    else:
        resource_url = "N/A"
    # 레이 아웃 입력 
    
    message = [
            {
                "type": "header",
                "text": {
                    "type": "plain_text",
                    "text": f"{event_type}",
                    "emoji": True
                }
            },
            {
                "type": "section",
                "fields": [
                    {
                        "type": "mrkdwn",
                        "text": f"*Operator:*\n{operator}"
                    },
                    {
                        "type": "mrkdwn",
                        "text": f"*Resource URL:*\n{resource_url}"
                    }
                ]
            }
        ]
    return message

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
