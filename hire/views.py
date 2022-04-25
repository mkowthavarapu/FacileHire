import random
from django.shortcuts import render
from django.shortcuts import redirect
import mysql.connector
from django.template import loader
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import redirect
from localStoragePy import localStoragePy
from django.core.files.storage import FileSystemStorage


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
    connection.commit()
    connection.close()    

@csrf_protect
def candidate_login(request):
    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("pwd")
        query = f"select candidate_id, user_name, password from candidate_login where user_name = '{email}' and password = '{password}'"
        result = execute_query_fetchone(query)
        if result[0]:
            localStorage.setItem("candidate_id", result[0])
            localStorage.setItem("candidate_email", email)
            localStorage.setItem("candidate_password", password)
            context = {"message": "Login Successful", "status": True,
                    "email": email, "password": password
                }
            template = "hire/candidate_dashboard.html"
            login_status = True
        else:   
            context = {"message": "Invalid email or password", "status": False}
            template = "hire/cand-login.html"
            login_status = False
        return context, template


def candidate_dashboard(request):
    candidate_id = localStorage.getItem("candidate_id")
    context = {}
    query = "select j.job_id, name, requirements, description, roles, location_id, recruiter_id from job j, candidate_job cj where j.job_id = cj.job_id and cj.candidate_id = %s" % candidate_id
    result = execute_query_fetchone(query)
    recruiter_id = result[6]
    location_id = result[5]
    context["job_id"] = result[0]
    context["name"] = result[1]
    context["requirements"] = result[2]
    context["description"] = result[3]
    context["roles"] = result[4]
    query = "select state, country from location where location_id=%s" % location_id
    result = execute_query_fetchone(query)
    context["location"] = " ".join([result[0], result[1]])
    query = "select ifnull(first_name, ''), ifnull(middle_name, ''), ifnull(last_name, ''), email, mobile from recruiter where recruiter_id=%s" % recruiter_id
    result = execute_query_fetchone(query)
    context["recruiter_name"] = " ".join([result[0], result[1], result[2]])
    context["recruiter_email"] = result[3]
    context["recruiter_mobile"] = result[4]
    context["candidate_id"] = candidate_id
    return render(request, "hire/candidate_dashboard.html", context)

def candidate_profile(request):
    return render(request, "hire/candidate_profile.html", {})

@csrf_protect
def employee_login(request):
    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("pwd")
        query = f"select employee_login_id, employee_id, user_name, password from employee_login where user_name = '{email}' and password = '{password}'"
        result = execute_query_fetchone(query)
        if result[0]:
            localStorage.setItem("employee_id", result[1])
            localStorage.setItem("employee_email", email)
            localStorage.setItem("employee_password", password)
            context = {"message": "Login Successful", "status": True,
                    "email": email, "password": password, "employee_id": result[1]
                }
            login_status = True
            template = "hire/employee_dashboard.html"
        else:   
            context = {"message": "Invalid email or password", "status": False}
            template = "hire/emp-login.html"
            login_status = False
        return login_status, template

def employee_dashboard(request):
    context = {}
    is_login = check_login(request, "employee_id")
    if not is_login:
        context["message"] = "Please login"
        return render(request, 'hire/index.html', context)

    query = "select c.candidate_id, ifnull(c.first_name, ''), ifnull(c.middle_name, ''), ifnull(c.last_name, ''), c.email, c.mobile, c.skills from employee_candidate as ec, candidate as c where c.candidate_id = ec.candidate_id and employee_id = %s"
    results = execute_query_fetchall(query % localStorage.getItem("employee_id"))
    context = {"candidates": []}
    for result in results:
        _id, first_name, middle_name, last_name, email, mobile, skills = result
        candidate_name = " ".join([first_name, middle_name, last_name])
        context["candidates"].append({"name": candidate_name, "email": email, "mobile": mobile, "skills": skills, "id": _id})

    return render(request, "hire/employee_dashboard.html", context)

