import smtplib

def email(recv,table):
    sender = 'chodagamthanuja01@outlook.com'
    receivers = recv
    message = """
    Thank you for choosing indigo: 
    """+table+"""
    """
    smtp = smtplib.SMTP("smtp.office365.com",587)
    smtp.starttls()
    smtp.login('chodagamthanuja01@outlook.com', 'Thanujach@0810')
    smtp.sendmail(sender, receivers,message)
