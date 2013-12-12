from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    
    # render index
    url(r'^$', 'djangoproject.views.index', name='index'),
    # render arbitrary template
    url(r'^markup/(?P<page_name>\w+)$', 'djangoproject.views.markup', name='markup'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
