import datetime
from django.db.models import Sum
from django.contrib import admin
from django.db import models
from django.utils import timezone
from django import forms
from django.contrib.auth.models import AbstractUser , Group, Permission

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date published")
    MAX_LENGTH = 20

    def __str__(self):
        return self.question_text

    @admin.display(
        boolean=True,
        ordering="pub_date",
        description="Published recently?",
    )
    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

    def age(self):
        return timezone.now() - self.pub_date

    def text_excerpt(text, max_length):
        return text[:max_length] + ('...' if len(text) > max_length
                                    else '')

    def get_choices(self):
        resultat = self.choice_set.aggregate(total=Sum('votes'))
        total = resultat['total'] or 0  # Assure-toi que total n'est pas None

        if total == 0:
            # Si total est 0, attribue un pourcentage de 0 pour chaque choix
            return [(c.choice_text, c.votes, 0) for c in self.choice_set.all()]

        # Si total > 0, calcule le pourcentage normalement
        return [(c.choice_text, c.votes, (c.votes / total) * 100) for c in self.choice_set.all()]

    def get_total_choices(cls):
        return cls.objects.aggregate(total=Count('choice'))['total'] or 0

    def get_max_choice(self):
        choices = self.choice_set.all()
        resultat = self.choice_set.aggregate(total=Sum('votes'))
        total = resultat['total']
        max_choice = max(choices, key=lambda c: c.votes / total)
        return (max_choice.choice_text, max_choice.votes / total)





class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
    MAX_LENGTH = 20

    def __str__(self):
        return self.choice_text

    def text_excerpt(text, max_length):
        return text[:max_length] + ('...' if len(text) > max_length
                                    else '')