def employee_candidate(request, candidate_id):
    if request.method == "POST":
        import pdb; pdb.set_trace()
        return

    context = {}
    is_login = check_login(request, "employee_id")
    if not is_login:
        context["message"] = "Please login"
        return render(request, 'hire/index.html', context)

    query = "select ifnull(first_name, ''), ifnull(middle_name, ''), ifnull(last_name, ''), skills, mobile, email from candidate where candidate_id = '%s'"
    result = execute_query_fetchone(query % candidate_id)
    context["name"] = " ".join([result[0], result[1], result[2]])
    context["skills"] = result[3]
    context["mobile"] = result[4]
    context["email"] = result[5]
    query = "select title from designation d, candidate_designation cd where cd.candidate_id = '%s' and cd.designation_id = d.designation_id"
    result = execute_query_fetchone(query % candidate_id)
    context["designation"] = result[0]
    context["candidate_id"] = candidate_id
    return  render(request, "hire/employee_candidate.html", context=context)

def recruiter_login(request):
    email = request.POST.get("email")
    password = request.POST.get("pwd")
    query = f"select recuriter_login_id, user_name, password, recruiter_id from recruiter_login where user_name = '{email}' and password = '{password}'"
    result = execute_query_fetchone(query)
    if result[0]:
        localStorage.setItem("recruiter_email", result[1])
        localStorage.setItem("password", result[2])
        localStorage.setItem("recruiter_id", result[3])
        login_status = True
        template = "hire/recruiter-dashboard.html"
    else:   
        login_status = False
        template = "hire/rec-login.html"
    return login_status, template

def recruiter_dashboard(request):
    context = {}
    is_login = check_login(request, "recruiter_id")
    if not is_login:
        context["message"] = "Please login"
        return render(request, 'hire/index.html', context)
    query = "select count(*) from resume where recruiter_id = %s" % localStorage.getItem("recruiter_id")
    result = execute_query_fetchone(query)
    context["resumes_count"] = result[0]
    query = "select count(*) from job where recruiter_id = %s and status ='open'" % localStorage.getItem("recruiter_id")
    result = execute_query_fetchone(query)
    context["jobs_count"] = result[0]
    query = "select count(*) from recruiter_candidate where recruiter_id = %s" % localStorage.getItem("recruiter_id")
    result = execute_query_fetchone(query)
    context["candidates_count"] = result[0]

    return render(request, "hire/recruiter-dashboard.html", context)

def recruiter_jobs(request):
    context = {"jobs": []}
    is_login = check_login(request, "recruiter_id")
    if not is_login:
        context["message"] = "Please login"
        return render(request, 'hire/index.html', context)

    query = "select job_id, name, status, created_date, modified_date, roles, requirements, description from job where recruiter_id = %s"
    results = execute_query_fetchall(query % localStorage.getItem("recruiter_id"))
    for result in results:
        context["jobs"].append({"job_id": result[0], "name": result[1], "status": result[2], "created_date": result[3], "modified_date": result[4], "roles": result[5], "requirements": result[6], "description": result[7]})

    return render(request, "hire/recruiter-jobs.html", context=context)

def recruiter_candidates(request):
    context = {}
    is_login = check_login(request, "recruiter_id")
    if not is_login:
        context["message"] = "Please login"
        return render(request, 'hire/index.html', context)
    query = "select c.candidate_id, c.first_name, c.middle_name, c.last_name, c.email, c.mobile, c.skills from recruiter_candidate as rc, candidate as c where c.candidate_id = rc.candidate_id and recruiter_id = %s"
    results = execute_query_fetchall(query % localStorage.getItem("recruiter_id"))
    context = {"candidates": []}
    for result in results:
        _id, first_name, middle_name, last_name, email, mobile, skills = result
        candidate_name = " ".join([first_name, middle_name, last_name])
        context["candidates"].append({"name": candidate_name, "email": email, "mobile": mobile, "skills": skills, "id": _id})
    return render(request, "hire/recruiter-candidates.html", context)

