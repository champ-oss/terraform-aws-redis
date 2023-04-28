package test

import (
	"fmt"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/cloudwatchlogs"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"strings"
	"testing"
	"time"
)

// GetAWSSession Logs in to AWS and return a session
func GetAWSSession() *session.Session {
	fmt.Println("Getting AWS Session")
	sess, err := session.NewSessionWithOptions(session.Options{
		SharedConfigState: session.SharedConfigEnable,
	})
	if err != nil {
		panic(err)
	}
	return sess
}

func GetLogs(session *session.Session, region string, logGroup string, logStream *string) []*cloudwatchlogs.OutputLogEvent {
	svc := cloudwatchlogs.New(session, aws.NewConfig().WithRegion(region))

	params := &cloudwatchlogs.GetLogEventsInput{
		LogGroupName:  aws.String(logGroup),
		LogStreamName: aws.String(*logStream),
	}
	resp, _ := svc.GetLogEvents(params)

	// Pretty-print the response data.
	fmt.Println(resp)
	return resp.Events
}

func GetLogStream(session *session.Session, region string, logGroup string) *string {

	svc := cloudwatchlogs.New(session, aws.NewConfig().WithRegion(region))

	params := &cloudwatchlogs.DescribeLogStreamsInput{
		LogGroupName: aws.String(logGroup),
		Descending:   aws.Bool(true),
		OrderBy:      aws.String("LastEventTime"),
	}

	resp, _ := svc.DescribeLogStreams(params)

	stream := resp.LogStreams[0].LogStreamName

	// Pretty-print the response data.
	fmt.Println(resp)
	return stream
}

func TestExamplesComplete(t *testing.T) {
	t.Parallel()
	region := "us-east-2"

	terraformOptions := &terraform.Options{
		TerraformDir:  "../../examples/complete",
		BackendConfig: map[string]interface{}{},
		EnvVars:       map[string]string{},
		Vars: map[string]interface{}{
			"region": region,
		},
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApplyAndIdempotent(t, terraformOptions)
	time.Sleep(90 * time.Second)

	logger.Log(t, "Creating AWS Session")
	awsSess := GetAWSSession()

	// get lambda tf output logGroupName
	cloudwatchLogGroup := terraform.Output(t, terraformOptions, "cloudwatch_log_group")

	actualLogStreamName := GetLogStream(awsSess, region, cloudwatchLogGroup)
	fmt.Print(actualLogStreamName)

	logger.Log(t, "getting logs")
	outputLogs := GetLogs(awsSess, region, cloudwatchLogGroup, actualLogStreamName)

	logger.Log(t, "checking logs for 500")
	for _, message := range outputLogs {
		assert.NotContains(t, "500", *message.Message)
	}
	logger.Log(t, "checking message in log stream for expected value")
	expectedResponse := "connected"
	foundResponse := false
	for _, message := range outputLogs {
		if strings.Contains(*message.Message, expectedResponse) {
			foundResponse = true
			break
		}
	}
	assert.True(t, foundResponse)

}
