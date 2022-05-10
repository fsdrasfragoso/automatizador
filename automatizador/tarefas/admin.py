from django.contrib import admin

from .models import TaskGroups, Tasks, LogTasks

admin.site.register(TaskGroups)
admin.site.register(Tasks)
admin.site.register(LogTasks)