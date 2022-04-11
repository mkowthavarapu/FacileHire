from django.shortcuts import render
from django.http import HttpResponse
import mysql.connector
from django.template import loader
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import redirect
from localStoragePy import localStoragePy

localStorage = localStoragePy('facile_hire', 'json')

def get_mysql_connection():
    connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            db="facile_hire"
            )
    cursor = connection.cursor()

    return connection, cursor

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
def candidate_login(request):
    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("pwd")
        query = f"select count(*) from candidate_login where user_name = '{email}' and password = '{password}'"
        status = execute_query_fetchone(query)
        if status[0]:
            context = {"message": "Login Successful", "status": True,
                    "email": email, "password": password
                }
            request.path = "/candidate_dashboard/"
            template = "hire/candidate_dashboard.html"
        else:   
            context = {"message": "Invalid email or password", "status": False}
            template = "hire/cand-login.html"
        return context, template


def candidate_dashboard(request):
    return render(request, "hire/candidate_dashboard.html", {})

def candidate_profile(request):
    return render(request, "hire/candidate_profile.html", {})

@csrf_protect
def employee_login(request):
    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("pwd")
        query = f"select count(*) from employee_login where user_name = '{email}' and password = '{password}'"
        status = execute_query_fetchone(query)
        if status[0]:
            localStorage.setItem("email", email)
            localStorage.setItem("password", password)
            context = {"message": "Login Successful", "status": True,
                    "email": email, "password": password
                }
            request.path = "/employee_dashboard/"
            template = "hire/employee_dashboard.html"
        else:   
            context = {"message": "Invalid email or password", "status": False}
            template = "hire/emp-login.html"
        return context, template

def employee_dashboard(request):
    return render(request, "hire/employee_dashboard.html", {})

def employee_candidate(request, request_type, candidate_id):
    return  render(request, "hire/employee_candidate.html", {})
@csrf_protect
def recruiter_login(request):
    email = request.POST.get("email")
    password = request.POST.get("pwd")
    query = f"select count(*) from recruiter_login where user_name = '{email}' and password = '{password}'"
    status = execute_query_fetchone(query)
    if status[0]:
        context = {"message": "Login Successful", "status": True,
                "email": email, "password": password
            }
        request.path = "/recruiter_dashboard/"
        template = "hire/recruiter-dashboard.html"
    else:   
        context = {"message": "Invalid email or password", "status": False}
        template = "hire/rec-login.html"
    return context, template

def recruiter_dashboard(request):
    return render(request, "hire/recruiter-dashboard.html", {})

def recruiter_jobs(request):
    return render(request, "hire/recruiter-jobs.html", {})

def recruiter_candidates(request):
    return render(request, "hire/recruiter-candidates.html", {})

def recruiter_resumes(request):
    return render(request, "hire/recruiter-resumes.html", {})

def recruiter_profile(request):
    return render(request, "hire/recruiter-profile.html", {})

def index(request):
    context = {}
    return render(request, 'hire/index.html', context)

def login(request, login_type):
    context = {}
    if request.method == 'GET':
        if "candidate" in login_type:
            template_render = render(request, 'hire/cand-login.html', context)
        elif "employee" in login_type:
            template_render = render(request, 'hire/emp-login.html', context)
        elif "recruiter" in login_type:
            template_render = render(request, 'hire/rec-login.html', context)
    else:
        if "candidate" in login_type:
            context, template = candidate_login(request)
            template_render = render(request, template, context)
        elif "employee" in login_type:
            context, template = employee_login(request)
            template_render = render(request, template, context)
        elif "recruiter" in login_type:
            context, template = recruiter_login(request)
            template_render = render(request, template, context)

    return template_render

def job_posting(request):
    query = "insert into job_posting (name, requirements, description, created_date, modified_date) values %s" % ("adasd")
    values = ()
    # execute_query(query % values)
    return HttpResponse("Jobs has been inserted successfully")

def project_ermodel(request):
    return render(request, 'hire/project_er_model.html', {})

def project_report(request):
    return render(request, 'hire/project_report.html', {})