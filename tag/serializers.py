from rest_framework import serializers
from .models import Tag, TagGroup, Note, NoteText


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = '__all__'


class TagGroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = TagGroup
        fields = '__all__'


class NoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Note
        fields = '__all__'


class NoteTextSerializer(serializers.ModelSerializer):
    class Meta:
        model = NoteText
        fields = '__all__'
