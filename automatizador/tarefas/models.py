from django.db import models

# Create your models here.

class TaskGroups(models.Model):
    name = models.CharField(max_length=200)
    r = models.IntegerField(blank=True, null=True)
    g = models.IntegerField(blank=True, null=True)
    b = models.IntegerField(blank=True, null=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    
    def __str__(self):
        return "%s"%(self.name)
    class Meta:
        managed = True
        db_table = 'task_groups'


class Tasks(models.Model):
    name = models.CharField(max_length=200)
    status = models.CharField(max_length=7, blank=True, null=True)
    frequency = models.CharField(max_length=7, blank=True, null=True)
    time_unit_of_execution_frequency = models.IntegerField(blank=True, null=True)
    unit_of_time_to_trigger_error = models.IntegerField(blank=True, null=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    previous_status = models.CharField(max_length=10, blank=True, null=True)
    task_group = models.ForeignKey(TaskGroups, models.DO_NOTHING)
    
    def __str__(self):
        return "%s"%(self.name)
    class Meta:
        managed = True
        db_table = 'tasks'

class LogTasks(models.Model):
    task = models.ForeignKey('Tasks', models.DO_NOTHING)
    name = models.CharField(max_length=200)
    status = models.CharField(max_length=7, blank=True, null=True)
    frequency = models.CharField(max_length=7, blank=True, null=True)
    time_unit_of_execution_frequency = models.IntegerField(blank=True, null=True)
    unit_of_time_to_trigger_error = models.IntegerField(blank=True, null=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)
    previous_status = models.CharField(max_length=10, blank=True, null=True)
    
    def __str__(self):
        return "%s"%(self.name)
    class Meta:
        managed = True
        db_table = 'log_tasks'
