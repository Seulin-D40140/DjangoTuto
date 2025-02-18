import datetime
from django.db.models import Sum

from django.db import models
from django.utils import timezone


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date published")
    MAX_LENGTH = 20

    def __str__(self):
        return self.question_text

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

    def age(self):
        return timezone.now() - self.pub_date

    def text_excerpt(text, max_length):
        return text[:max_length] + ('...' if len(text) > max_length
                                    else '')

    def get_choices(self):
        resultat = self.choice_set.aggregate(total=Sum('votes'))
        total = resultat['total']
        return [(c.choice_text, c.votes, c.votes / total)
                for c in self.choice_set.all()]

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