# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class TaskGroups(models.Model):
    name = models.CharField(max_length=200)
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
    tesk_group = models.ForeignKey(TaskGroups, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tasks'
