from django.contrib import admin

from .models import TaskGroups, Tasks, LogTasks

class TaskGroupsAdmin(admin.ModelAdmin):
    list_display = ("id","name","creation_date", "update_date")

class TasksAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "status", "previous_status", "task_group", "creation_date", "update_date")
    
class LogTasksAdmin(admin.ModelAdmin):
    list_display = ("id", "task", "status", "previous_status", "creation_date", "update_date")

admin.site.register(TaskGroups, TaskGroupsAdmin)
admin.site.register(Tasks, TasksAdmin)
admin.site.register(LogTasks,LogTasksAdmin)