def recruiter_resumes(request):
    context = {}
    is_login = check_login(request, "recruiter_id")
    if not is_login:
        context["message"] = "Please login"
        return render(request, 'hire/index.html', context)
    if request.method == "POST":
        query = "select max(resume_id) from resume"
        result = execute_query_fetchone(query)
        query = 'insert into resume (resume_id, name, file_path, recruiter_id) values (%s, "%s", "%s", "%s")'
        fs = FileSystemStorage()
        resumes = request.FILES.getlist("resumes")
        recruiter_id = localStorage.getItem("recruiter_id")
        for resume in resumes:
            filename = fs.save(resume.name, resume)
            uploaded_file_url = fs.url(filename)
            count = result[0] + 1 if result[0] else 0
            execute_query(query % (count, filename, uploaded_file_url, recruiter_id))
        context["message"] = "Files Uploaded Successfully"
    return render(request, "hire/recruiter-resumes.html", context)

def recruiter_profile(request):
    context = {}
    is_login = check_login(request, "recruiter_id")
    if not is_login:
        context["message"] = "Please login"
        return render(request, 'hire/index.html', context)

    query = "select ifnull(first_name, ''), ifnull(middle_name, ''), ifnull(last_name,''), designation, email, c.name, cl.name, state, country, mobile from recruiter as r, recruiter_clients as rc, recruiter_company as rco, company as c, clients cl, location l, recruiter_location rl where r.recruiter_id = rc.recruiter_id and r.recruiter_id = rco.recruiter_id and rc.clients_id = cl.clients_id and rco.company_id = c.company_id and rl.location_id = l.location_id and r.recruiter_id = %s;" % localStorage.getItem("recruiter_id")
    result = execute_query_fetchone(query)
    print(result)
    context["name"] = " ".join([result[0], result[1], result[2]])
    context["designation"] = result[3]
    context["email"] = result[4]
    context["company"] = result[5]
    context["client"] = result[6]
    context["location"] = ", ".join([result[7], result[8]]) 
    context["mobile"] = result[9]
    context["skype"] = result[4].split("@")[0]
    context["age"] = random.randint(25, 40)

    return render(request, "hire/recruiter-profile.html", context=context)
    
def recruiter_candidate_profile(request, candidate_id):
    if request.method == "POST":
        import pdb; pdb.set_trace()
        return

    context = {}
    is_login = check_login(request, "recruiter_id")
    if not is_login:
        context["message"] = "Please login"
        return render(request, 'hire/index.html', context)
    query = "select ifnull(first_name, ''), ifnull(middle_name, ''), ifnull(last_name, ''), skills, mobile, email from candidate where candidate_id = '%s'"
    result = execute_query_fetchone(query % candidate_id)
    context["name"] = " ".join([result[0], result[1], result[2]])
    context["skills"] = result[3]
    context["mobile"] = result[4]
    context["email"] = result[5]
    query = "select title from designation d, candidate_designation cd where cd.candidate_id = '%s' and cd.designation_id = d.designation_id"
    result = execute_query_fetchone(query % candidate_id)
    context["designation"] = result[0]
    context["candidate_id"] = candidate_id
    query = "select "
    return  render(request, "hire/recruiter_candidate_profile.html", context=context)
    

def index(request):
    context = {}
    localStorage.clear()
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
            login_status, template = candidate_login(request)
            if login_status:
                return redirect('/candidate_dashboard/')
            else:
                template_render = render(request, 'hire/cand-login.html', context)
        elif "employee" in login_type:
            login_status, template = employee_login(request)
            if login_status:
                return redirect('/employee_dashboard/')
            else:
                template_render = render(request, 'hire/emp-login.html', context)
        elif "recruiter" in login_type:
            login_status, template = recruiter_login(request)
            if login_status:
                return redirect('/recruiter_dashboard/')
            else:
                template_render = render(request, 'hire/rec-login.html', context)

    return template_render

def project_ermodel(request):
    return render(request, 'hire/project_er_model.html', {})

def project_report(request):
    return render(request, 'hire/project_report.html', {})

