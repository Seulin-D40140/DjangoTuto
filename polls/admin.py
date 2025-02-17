from django.contrib import admin
from .models import Choice , Question

class QuestionAdmin(admin.ModelAdmin):
    list_display = ('id', 'question_text', 'pub_date', 'was_published_recently')
    list_filter = ('pub_date', 'id')
    ordering = ('-pub_date', '-id')
    search_fields = ('question_text',)

admin.site.register(Question, QuestionAdmin)

class ChoiceAdmin(admin.ModelAdmin):
    list_display = ('id', 'choice_text', 'votes', 'question_id')
    list_filter = ('votes', 'id')
    ordering = ('-votes', '-id')
    search_fields = ('choice_text',)

admin.site.register(Choice , ChoiceAdmin)