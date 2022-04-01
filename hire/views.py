from django.shortcuts import render
from django.http import HttpResponse
import mysql.connector
from django.template import loader
from django.views.decorators.csrf import csrf_protect


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

@csrf_protect
def candidate_dashboard(request):
    status = False
    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("pwd")
        # query = f"select count(*) from candidate_login where user_name = {user_name} and password = {password}"
        # status = execute_query_fetchone(query)
        if status:
            context = {"message": ""}
            return HttpResponse("Candiate login successful")
        else:
            context = {"message": "Invalid email or password"}
            return render(request, 'hire/cand-login.html', context)

def employee_dashboard(request):
    status = True
    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("pwd")
        # query = f"select count(*) from employee_login where user_name = {user_name} and password = {password}"
        # status = execute_query_fetchone(query)
        if status:
            return HttpResponse("Employee login successful")
        else:
            context = {"message": "Invalid email or passowrd"}
            return HttpResponse("Invalid email or passowrd")            
    

def recruiter_dashboard(request):
    status = True
    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("pwd")
        # query = f"select count(*) from recruiter_login where user_name = {user_name} and password = {password}"
        # status = execute_query_fetchone(query)
        if status:
            return HttpResponse("Recruiter login successful")
        else:
            context = {"message": "Invalid email or passowrd"}
            return HttpResponse("Invalid email or passowrd")      

def index(request):
    context = {}
    return render(request, 'hire/index.html', context)

def login(request):
    context = {}
    key = request.path
    if "candidate" in key:
        template_render = render(request, 'hire/cand-login.html', context)
        # candidate_login(user_name, password)
    elif "employee" in key:
        template_render = render(request, 'hire/emp-login.html', context)
        # employee_login(user_name, password)
    elif "recruiter" in key:
        template_render = render(request, 'hire/rec-login.html', context)
        # recruiter_login(user_name, password)

    return template_render

def job_posting(request):
    query = "insert into job_posting (name, requirements, description, created_date, modified_date) values %s" % ("adasd")
    values = ()
    # execute_query(query % values)
    return HttpResponse("Jobs has been inserted successfully")

