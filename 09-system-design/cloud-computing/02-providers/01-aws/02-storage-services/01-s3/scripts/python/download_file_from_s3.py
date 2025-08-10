import boto3
import logging
from botocore.exceptions import ClientError

s3 = boto3.client('s3')
s3.download_file('BUCKET_NAME', 'OBJECT_NAME', 'FILE_NAME')

def get_files(s3_client, bucket_list ):
    '''Download Files from S3 Buckets'''    
    files = list_of_files(bucket_list)    
    # Get the files if found in these buckets        
    for bucket_name in bucket_list:
        # go through the list of files in the bucket.
        for file in files:  
            count = 0
            while len(files) != 0:
            # check if file is exists in this given bucket!                
                file_size = key_existing_size_head(s3_client,bucket_name,file)  
                count += 1     
                if file_size != None:
                    try:            
                        s3_client.download_file(bucket_name,file, gen_filename())  # gen_filename() - downloaded file name
                        if count == len(files):
                            return True
                        continue
                    except ClientError as e:
                        logging.error(e)
                        return False