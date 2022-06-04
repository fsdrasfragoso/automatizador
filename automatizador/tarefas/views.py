from asyncio import Task
from multiprocessing import context
from django.shortcuts import redirect, render
from django.http import HttpResponse
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
from .models import TaskGroups 
from .models import Tasks
from .models import LogTasks

def index(request):
    return redirect('task_groups')

def home(request):
    return render(request,'home.html')

def task_groups(request):
    taskGroups = TaskGroups.objects.all().prefetch_related('tasks_set')       
    context = {
        'taskGroups':taskGroups,
         'i':0
    }   
    return render(request,'taskGroups.html',context)

def tasks(request,task_group):
    tasks = Tasks.objects.filter(task_group=task_group) 
    nameTaskGroup = TaskGroups.objects.filter(id=task_group)
    context = {}      
    context['tasks'] = tasks
    context['nameTaskGroup'] = nameTaskGroup[0].name      
    return render(request,'tasks.html',context)

def log_tasks(request,task):
    log_tasks = LogTasks.objects.filter(task=task)
    task = Tasks.objects.filter(id=task)
    context = {}
    context['log_tasks'] = log_tasks
    context['idTaskGroup'] = task[0].task_group_id  
    return render(request,'logTasks.html',context)
        

@csrf_exempt
def updateStatusTask(request):
    taskInstance = Tasks.objects.filter(id=request.POST.get("idTask", ""))
    for t in taskInstance:
        t.previous_status = t.status
        t.status = 'success'
        t.update_date = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
        t.save()
    return HttpResponse(taskInstance[0].id)

@csrf_exempt
def updateStatusLogTask(request):
    taskInstance = LogTasks.objects.filter(id=request.POST.get("idTask", ""))
    for t in taskInstance:
        t.previous_status = t.status
        t.status = 'success'
        t.update_date = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
        t.save()
    return HttpResponse(taskInstance[0].id)

