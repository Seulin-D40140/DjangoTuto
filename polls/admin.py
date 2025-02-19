from django.contrib import admin
from .models import Choice , Question


class ChoiceInline(admin.TabularInline):  # Utilisation de TabularInline pour un affichage compact
    model = Choice
    extra = 3  # Nombre de choix affichés par défaut

class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {"fields": ["question_text"]}),
        ("Date Information", {"fields": ["pub_date"], "classes": ["collapse"]}),
    ]
    inlines = [ChoiceInline]
    list_display = ("question_text", "pub_date", "was_published_recently")  # Colonnes affichées
    list_filter = ["pub_date"]  # Filtres latéraux
    search_fields = ["question_text"]  # Barre de recherche
    ordering = ["-pub_date"]  # Tri par défaut (du plus récent au plus ancien)

admin.site.register(Question, QuestionAdmin)

# class ChoiceAdmin(admin.ModelAdmin):
#     list_display = ('id', 'choice_text', 'votes', 'question_id')
#     list_filter = ('votes', 'id')
#     ordering = ('-votes', '-id')
#     search_fields = ('choice_text',)

admin.site.register(Choice)