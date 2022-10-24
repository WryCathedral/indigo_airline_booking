import pymysql
from tabulate import tabulate
import time
import matplotlib.pyplot as plt
import numpy as np
import email_generation
import pywhatkit
import datetime


db = pymysql.connect(host="localhost", user="root", passwd="", database="indigo-airline")


def menu():
    print("Main Menu")
    data = [["To search for a flight", "To view the demand", "To book", "To retrieve booking", "To exit"]]
    head = ["Press 1", "Press 2", "Press 3", "Press 4", "Press 5"]
    print(tabulate(data, headers=head, tablefmt="grid"))
    n = input("Enter Your Choice:")
    if n == "1":
        search()
    elif n == "2":
        view_demand()
    elif n == "3":
        search()
    elif n == "4":
        a=int(input("Enter Tid:"))
        if a<300 or a>350:
            print("invalid Ticket ID")
            menu()
        else:
            retrieve_booking(a)
    elif n == "5":
        db.close()
        return None
    else:
        print("Your choice should be from 1-5")
        return menu()


def view_demand():
    x = np.array(["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"])
    y = np.array([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    v_demand = db.cursor()
    v_query = "select f.dep_date from flight f,ticket t where t.fid=f.fid"
    v_demand.execute(v_query)
    vie = v_demand.fetchall()
    for i in range(len(vie)):
        y[int(vie[i][0][3:5]) - 1] += 1
    plt.bar(x, y)
    plt.show()
    return menu()


def retrieve_booking(n):
    retrieve = db.cursor()
    retrieve_query = "select p.name,f.dep_time,f.dep_date,f.arr_time,f.arr_date,r.from_city,r.to_city,t.class,t.payment_method,t.refreshments from route r,flight f,ticket t,passenger p where t.tid=%s and t.cid=p.cid and t.fid=f.fid and f.rid=r.rid"
    retrieve.execute(retrieve_query, n)
    re = retrieve.fetchall()
    re = list(re[0])
    email_cursor = db.cursor()
    email_query = "select p.email,p.contact_no from passenger p,ticket t where t.tid=%s and t.cid=p.cid"
    email_cursor.execute(email_query, n)
    h = email_cursor.fetchall()
    e = h[0][0]
    c_no = h[0][1]
    retrieve_head = ["Name", "Departure\nTime", "Departure\nDate", "Arrival\ntime", "Arrival\nDate", "From", "To",
                     "Class", "Paid\nThrough", "Refreshments\nProvided"]
    print(tabulate([re], headers=retrieve_head, tablefmt="grid"))
    email_generation.email(e, tabulate([re], headers=retrieve_head, tablefmt="grid"))
    print("A copy of your ticket has been sent your mail ID:",e)
    time.sleep(1)
    current_time = datetime.datetime.now()
    pywhatkit.sendwhatmsg('+91'+c_no,tabulate([re], headers=retrieve_head, tablefmt="grid"),current_time.hour,current_time.minute+1)
    return menu()


def booking(fid, rid):
    cid = passenger_details()
    time.sleep(1)
    print("Registered Successfully in the Database with cid:", cid)
    booking_cursor = db.cursor()
    booking_query = "select eco_amt,buss_amt,first_amt from flight where fid=%s and rid=%s"
    booking_cursor.execute(booking_query, (fid, rid))
    k = booking_cursor.fetchall()
    k = list(k[0])
    head = ["Economy class Press 1", "Business class Press 2", "First class Press 3"]
    print(tabulate([k], headers=head, tablefmt="grid"))
    t_class = int(input("Enter your choice for the type of class:"))
    if t_class == 1:
        t_class = "Economy"
    elif t_class == 2:
        t_class = "Business"
    elif t_class == 3:
        t_class = "First"
    options = [["Press 1", "Press 2", "Press 3", "Press 4"]]
    head_options = ["Debit-card", "Credit-card", "Net banking", "UPI"]
    print(tabulate(options, headers=head_options, tablefmt="grid"))
    payment_method = int(input("Choose your mode of payment:"))
    print_t = db.cursor()
    print_query = "INSERT INTO `ticket`(`tid`, `cid`, `fid`, `class`, `payment_method`) VALUES (0,%s,%s,%s,%s)"
    print_t.execute(print_query, (cid, fid, t_class, head_options[payment_method - 1]))
    db.commit()
    print("Payment Received")
    time.sleep(1)
    print("Ticket booked successfully")
    time.sleep(1)
    view = db.cursor()
    view_query = "select tid from ticket where cid=%s and fid=%s"
    view.execute(view_query, (cid, fid))
    v = view.fetchall()
    v = int(v[0][0])
    print("Your ticket Tid:", v)
    retrieve_booking(v)
    time.sleep(1)
    return None


def search():
    from_city = input("From:").lower()
    to_city = input("To:").lower()
    dep_date = input("date(dd-mm-yyyy):")
    route_cursor = db.cursor()
    route_query = "select rid from route where from_city=%s and to_city=%s"
    route_cursor.execute(route_query, (from_city, to_city))
    r = route_cursor.fetchall()
    search_cursor = db.cursor()
    search_query = "select fid,dep_time,arr_time,arr_date,seats_available,eco_amt from flight where seats_available!=0 and dep_date=%s and rid in (select rid from route where from_city=%s and to_city=%s) order by eco_amt"
    search_cursor.execute(search_query, (dep_date, from_city, to_city))
    s = search_cursor.fetchall()
    if s == ():
        print("They are no flights between the selected cities")
        return search()
    print("Available flights are:")
    data = []
    for i in range(len(s)):
        data.append([i + 1] + list(s[i]))
    head = ["S.no", "Flight No.", "Boarding Time", "Arrival Time", "Arrival Date", "Number of seats available", "Price"]
    print(tabulate(data, headers=head, tablefmt="grid"))
    n = int(input("Enter S.no to book tickets or Press 0 to Go to Menu:"))
    if n == 0:
        menu()
    else:
        return booking(int(data[n - 1][1]), int(r[0][0]))


def passenger_details():
    name = input("Enter Your Name:")
    age = input("Enter your age:")
    email = input("Enter your mail ID:")
    address = input("Enter your address:")
    phone = input("Enter your phone number:")
    details = [name, age, email, address, phone]
    pass_cursor = db.cursor()
    pass_query = "INSERT INTO `passenger`(`name`, `age`, `email`, `address`, `contact_no`) VALUES (%s,%s,%s,%s,%s)"
    pass_cursor.execute(pass_query, details)
    db.commit()
    detail_cursor = db.cursor()
    detail_query = "select * from passenger where name=%s"
    detail_cursor.execute(detail_query, name)
    s = detail_cursor.fetchall()
    f = list(s[0])
    head = ["Cid", "name", "age", "Email", "address", "phone"]
    print("Your Details\n", tabulate([f], headers=head, tablefmt="grid"))
    time.sleep(1)
    return f[0]


menu()
