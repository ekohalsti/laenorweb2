import django_filters
from rest_framework import viewsets
from .serializers import TagSerializer, TagGroupSerializer, NoteSerializer, NoteTextSerializer


# Create your views here.
class TagView(viewsets.ModelViewSet):
    serializer_class = TagSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = '__all__'


class TagGroupView(viewsets.ModelViewSet):
    serializer_class = TagGroupSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = '__all__'


class NoteView(viewsets.ModelViewSet):
    serializer_class = NoteSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = '__all__'


class NoteTextView(viewsets.ModelViewSet):
    serializer_class = NoteTextSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = '__all__'
