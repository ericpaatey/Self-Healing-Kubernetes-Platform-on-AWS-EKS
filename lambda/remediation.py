import boto3
import subprocess

sns = boto3.client('sns')

TOPIC_ARN = 'SNS_TOPIC_ARN'

def lambda_handler(event, context):

    subprocess.run([
        "kubectl",
        "rollout",
        "restart",
        "deployment/self-healing-app"
    ])

    sns.publish(
        TopicArn=TOPIC_ARN,
        Subject='Kubernetes Auto-Remediation',
        Message='Deployment restarted automatically.'
    )

    return {
        'statusCode': 200,
        'body': 'Kubernetes remediation executed'
    }