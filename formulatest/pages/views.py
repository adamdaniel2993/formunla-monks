#from django.shortcuts import render
from django.http import HttpResponse


def home_page_view(request):
    return HttpResponse("Hello, Formula Monks this is adan daniel test! I hope you like it")

# Create your views here.
