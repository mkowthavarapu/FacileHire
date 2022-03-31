from django.shortcuts import render
from django.http import HttpResponse
import mysql.connector

def get_mysql_connection():
    connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            db="facile_hire"
            )
    cursor = connection.cursor()

    return connetion, cursor

def execute_query_fetchone(query):
    connection, cursor = get_mysql_connection()
    cursor.execute(query)
    results = cursor.fetchone()
    connection.close()

    return results

def execute_query_fetchall(query):
    connection, cursor = get_mysql_connection()
    cursor.execute(query)
    results = cursor.fetchall()
    connection.close()

    return results

def execute_query(query):
    connection, cursor = get_mysql_connection()
    cursor.execute(query)
    connection.close()    

def candidate_login(user_name, password):
    query = f"select count(*) from candidate_login where user_name = {user_name} and password = {password}"
    status = execute_query_fetchone(query)
    if status:
        return HttpResponse("Candidate Login Successful")
    else:
        return HttpResponse("Invalid login details")

def employee_login(user_name, password):
    query = f"select count(*) from employee_login where user_name = {user_name} and password = {password}"
    status = execute_query_fetchone(query)
    if status:
        return HttpResponse("Employee Login Successful")
    else:
        return HttpResponse("Invalid login details")

def recruiter_login(user_name, password):
    query = f"select count(*) from recruiter_login where user_name = {user_name} and password = {password}"
    status = execute_query_fetchone(query)
    if status:
        return HttpResponse("Recruiter Login Successful")
    else:
        return HttpResponse("Invalid login details")

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def login(request):
    key = ""
    if key == "candidate":
        candidate_login(user_name, password)
    elif key == "employee":
        employee_login(user_name, password)
    elif key == "recruiter":
        recruiter_login(user_name, password)

    return HttpResponse("Hello, at login page")

def job_posting(request):
    query = "insert into job_posting (name, requirements, description, created_date, modified_date) values %s" % ("adasd")
    values = ()
    # execute_query(query % values)
    return HttpResponse("Jobs has been inserted successfully")

