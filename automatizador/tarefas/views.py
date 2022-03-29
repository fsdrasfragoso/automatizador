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

def tasks(request,task_group):
    tasks = Tasks.objects.filter(task_group=task_group) 
    nameTaskGroup = TaskGroups.objects.filter(id=task_group)
    context = {}      
    context['tasks'] = tasks
    context['nameTaskGroup'] = nameTaskGroup[0].name      
    return render(request,'tasks.html',context)

def updateStatusTask(request):
    return HttpResponse("Funcionou")
