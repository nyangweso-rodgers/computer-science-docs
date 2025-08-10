s3 = boto3.client('s3')

def get_bucketlist():
    ''' This method returns list of bucket names if found.'''
    
    resource_s3 = boto3.client("s3")
    try:
        # get the list of buckets from S3
        get_response = resource_s3.list_buckets()
        buckets = get_response["Buckets"] 
        bucket_list = []

        if buckets != []:
            for bucket in buckets:
                # print("S3 bucket name : ",bucket["Name"])
                bucket_list.append(bucket["Name"])        
            return bucket_list
        else:
            return False
    except ClientError as e:
        logging.error(e)
        return False