#!/bin/bash

#GET Project's Environment, EcoSystem and Name Information
appEnv=$(cat /aws.services/.ec2Instance   | grep Environment    | awk '{print $2}')
appEco=$(cat /aws.services/.ec2Instance   | grep EcoSystem      | awk '{print $2}')
appName=$(cat /aws.services/.ec2Instance  | grep WebApplication | awk '{print $2}')

echo "####################"
  echo $appEnv
  echo $appEco
  echo $appName
echo "####################"

aws s3 cp s3://$appEnv-$appEco-$appName-app-cnf/.app-iam_user.credentials /aws.services/.aws/.$appEco.$appName.credentials
chmod 600 /aws.services/.aws/.$appEco.$appName.credentials
