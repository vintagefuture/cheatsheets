## Create secret via Cloudformation/SAM template

```
  SlackSecret:
    Type: AWS::SecretsManager::Secret
    Properties:
      Name: !Sub ${AWS::StackName}-secret
      Description: !Sub Slack webhook URL for ${AWS::StackName}
      SecretString: !Sub '{"url":"${SlackWebhookURL}"}'
```
