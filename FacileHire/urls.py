"""FacileHire URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from hire import views

urlpatterns = [
    path('', views.index, name="index"),
    path('login/<str:login_type>/', views.login, name="login"),
    path('post_job/', views.job_posting, name="post_job"),
    path('admin/', admin.site.urls),
    path('candidate_dashboard/', views.candidate_dashboard, name="candidate dashboard"),
    path('candidate_profile/', views.candidate_profile, name="candidate dashboard"),
    path('employee_dashboard/', views.employee_dashboard, name="employee dashboard"),
    path('recruiter_dashboard/', views.recruiter_dashboard, name="recruiter dashboard"),
    path('recruiter_jobs/', views.recruiter_jobs, name="recruiter jobs"),
    path('recruiter_candidates/', views.recruiter_candidates, name="recruiter candidates"),
    path('recruiter_resumes/', views.recruiter_resumes, name="recruiter resumes"),
    path('recruiter_profile/', views.recruiter_profile, name="recruiter profile"),
    path('<str:request_type>/candidate/<int:candidate_id>', views.employee_candidate, name="Employee Candidate Status"),
    path('project_er_model/', views.project_ermodel, name="Project ER model"),
    path('project_report/', views.project_report, name="Project Report"),
]
