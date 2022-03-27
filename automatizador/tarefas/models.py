from django.db import models

# Create your models here.

class TaskGroups(models.Model):
    name = models.CharField(max_length=200)
    r = models.IntegerField(blank=True, null=True)
    g = models.IntegerField(blank=True, null=True)
    b = models.IntegerField(blank=True, null=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'task_groups'


class Tasks(models.Model):
    name = models.CharField(max_length=200)
    status = models.CharField(max_length=7, blank=True, null=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    previous_status = models.CharField(max_length=10, blank=True, null=True)
    task_group = models.ForeignKey(TaskGroups, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tasks'