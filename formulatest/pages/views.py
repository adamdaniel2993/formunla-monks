#from django.shortcuts import render
from django.http import HttpResponse


def home_page_view(request):
    return HttpResponse("Hello, Formula Monks this is adan daniel test! I hope you like it, this is a new image trigger by azure devops")

# Create your views here.
