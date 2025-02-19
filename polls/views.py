from django.http import HttpResponseRedirect
from django.http import HttpResponse
from django.shortcuts import get_object_or_404, render
from django.db.models import Count
from django.db.models import Sum
from django.urls import reverse
from django.views import generic
from django.shortcuts import render, redirect
from django.utils import timezone
from django.contrib import messages

from .models import Choice, Question


class IndexView(generic.ListView):
    template_name = "polls/index.html"
    context_object_name = "latest_question_list"

    def get_queryset(self):
        """Return the last five published questions."""
        return Question.objects.order_by("-pub_date")[:5]



class DetailView(generic.DetailView):
    model = Question
    template_name = "polls/detail.html"


class ResultsView(generic.DetailView):
    model = Question
    template_name = "polls/results.html"

class AllView(generic.ListView):
    template_name = 'polls/all.html'
    context_object_name = 'Question'

    def get_queryset(self):
        return Question.objects.all()

class FrequencyView(generic.DetailView):
    model = Question
    context_object_name = 'Question'
    template_name = "polls/frequency.html"

class StatsView(generic.ListView):
    template_name = 'polls/stats.html'
    context_object_name = 'Question'
    model = 'Choice'

    def get_queryset(self):
        return Question.objects.all()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['total_choices'] = Question.objects.aggregate(total=Count('choice'))['total'] or 0
        context['total_votes'] = Choice.objects.aggregate(total=Sum('votes'))['total'] or 0
        return context

class QuestionListView(generic.ListView):
    """Affichage de la liste des questions"""
    model = Question
    template_name = "polls/index.html"
    context_object_name = "questions"

def ajouter_question(request):
    """Gestion du formulaire d'ajout d'une question"""
    if request.method == "POST":
        question_texte = request.POST.get("question", "").strip()
        choix1 = request.POST.get("choix1", "").strip()
        choix2 = request.POST.get("choix2", "").strip()
        choix3 = request.POST.get("choix3", "").strip()

        # Vérifier que les champs obligatoires sont remplis
        if not question_texte or not choix1 or not choix2:
            messages.error(request, "La question et au moins deux choix sont obligatoires.")
            return render(request, "polls/form.html")  # Retourner le formulaire avec un message d'erreur

        # Création de la question
        question = Question.objects.create(
            question_text=question_texte,
            pub_date=timezone.now()  # Ajout de la date et de l'heure actuelles
        )

        # Création des choix
        Choice.objects.create(question=question, choice_text=choix1)
        Choice.objects.create(question=question, choice_text=choix2)
        if choix3:
            Choice.objects.create(question=question, choice_text=choix3)

        messages.success(request, "Question ajoutée avec succès !")
        return redirect("polls:index")  # Rediriger vers la liste des questions

    return render(request, "polls/form.html")  # Affichage du formulaire
    # Affichage du formulaire



def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)

def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST["choice"])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(
            request,
            "polls/detail.html",
            {
                "question": question,
                "error_message": "You didn't select a choice.",
            },
        )
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse("polls:results", args=(question.id,)))