from django.shortcuts import render
from django.core.cache import cache
from read_account.utils import *
from django.contrib.contenttypes.models import ContentType
from blog.models import Blog


def get_seven_days_hot_blogs():
    today = timezone.now().date()
    day = today - datetime.timedelta(days=7)
    blogs = Blog.objects.filter(read_details__date__gte=day).values('id', 'title')\
        .annotate(read_num_sum=Sum('read_details__read_num')).order_by('-read_num_sum')
    return blogs[:7]


def index(request):
    blog_content_type = ContentType.objects.get_for_model(Blog)
    read_nums, dates = get_seven_days_read_data(blog_content_type)
    today_hot_data = get_today_hot_data(blog_content_type)
    yesterday_hot_data = get_yesterday_hot_data(blog_content_type)
    # 缓存
    week_hot_data = cache.get('hot_blogs_for_seven_days')
    if week_hot_data is None:
        week_hot_data = get_seven_days_hot_blogs()
        cache.set('hot_blogs_for_seven_days', week_hot_data, 3600)
    return render(request, 'index.html',
                  context={
                      'read_nums': read_nums,
                      'dates': dates,
                      'today_hot_data': today_hot_data,
                      'yesterday_hot_data': yesterday_hot_data,
                      'week_hot_data': week_hot_data,
                  })


