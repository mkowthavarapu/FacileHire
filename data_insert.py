import json
import random
import mysql.connector

job_description = [
    "Intrinsicly enable optimal core competencies through corporate relationships. Phosfluorescently implement worldwide vortals and client-focused imperatives. Conveniently initiate virtual paradigms and top-line convergence.",
    'Progressively reconceptualize multifunctional "outside the box" thinking through inexpensive methods of empowerment. Compellingly morph extensive niche markets with mission-critical ideas. Phosfluorescently deliver bricks-and-clicks strategic theme areas rather than scalable benefits.',
    "Intrinsicly transform flexible manufactured products without excellent intellectual capital. Energistically evisculate orthogonal architectures through covalent action items. Assertively incentivize sticky platforms without synergistic materials.",
    "Globally re-engineer cross-media schemas through viral methods of empowerment. Proactively grow long-term high-impact human capital and highly efficient innovation. Intrinsicly iterate excellent e-tailers with timely e-markets."
    ]
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    db="facile_hire"
)
mycursor = mydb.cursor()
def populate_candidate_employee_recruitr():
    first_name_list = ['James', 'Robert', 'John', 'Michael', 'Mary', 'Patricia', 'Jennifer', 'Linda', 'Elizabeth', 'Joseph', 'Stephen', 'Pamela', 'Aaron', 'Heather', 'Frank', 'Andrea', 'Kyle', 'Martha', 'Austin', 'Sara', 'Ann', 'Cheryl', 'Ralph']
    middle_name_list = ['George', 'Joshua', 'Amanda', 'Deborah', 'Timothy', 'Jacob', 'Cynthia', 'Donna', 'Jeffrey', 'Samuel', 'Allen', 'Logan', 'Elijah', 'Lincoln', 'Jayden', 'Reyes', 'Edwards', 'Morgan', 'Richardson', 'Watson', 'Ruiz']
    last_name_list = ['Smith', 'Brown', 'Garcia', 'Miller', 'Wilson', 'Martin', 'Lee', 'Walker', 'Robinson', 'Ramirez', 'Green', 'Campbell', 'Carter', 'Rivera', 'Flores', 'Gomez', 'Cruz', 'Morris', 'Morales', 'Collins', 'Howard', 'Ward', 'Hughes']
    email_domains = ["@gmail.com", "@rediff.com", "@yahoo.com", "@outlook.com"]
    recruiter_list = ["Recruiter", "Senior Recruiter", "Staffing Specialist"]
    numbers = [1,2,3,4,5,6,7,8,9]
    for i in range(100):
        first_name = random.choice(first_name_list)
        middle_name = random.choice(middle_name_list)
        last_name = random.choice(last_name_list)
        mobile_number = "".join([str(random.choice(numbers)) for i in range(10)])
        email = "".join([first_name, last_name, random.choice(email_domains)])
        # candidate_info_query = "INSERT INTO recruiter (first_name, middle_name, last_name, mobile, email, designation) VALUES ('%s', '%s', '%s', '%s', '%s', '%s')"
        # mycursor.execute(candidate_info_query % (first_name, middle_name, last_name, int(mobile_number), email.lower(), random.choice(recruiter_list)))
        candidate_info_query = "INSERT INTO candidate (first_name, middle_name, last_name, mobile, email) VALUES ('%s', '%s', '%s', '%s', '%s')"
        mycursor.execute(candidate_info_query % (first_name, middle_name, last_name, int(mobile_number), email.lower()))
        mydb.commit()
    print(mycursor.rowcount, "record inserted.")
    #mydb.close()

def populate_colleges():
    query = 'insert into college (name) values ("%s")'
    with open("colleges.txt") as colleges_file:
        results = colleges_file.readlines()
        for result in results:
            mycursor.execute(query % (result.strip()))

def populate_companies_clients():
    query1 = 'insert into company (name) values (%s)'
    query2 = 'insert into clients (clients_id, name) values (%s, %s)'
    with open("companies.csv", encoding="utf-8") as companies_file:
        results = companies_file.readlines()
        count = 0
        print(len(results))
        for result in results[1:]:
            count += 1
            details = result.split(",")
            if details[1].strip():
            # import pdb;pdb.set_trace()
                try:
                    mycursor.execute(query1 % details[1].strip())
                    mycursor.execute(query2 % (count, details[1].strip()))
                    mydb.commit()
                except:
                    import pdb; pdb.set_trace()
            
def populate_location():
    query = 'insert into location (city, state, country) values ("%s", "%s", "%s")'
    with open("locations.json", encoding="utf-8") as locations_file:
        results = json.loads(locations_file.read())
        for result in results:
            country = result["name"]
            if country.lower() == "united states":
                for states in result["states"]:
                    state = states["name"]
                    for cities in states["cities"]:
                        city = cities["name"]
                        mycursor.execute(query % (city, state, country))
                        mydb.commit()

def populate_recruiter_candidate_employee_login():
    # query = "select recruiter_id, email from recruiter"
    # mycursor.execute(query)
    # results = mycursor.fetchall()
    # for result in results[1:]:
    #     insert_query = "insert into recruiter_login (user_name, password, recruiter_id) values ('%s', '%s', %s)"
    #     mycursor.execute(insert_query % (result[1], result[1].split("@")[0] + "123", result[0]))

    # query = "select employee_id, email from employee"
    # mycursor.execute(query)
    # results = mycursor.fetchall()
    # for result in results[1:]:
    #     insert_query = "insert into employee_login (user_name, password, employee_id) values ('%s', '%s', %s)"
    #     mycursor.execute(insert_query % (result[1], result[1].split("@")[0] + "123", result[0]))

    query = "select candidate_id, email from candidate"
    mycursor.execute(query)
    results = mycursor.fetchall()
    for result in results[1:]:
        insert_query = "insert into candidate_login (user_name, password, candidate_id) values ('%s', '%s', %s)"
        mycursor.execute(insert_query % (result[1], result[1].split("@")[0] + "123", result[0]))

def populate_recruiter_candidate():
    insert_query = "insert into recruiter_candidate (recruiter_id, candidate_id) values (%s, %s)"

def update_skills():
    with open("skills.txt") as skills_file:
        skills = skills_file.readlines()

    query = 'select candidate_id from candidate'
    mycursor.execute(query)
    results = mycursor.fetchall()
    for result in results:
        skills = random.sample(skills, 10)
        query = "update candidate set skills='%s' where candidate_id=%s"
        # import pdb; pdb.set_trace()
        mycursor.execute(query % (",".join([i.strip() for i in skills]), result[0]))

def populate_designation():
    with open("designations") as designation_file:
        results = designation_file.readlines()
    
    query = "insert into designation (designation_id, title, grade) values(%s, '%s', '%s')"
    count = 0
    for result in results:
        count += 1
        mycursor.execute(query % (count, result, random.randint(1, 5)))

def populate_candidate_designation():
    query = "select employee_id from employee"
    mycursor.execute(query)
    results = mycursor.fetchall()
    for result in results:
        query = "insert into employee_designation (employee_id, designation_id) values ('%s', '%s')"
        mycursor.execute(query % (result[0], random.randint(1,30)))

# populate_candidate_employee_recruitr() 
# populate_colleges()
# populate_companies_clients()
# populate_location()
# populate_recruiter_candidate_employee_login()
# populate_recruiter_candidate()
# update_skills()
# populate_designation()
# populate_candidate_designation()
mydb.commit()
