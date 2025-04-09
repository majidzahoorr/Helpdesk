from django.shortcuts import render

from django.http import HttpResponse

# create a function
def index_view(request):
    return render(request, "base.html")

def blogs_view(request):
    return render(request, "blogs.html")
