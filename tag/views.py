import django_filters
from rest_framework import viewsets
from .serializers import TagSerializer
from .models import Tag


# Create your views here.
class TagView(viewsets.ModelViewSet):
    serializer_class = TagSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = ('__all__')
