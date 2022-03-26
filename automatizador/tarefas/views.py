from asyncio import Task
from multiprocessing import context
from django.shortcuts import render
from django.http import HttpResponse

from .models import TaskGroups 
from .models import Tasks

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def home(request):
    return render(request,'home.html')

def task_groups(request):
    taskGroups = TaskGroups.objects.all()
    context = {
        'taskGroups':taskGroups
    }   
    return render(request,'taskGroups.html',context)
