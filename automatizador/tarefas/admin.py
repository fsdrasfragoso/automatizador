from django.contrib import admin

from .models import TaskGroups, Tasks

admin.site.register(TaskGroups)
admin.site.register(Tasks)