FROM public.ecr.aws/lambda/python:3.9

COPY redis_client.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt -t ${LAMBDA_TASK_ROOT}

CMD [ "redis_client.lambda_handler" ]