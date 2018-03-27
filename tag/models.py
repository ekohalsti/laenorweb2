from django.db import models


# Create your models here.
class TagGroup(models.Model):
    name = models.TextField()


class Tag(models.Model):
    name = models.TextField()
    group = models.ForeignKey(TagGroup)


class Note(models.Model):
    tags = models.ManyToManyField(Tag)


class NoteText(models.Model):
    note = models.ForeignKey(Note)
    text = models.TextField()
