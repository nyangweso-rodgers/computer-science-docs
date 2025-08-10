import boto3
import os

s3 = boto3.client('s3')
with open("FILE_NAME", "rb") as f:
    s3.upload_fileobj(f, "BUCKET_NAME", "OBJECT_NAME")
    
def upload2S3(res_s3, buckets_list):
    ''' Uploads given file to s3 buckets in the list. '''   
    available_bucket = []
    user_file = str(input("\nGive full path details or just name if local for the file you want to upload : "))
    file_exists = os.path.exists(user_file) # check if files exist or not      
    if get_bucketlist():
        if file_exists == True:           
            for bucket_name in buckets_list:
                available_bucket.append(bucket_name)
            print("Available buckets : ",available_bucket)
            for bucket_name in buckets_list:          
                user_input = str(input(f"Do you want to upload file to this {bucket_name} bucket, Enter '1' or anyother key to skip : "))
                while user_input == '1':               
                    with open(user_file, 'rb') as data:
                        res_s3.upload_fileobj(
                            Fileobj=data, 
                            Bucket=bucket_name, 
                            Key=user_file
                        )
                    print(f"This Bucket {bucket_name} got uploaded with file {data.name}")
                    return True
                continue          
        else:
            print(f'The given file {user_file} or S3 bucket does not exist!')  
            return False
    else:
        print("\n No Buckets are found in this account!")