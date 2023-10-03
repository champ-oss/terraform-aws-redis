set -e

aws logs tail $CLOUDWATCH_LOG_GROUP | grep -vi error
aws logs tail $CLOUDWATCH_LOG_GROUP | grep -i "connected"