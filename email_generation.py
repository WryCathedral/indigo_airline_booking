import smtplib

def email(recv,table):
    sender = '[Senders Mail ID]'
    receivers = recv
    message = """
    Thank you for choosing indigo: 
    """+table+"""
    """
    smtp = smtplib.SMTP("smtp.office365.com",587)
    smtp.starttls()
    smtp.login('[Senders Mail ID]', '[Senders Mail ID password]')
    smtp.sendmail(sender, receivers,message)
