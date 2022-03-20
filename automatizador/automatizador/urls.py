from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('ta/', include('tarefas.urls')),
    path('admin/', admin.site.urls),
]