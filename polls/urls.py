from django.urls import path
from .views import ajouter_question
from django.contrib.auth import views as auth_views

from . import views

app_name = "polls"
urlpatterns = [
    path("", views.IndexView.as_view(), name="index"),
    path("accounts/login/", auth_views.LoginView.as_view(), name="login"),
    path("all/", views.AllView.as_view(), name="all"),
    path("form/", ajouter_question, name="form"),
    path("stats/", views.StatsView.as_view(), name="stats"),
    path("<int:pk>/", views.DetailView.as_view(), name="detail"),
    path("<int:pk>/results/", views.ResultsView.as_view(), name="results"),
    path("<int:question_id>/vote/", views.vote, name="vote"),
    path("<int:pk>/frequency/", views.FrequencyView.as_view(), name="frequency"),

]