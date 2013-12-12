from django.shortcuts import render


def markup(request, page_name='index'):
    return render(request, page_name + '.html')


def index(request):
    return render(request, 'index.html')
