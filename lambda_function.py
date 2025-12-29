import json
import uuid
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('UserData')

def lambda_handler(event, context):
    body = json.loads(event['body'])

    item = {
        "id": str(uuid.uuid4()),
        "name": body["name"],
        "age": body["age"]
    }

    table.put_item(Item=item)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Data saved successfully",
            "data": item
        })
    }
