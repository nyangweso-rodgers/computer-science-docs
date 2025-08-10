import boto3
import logging

def Delete_All_S3Buckets():
    """ This method delete all S3 buckets if no files found else it call on delete_all_files_in_bucket() to delete files. """
    s3_client = boto3.client("s3")
    # get the list of buckets    
    bucket_names = get_bucketlist() 
    if bucket_names != False:        
        print("Available S3 Buckets to be deleted : ", bucket_names)
    else:
        print("No Buckets found!")
        return False
    try:
        get_response = s3_client.list_buckets()
        buckets = get_response["Buckets"]
        # print("Before Deleting buckets count : ",len(buckets))        
        if len(buckets) != 0:
            userinput = str(input(f"Do you want to delete the {len(buckets)} buckets, Enter '1' to delete, anyother key to skip : "))
            if userinput == '1':
                # print("Prechecks Deleting process ... \n")
                count = len(buckets)
                while count != 0: # change this to while loop to continue deletion.                    
                    for bucket_name in bucket_names:
                        print("Checking if the buckets are empty ...")
                        fileObj = s3_client.list_objects_v2(Bucket=bucket_name)
                        fileCount = fileObj['KeyCount']
                        print(f"Found {bucket_name} bucket has this much files : {fileCount}")                    
                        if fileCount == 0:
                            print(f"Deleting {bucket_name} ...")
                            response = s3_client.delete_bucket(Bucket=bucket_name)
                            print("S3 bucket {} has been deleted successfully !!!".format(bucket_name))
                            count -= count
                            continue
                        else:
                            if (delete_all_files_in_bucket(s3_client,bucket_name,buckets)) != False:
                                return True                      
                    return True
        else:
            print("No Buckets found!")
            return False
    except ClientError as e:
        logging.error(e)
        return False