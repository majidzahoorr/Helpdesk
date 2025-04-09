from django.urls import path
from . import views

urlpatterns = [
    path('', views.index_view, name='index_page'),
    path('blogs/', views.blogs_view, name='blogs_page'),
]