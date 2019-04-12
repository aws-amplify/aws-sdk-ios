import boto3
from enum import Enum
from markdown2 import Markdown
class ContentFormat(Enum):
    Text = 1
    Html = 2
    Markdown = 3



default_toaddresses = "aws-mobile-sdk-dev@amazon.com"
def send_email(title, content,  fromaddress = None, toaddresses = None, contentformat = ContentFormat.Text, ccaddresses = None, bccaddresses = None, charset = None):
    print(fromaddress, toaddresses)

    toaddresses = list(map(lambda address:(address.strip()), toaddresses.split(',')))
    if ccaddresses is not None:
        ccaddresses = list(map(lambda address:(address.strip()), ccaddresses.split(',')))
    if bccaddresses is not None:
        bccaddresses = list(map(lambda address:(address.strip()), bccaddresses.split(',')))
    
    destination = {
        'ToAddresses' : toaddresses
    }
    if ccaddresses is not None: 
        destination['CcAddresses'] = ccaddresses
    if bccaddresses is not None:
        destination['BccAddresses'] = bccaddresses

    message = {
        'Subject': {
            'Data':  title 
        },
        'Body': {
        }
    } 
    htmlformat = True ; 
    if contentformat == ContentFormat.Text :
        htmlformat = False

    if contentformat == ContentFormat.Markdown : 
        markdowner = Markdown()
        content = markdowner.convert(content)
    if htmlformat :
        message['Body']['Html'] =  {
                    'Data': content 
                }
    else :
        message['Body']['Text'] =  {
                    'Data': content 
                }    
    # session = boto3.session.Session(profile_name='default')
    client = boto3.client('ses', region_name='us-west-2')
    # session = boto3.session.Session(profile_name='circleci-info')
    # client = session.client('ses')
    response = client.send_email(
        Source = fromaddress,
        Destination = destination,
        Message = message
    )
    print(response)
 

