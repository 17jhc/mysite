from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.contenttypes.models import ContentType
from .models import Comment
from .forms import CommentForm
from django.urls import reverse
from django.utils import timezone
# Create your views here.


def upload_comment(request):
    comment_form = CommentForm(request.POST, user=request.user)
    referer = request.META.get('HTTP_REFERER', reverse('index'))
    data = {}
    if comment_form.is_valid():
        comment = Comment(user=comment_form.cleaned_data['user'], text=comment_form.cleaned_data['text'],
                          content_object=comment_form.cleaned_data['content_object'])
        parent = comment_form.cleaned_data['parent']
        if parent is not None:
            comment.root = parent.root if parent.root is not None else parent
            comment.parent = parent
            comment.reply_to = parent.user
        comment.save()
        # 返回数据
        data['status'] = 'SUCCESS'
        data['username'] = comment.user.get_nickname_or_username()
        data['comment_time'] = timezone.localtime(comment.comment_time).strftime('%Y-%m-%d %H:%M:%S')
        data['text'] = comment.text
        data['content_type'] = ContentType.objects.get_for_model(comment).model
        if parent is not None:
            data['reply_to'] = comment.reply_to.get_nickname_or_username()
        else:
            data['reply_to'] = ''
        data['pk'] = comment.pk
        data['root_pk'] = comment.root.pk if comment.root is not None else ''
    else:
        data['status'] = 'ERROR'
        data['message'] = list(comment_form.errors.values())[0][0]
        # return render(request, 'error.html', {'message': comment_form.errors, 'redirect_to': referer})
    return JsonResponse(data)