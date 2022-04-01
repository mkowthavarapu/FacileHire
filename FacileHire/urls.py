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
    path('candidate_login/', views.login, name="candidate login"),
    path('employee_login/', views.login, name="employee login"),
    path('recruiter_login/', views.login, name="recruiter login"),
    path('post_job/', views.job_posting, name="post_job"),
    path('admin/', admin.site.urls),
    path('candidate_dashboard/', views.candidate_dashboard, name="candidate dashboard"),
    path('employee_dashboard/', views.employee_dashboard, name="employee dashboard"),
    path('recruiter_dashboard/', views.recruiter_dashboard, name="recruiter dashboard"),
]
