from django import forms
from .models import Question

class QuestionModelForm(forms.ModelForm):
    class Meta:
        model = Question
        fields = ['question_text']  # Liste des champs du modèle à inclure dans le formulaire

    choix1 = forms.CharField(max_length=200, label="Choix 1", required=True)
    choix2 = forms.CharField(max_length=200, label="Choix 2", required=False)
    choix3 = forms.CharField(max_length=200, label="Choix 3", required=False)
    choix4 = forms.CharField(max_length=200, label="Choix 4", required=False)
    choix5 = forms.CharField(max_length=200, label="Choix 5", required=False)