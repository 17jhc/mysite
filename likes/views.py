from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.contenttypes.models import ContentType
from django.db.models import ObjectDoesNotExist
from .models import LikeCount, LikeRecord
# Create your views here.


def error_response(code, message):
    return JsonResponse({'status': 'ERROR', 'code': code, 'message': message})


def success_response(like_num):
    return JsonResponse({'status': 'SUCCESS', 'like_num': like_num})


def like_change(request):
    user = request.user
    if not user.is_authenticated:
        return error_response(400, 'you are not login')
    content_type = request.GET.get('content_type')
    object_id = int(request.GET.get('object_id'))
    try:
        content_type = ContentType.objects.get(model=content_type)
        model_class = content_type.model_class()
        model_obj = model_class.objects.get(pk=object_id)
    except ObjectDoesNotExist:
        return error_response(401, 'object not exist')
    if request.GET.get('is_like') == 'true':
        # 点赞
        like_record, created = LikeRecord.objects\
            .get_or_create(content_type=content_type, object_id=object_id, user=user)
        if created:
            # 未点赞过
            like_count, created = LikeCount.objects\
                .get_or_create(content_type=content_type, object_id=object_id)
            like_count.like_num += 1
            like_count.save()
            return success_response(like_count.like_num)
        else:
            # 已经点赞过，同一个用户不可重复
            return error_response(402, 'had clicked')
    else:
        # 取消点赞
        if LikeRecord.objects.filter(content_type=content_type, object_id=object_id, user=user).exists():
            # 有点赞过则取消
            like_record = LikeRecord.objects\
                .get(content_type=content_type, object_id=object_id, user=user)
            like_record.delete()
            # 点赞总数减一
            like_count, created = LikeCount.objects \
                .get_or_create(content_type=content_type, object_id=object_id)
            if not created:
                like_count.like_num -= 1
                like_count.save()
                return success_response(like_count.like_num)
            else:
                return error_response(404, 'data error')
        else:
            # 未点赞过，或已经取消了
            return error_response(403, 'you did not clicked')



