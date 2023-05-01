import json
import redis
import sys
import os
import logging


log = logging.getLogger()
log.setLevel(logging.DEBUG)


def lambda_handler(event, context):
    redis_conn = None
    redis_endpoint = None
    redis_port = None
    redis_auth = None

    if "REDIS_HOST" in os.environ and "REDIS_AUTH" in os.environ and "REDIS_PORT" in os.environ:
        redis_endpoint = os.environ["REDIS_HOST"]
        redis_port = os.environ["REDIS_PORT"]
        redis_auth = os.environ["REDIS_AUTH"]
        log.debug("redis: " + redis_endpoint)
    else:
        log.debug(" REDIS_HOST REDIS_PORT REDIS_AUTH configuration not set !")
        return {
            'statusCode': 500
        }

    try:
        log.debug('#Starting redis connection')
        redis_conn = redis.StrictRedis(host=redis_endpoint, port=redis_port, db=0, ssl=True, password=redis_auth)
        log.debug('connected')
        redis_conn.set("foo", "bar")
        log.debug(redis_conn.get("foo"))
    except Exception as ex:
        log.debug("failed to connect to redis:", ex.__class__, " occurred")
        return {
            'statusCode': 500
        }
    finally:
        del redis_conn

    return {
        'statusCode': 200
    }