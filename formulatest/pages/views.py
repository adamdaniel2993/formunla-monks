#from django.shortcuts import render
from django.http import HttpResponse
import os


def home_page_view(request):
    imagenv = os.environ.get('IMAGENV', 'default')

    response_message = f"Hello, Formula Monks this is adan daniel test! I hope you like it, this is a new image triggered by azure devops, using group variables!!!, using {imagenv} image"
    return HttpResponse(response_message)
