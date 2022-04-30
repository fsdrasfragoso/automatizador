from asyncio import Task
from multiprocessing import context
from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from .models import TaskGroups 
from .models import Tasks

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def home(request):
    return render(request,'home.html')

def task_groups(request):
    taskGroups = TaskGroups.objects.all().prefetch_related('tasks_set')       
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

@csrf_exempt
def updateStatusTask(request):
    taskInstance = Tasks.objects.filter(id=request.POST.get("idTask", ""))
    for t in taskInstance:
        t.status = request.POST.get("statusTask", "")
        t.save()
    return HttpResponse(taskInstance[0].id)
