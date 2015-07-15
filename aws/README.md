#doc
http://aws.amazon.com/cli/
#Configure
pip install awscli


##sync
aws s3 sync /source_dir s3://target_bucket/

###flags
- --delete: deletes directory at target if source no longer contains
