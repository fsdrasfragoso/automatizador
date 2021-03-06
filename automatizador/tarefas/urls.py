from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('home/',views.home,name="home"),
    path('taskGroups/',views.task_groups,name="task_groups"),
    path('tasks/(?P<task_group>\d+)',views.tasks,name="tasks"),
    path('updateStatusTask/',views.updateStatusTask,name="update_status_task"),
    path('updateStatusLogTask/',views.updateStatusLogTask,name="update_status_log_task"),
    path('log_tasks/(?P<task>\d+)',views.log_tasks,name="log_tasks"),
]