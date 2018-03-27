from django.conf.urls import url
from . import views

urlpatterns = [
    url('^tag/', views.TagView.as_view({'get': 'list', 'post': 'create'})),
    url('^tag_group/', views.TagView.as_view({'get': 'list', 'post': 'create'})),
    url('^note/', views.TagView.as_view({'get': 'list', 'post': 'create'})),
]