def post_job(request):
    locations = []
    query = "select distinct state, country from location"
    results = execute_query_fetchall(query)
    for result in results:
        location = ", ".join(result)
        locations.append(location)

    if request.method == "GET":
        message = ""
        context = {"locations": locations, "message": message}

    elif request.method == "POST":
        query = "insert into job (name, location_id, requirements, roles, description, recruiter_id) values %s"
        title = request.POST.get("title")
        location = request.POST.get("location")
        location_id = get_location_id(location)
        requirements = request.POST.get("requirements")
        roles = request.POST.get("roles")
        description = request.POST.get("description")
        values = (title, location_id, requirements, roles, description, localStorage.getItem("recruiter_id"))
        connection, cursor = get_mysql_connection()
        cursor.execute(query % str(values))
        connection.commit()
        connection.close()
        message = "Job Posted Successfully"
        context = {"message": message, "locations": locations}
    return render(request, "hire/post_job.html", context=context)

def check_login(request, key):
    if (localStorage.getItem(key) is None) or localStorage.getItem(key).isdigit() and not int(localStorage.getItem(key)):
        return False
    return True

def get_location_id(location):
    state, country = location.split(",")
    query = "select location_id from location where state='%s' and country='%s'" % (state.strip(), country.strip())
    result = execute_query_fetchone(query)
    return result[0]

def recruiter_detail_job(request, job_id):
    context = {}
    query = "SELECT job_id, name, requirements, description, roles, created_date, location_id FROM job where job_id = %s" % job_id
    result = execute_query_fetchone(query)
    context["job_id"] = result[0]
    context["name"] = result[1]
    context["requirements"] = result[2]
    context["description"] = result[3]
    context["roles"] = result[4]
    context["created_date"] = result[5]
    location_id = result[6]
    query = "select state, country from location where location_id = %s" % location_id
    result = execute_query_fetchone(query)
    context["location"] = ", ".join([result[0], result[1]])
    return render(request, "hire/recruiter_detail_job.html", context=context)

def candidate_profile_view(request, candidate_id):
    context = {}
    query = "SELECT c.candidate_id, ifnull(first_name, ''), ifnull(middle_name, ''), ifnull(last_name, ''), email, mobile, skills, e.degree, e.year_passed_out, e.cgpa, co.name, d.title, concat(l.state, ', ', l.country) as location, e.course from candidate c, candidate_education ce, education e, college co, candidate_designation cd, designation d, location l where c.candidate_id = ce.candidate_id and ce.education_id = e.education_id and e.college_id = co.college_id and cd.candidate_id = c.candidate_id and cd.designation_id = d.designation_id and e.location_id = l.location_id and c.candidate_id = %s" % candidate_id
    results = execute_query_fetchall(query)
    for result in results:
        context["candidate_id"] = result[0]
        context["name"] = " ".join([result[1], result[2], result[3]])
        context["email"] = result[4]
        context["mobile"] = result[5]
        context["skills"] =  result[6]
        context["designation"] =  result[11]
        if "educations" not in context:
            context["educations"] = []
        context["educations"].append({
            "degree": result[7], "year_passed_out": result[8],
            "cgpa": result[9], "name": result[10], "location": result[12],
            "course": result[13]
            })

    query = " select c.name, e.from_date, e.to_date, e.description, d.title, concat(l.state, ', ', l.country) as location from experience e, candidate_experience ce, company c, designation d, location l where ce.candidate_experience_id = e.experience_id and e.company_id = c.company_id and e.designation_id = d.designation_id and l.location_id = e.location_id and ce.candidate_id = %s" % candidate_id
    results = execute_query_fetchall(query)
    for result in results:
        if "experiences" not in context:
            context["experiences"] = []
        context["experiences"].append(
            {
                "name": result[0],
                "from_date": result[1],
                "to_date": result[2],
                "description": result[3],
                "designation": result[4],
                "location": result[5]
            }
        )
    query = "select c.name from candidate_certifications cc, certifications c where c.certification_id = cc.certification_id and cc.candidate_id = %s" % candidate_id
    results = execute_query_fetchall(query)
    for result in results:
        if "certifications" not in context:
            context["certifications"] = []
        context["certifications"].append(result[0])
    return render(request, "hire/candidate_profile_view.html", context=context)