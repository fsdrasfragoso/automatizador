from django import forms

from .models import TaskGroups, Tasks

from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class FormTaskGroups(forms.ModelForm):
    class Meta:
        model = TaskGroups
        fields = '__all__'