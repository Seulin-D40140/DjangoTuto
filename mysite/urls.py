from django.contrib import admin
from django.urls import include, path
from acces import views

urlpatterns = [
    path("", views.home, name="home"),
    path("polls/", include("polls.urls")),
    path("admin/", admin.site.urls),
    path("accounts/", include("django.contrib.auth.urls")),
]
