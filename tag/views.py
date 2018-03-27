import django_filters
from rest_framework import viewsets
from .serializers import TagSerializer, TagGroupSerializer, NoteSerializer, NoteTextSerializer
from .models import Tag, TagGroup, Note, NoteText

# Create your views here.
class TagView(viewsets.ModelViewSet):
    serializer_class = TagSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = '__all__'
    queryset = Tag.objects.all()


class TagGroupView(viewsets.ModelViewSet):
    serializer_class = TagGroupSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = '__all__'
    queryset = TagGroup.objects.all()

class NoteView(viewsets.ModelViewSet):
    serializer_class = NoteSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = '__all__'
    queryset = Note.objects.all()

class NoteTextView(viewsets.ModelViewSet):
    serializer_class = NoteTextSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = '__all__'
    queryset = NoteText.objects.all()