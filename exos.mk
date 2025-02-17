2.2.2.2.1 :

SeulinD@FMS-STG-820 MINGW64 ~/workspace Python/mysite (main)
$ python manage.py shell
Python 3.13.1 (tags/v3.13.1:0671451, Dec  3 2024, 19:06:28) [MSC v.1942 64 bit (AMD64)]
Type 'copyright', 'credits' or 'license' for more information
IPython 8.31.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: from polls.models import Choice, Question

In [2]: Question.objects.all()
Out[2]: <QuerySet [<Question: YO what's up?>, <Question: aimez vous jouer ?>, <Question: como va la famillia ?>, <Question: aimez vous python ?>, <Question: fumez vous ?>, <Question: j'ai pas d'idees de questions et toi ?>]>

In [3]: for q in question.objects.all(): print(q)
---------------------------------------------------------------------------
NameError                                 Traceback (most recent call last)
Cell In[3], line 1
----> 1 for q in question.objects.all(): print(q)

NameError: name 'question' is not defined

In [4]: for q in question.objects.all(): print(q)

KeyboardInterrupt escaped interact()


In [4]: for q in question.objects.all(): print(q)
---------------------------------------------------------------------------
NameError                                 Traceback (most recent call last)
Cell In[4], line 1
----> 1 for q in question.objects.all(): print(q)

NameError: name 'question' is not defined

In [5]: for q in Question.objects.all(): print(q)
YO what's up?
aimez vous jouer ?
como va la famillia ?
aimez vous python ?
fumez vous ?
j'ai pas d'idees de questions et toi ?

In [6]:
2.2.2.2.2 :
In [6]: questions = Question.objects.filter( pub_date__year=2025 , pub_date__day=15)

KeyboardInterrupt escaped interact()


In [6]: print(questions)
---------------------------------------------------------------------------
NameError                                 Traceback (most recent call last)
Cell In[6], line 1
----> 1 print(questions)

NameError: name 'questions' is not defined

In [7]: questions = Question.objects.filter( pub_date__year=2025 , pub_date__day=15,)

KeyboardInterrupt escaped interact()


In [7]: questions = Question.objects.filter( pub_date__year=2025)

In [8]: print(questions
   ...: )
<QuerySet [<Question: YO what's up?>, <Question: aimez vous jouer ?>, <Question: como va la famillia ?>, <Question: aimez vous python ?>, <Question: fumez vous ?>, <Question: j'ai pas d'idees de questions et toi ?>]>

In [9]: questions = Question.objects.filter( pub_date__day=15)

In [10]: print(questions)
<QuerySet [<Question: como va la famillia ?>]>

In [11]: In [6]: questions = Question.objects.filter( pub_date__year=2025 , pub_date__day=15)

KeyboardInterrupt escaped interact()

In [12]:
In [12]:

  Cell In[12], line 1
    KeyboardInterrupt escaped interact()
                      ^
SyntaxError: invalid syntax


In [13]:
In [13]: In [6]: print(questions)

In [13]: ---------------------------------------------------------------------------
<QuerySet [<Question: como va la famillia ?>]>
2.2.2.2.3 :
SeulinD@FMS-STG-820 MINGW64 ~/workspace Python/mysite (main)
$ python manage.py shell
Python 3.13.1 (tags/v3.13.1:0671451, Dec  3 2024, 19:06:28) [MSC v.1942 64 bit (AMD64)]
Type 'copyright', 'credits' or 'license' for more information
IPython 8.31.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: from polls.models import Choice, Question

In [2]: question = Question.objects.get(id=2)

In [3]: choices = Choice.objects.filter(question=question)

In [4]: for choice in choices:
    print(f"ID du choix: {choice.id}, Texte: {choice.choice_text}, Votes: {choice.votes}")   ...:
   ...: ;
ID du choix: 4, Texte: oui, Votes: 0
ID du choix: 5, Texte: beaucoup, Votes: 0
ID du choix: 6, Texte: pas du tout, Votes: 1
Out[4]: ''
2.2.2.2.4 :
In [5]: questions = Question.object.all()

KeyboardInterrupt escaped interact()


In [5]: questions = Question.objects.all()

In [6]: for Q in questions :
   ...: choices = Choice.objects.filter(question=question)
  Cell In[6], line 2
    choices = Choice.objects.filter(question=question)
    ^
IndentationError: expected an indented block after 'for' statement on line 1

In [3]: for Q in questions:
   ...: choices = Choice.objects.filter(question=question)
  Cell In[3], line 2
    choices = Choice.objects.filter(question=question)
    ^
IndentationError: expected an indented block after 'for' statement on line 1


In [4]: for Q in questions:
   ...:         choices = Choice.objects.filter(question=question)
   ...:         for C in choices:
   ...:                 print(f"Choix ID: {choice.id}, Texte: {choice.choice_text}, Votes: {choice.votes}")
   ...: ;
---------------------------------------------------------------------------
NameError                                 Traceback (most recent call last)
Cell In[4], line 2
      1 for Q in questions:
----> 2         choices = Choice.objects.filter(question=question)
      3         for C in choices:
      4                 print(f"Choix ID: {choice.id}, Texte: {choice.choice_text}, Votes: {choice.votes}")

NameError: name 'question' is not defined

In [5]:



In [7]: for Q inquestions:
   ...: choices = Choice.objects.filter(question=question)
  Cell In[7], line 1
    for Q inquestions:
          ^
SyntaxError: invalid syntax


In [8]: for Q in questions:
   ...: choices = Choice.objects.filter(question=question)
  Cell In[8], line 2
    choices = Choice.objects.filter(question=question)
    ^
IndentationError: expected an indented block after 'for' statement on line 1


Cell In[7], line 2
      1 for Q in questions:
----> 2         choices = Choice.objects.filter(question=questions)
      3         for C in choices:
      4                 print(f"Choix ID: {C.id}, Texte: {C.choice_text}, Votes: {C.votes}");

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\manager.py:87, in BaseManager._get_queryset_methods.<locals>.create_method.<locals>.manager_method(self, *args, **kwargs)
     85 @wraps(method)
     86 def manager_method(self, *args, **kwargs):
---> 87     return getattr(self.get_queryset(), name)(*args, **kwargs)

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\query.py:1436, in QuerySet.filter(self, *args, **kwargs)
   1431 """
   1432 Return a new QuerySet instance with the args ANDed to the existing
   1433 set.
   1434 """
   1435 self._not_support_combined_queries("filter")
-> 1436 return self._filter_or_exclude(False, args, kwargs)

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\query.py:1454, in QuerySet._filter_or_exclude(self, negate, args, kwargs)
   1452     clone._deferred_filter = negate, args, kwargs
   1453 else:
-> 1454     clone._filter_or_exclude_inplace(negate, args, kwargs)
   1455 return clone

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\query.py:1461, in QuerySet._filter_or_exclude_inplace(self, negate, args, kwargs)
   1459     self._query.add_q(~Q(*args, **kwargs))
   1460 else:
-> 1461     self._query.add_q(Q(*args, **kwargs))

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\sql\query.py:1546, in Query.add_q(self, q_object)
   1537 # For join promotion this case is doing an AND for the added q_object
   1538 # and existing conditions. So, any existing inner join forces the join
   1539 # type to remain inner. Existing outer joins can however be demoted.
   1540 # (Consider case where rel_a is LOUTER and rel_a__col=1 is added - if
   1541 # rel_a doesn't produce any rows, then the whole condition must fail.
   1542 # So, demotion is OK.
   1543 existing_inner = {
   1544     a for a in self.alias_map if self.alias_map[a].join_type == INNER
   1545 }
-> 1546 clause, _ = self._add_q(q_object, self.used_aliases)
   1547 if clause:
   1548     self.where.add(clause, AND)

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\sql\query.py:1577, in Query._add_q(self, q_object, used_aliases, branch_negated, current_negated, allow_joins, split_subq, check_filterable, summarize)
   1573 joinpromoter = JoinPromoter(
   1574     q_object.connector, len(q_object.children), current_negated
   1575 )
   1576 for child in q_object.children:
-> 1577     child_clause, needed_inner = self.build_filter(
   1578         child,
   1579         can_reuse=used_aliases,
   1580         branch_negated=branch_negated,
   1581         current_negated=current_negated,
   1582         allow_joins=allow_joins,
   1583         split_subq=split_subq,
   1584         check_filterable=check_filterable,
   1585         summarize=summarize,
   1586     )
   1587     joinpromoter.add_votes(needed_inner)
   1588     if child_clause:

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\sql\query.py:1492, in Query.build_filter(self, filter_expr, branch_negated, current_negated, can_reuse, allow_joins, split_subq, reuse_with_filtered_relation, check_filterable, summarize)
   1489 else:
   1490     col = self._get_col(targets[0], join_info.final_field, alias)
-> 1492 condition = self.build_lookup(lookups, col, value)
   1493 lookup_type = condition.lookup_name
   1494 clause = WhereNode([condition], connector=AND)

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\sql\query.py:1319, in Query.build_lookup(self, lookups, lhs, rhs)
   1316     if not lookup_class:
   1317         return
-> 1319 lookup = lookup_class(lhs, rhs)
   1320 # Interpret '__exact=None' as the sql 'is NULL'; otherwise, reject all
   1321 # uses of None as a query value unless the lookup supports it.
   1322 if lookup.rhs is None and not lookup.can_use_none_as_rhs:

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\lookups.py:27, in Lookup.__init__(self, lhs, rhs)
     25 def __init__(self, lhs, rhs):
     26     self.lhs, self.rhs = lhs, rhs
---> 27     self.rhs = self.get_prep_lookup()
     28     self.lhs = self.get_prep_lhs()
     29     if hasattr(self.lhs, "get_bilateral_transforms"):

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\fields\related_lookups.py:168, in RelatedLookupMixin.get_prep_lookup(self)
    165         target_field = self.lhs.output_field.path_infos[-1].target_fields[-1]
    166         self.rhs = target_field.get_prep_value(self.rhs)
--> 168 return super().get_prep_lookup()

File ~\AppData\Local\Programs\Python\Python313\Lib\site-packages\django\db\models\lookups.py:337, in Exact.get_prep_lookup(self)
    335             self.rhs.add_fields(["pk"])
    336     else:
--> 337         raise ValueError(
    338             "The QuerySet value for an exact lookup must be limited to "
    339             "one result using slicing."
    340         )
    341 return super().get_prep_lookup()

ValueError: The QuerySet value for an exact lookup must be limited to one result using slicing.
2.2.2.2.4 OK :
In [6]: questions = Question.objects.all()

In [7]: for Q in questions:
   ...:         choices = choices = Choice.objects.filter(question=questions)
   ...:         ;
   ...: *
  Cell In[7], line 4
    *
     ^
SyntaxError: invalid syntax


In [8]: for Q in questions:
   ...:         choices = choices = Choice.objects.filter(question=Q)
   ...:         for C in choices :
   ...:                 print(f" Choix ID: {C.id}, Texte: {C.choice_text}, Votes: {C.votes}")
   ...:
 Choix ID: 1, Texte: Not much, Votes: 1
 Choix ID: 2, Texte: The sky, Votes: 0
 Choix ID: 4, Texte: oui, Votes: 0
 Choix ID: 5, Texte: beaucoup, Votes: 0
 Choix ID: 6, Texte: pas du tout, Votes: 1
 Choix ID: 7, Texte: bien, Votes: 0
 Choix ID: 8, Texte: pas bien, Votes: 0
 Choix ID: 9, Texte: bof bof, Votes: 0
 Choix ID: 10, Texte: non, Votes: 0
 Choix ID: 11, Texte: beurk, Votes: 0
 Choix ID: 12, Texte: moui, Votes: 0
 Choix ID: 13, Texte: oui, Votes: 0
 Choix ID: 14, Texte: non, Votes: 0
 Choix ID: 15, Texte: parfois, Votes: 0
 Choix ID: 16, Texte: non plus, Votes: 0
 Choix ID: 17, Texte: peux pas t'aider dsl, Votes: 0
 Choix ID: 18, Texte: attend je cherche, Votes: 1
2.2.2.2.9 :
In [9]: from django.utils import timezone

In [10]: q = Question(question_text="Question test shell ?", pub_date=timezone.now())

In [11]: q.save()

In [12]: q.id
Out[12]: 7
2.2.2.2.10 :
In [18]: qq.choice_set.create(choice_text="ca soule", votes=0)
Out[18]: <Choice: ca soule>

In [19]: qq.choice_set.create(choice_text="trop", votes=0)
Out[19]: <Choice: trop>

In [20]: qq.choice_set.create(choice_text="d'ecrir dans la console", votes=0)
Out[20]: <Choice: d'ecrir dans la console>

In [21]:
2.2.2.2.11 :
In [21]: Q = Question.objects.all()

In [22]: for QQ in Q:
    ...:        QQ.was_published_recently()
    ...:

In [23]: for q in Q:*
  Cell In[23], line 1
    for q in Q:*
                ^
SyntaxError: invalid syntax


In [24]: for q in Q:
    ...:        print(q.was_published_recently())
    ...:
True
False
False
True
False
False
True

In [25]:


