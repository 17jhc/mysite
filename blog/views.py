from django.shortcuts import get_object_or_404, render
from .models import Blog, BlogType
from django.core.paginator import Paginator
from django.conf import settings
from django.db.models import Count
from read_account.utils import read_account_once_read
from user.forms import LoginForm
# Create your views here.


def get_blog_list(blogs, request):
    page_num = request.GET.get('page', 1)
    paginator = Paginator(blogs, settings.PAGE_NUMBER)  # 5页分页
    page_of_blogs = paginator.get_page(page_num)
    current_page_num = page_of_blogs.number
    page_range = list(range(max(current_page_num - 2, 1), current_page_num)) + list(
        range(current_page_num, min(current_page_num + 3, paginator.num_pages + 1)))
    # 插入省略号
    if page_range[0] >= 3:
        page_range.insert(0, '...')
    if page_range[-1] <= paginator.num_pages - 2:
        page_range.append('...')
    # 插入首页
    if page_range[0] != 1:
        page_range.insert(0, 1)
    # 插入尾页
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)
    # 获取博客分类的对应数目
    blog_type_list = BlogType.objects.annotate(blog_count=Count('blog'))
    # 获取日期归档对应的博客数量
    blog_dates = Blog.objects.dates('created_time', 'month', order='DESC')
    blog_dates_dict = {}
    for blog_date in blog_dates:
        blog_dates_dict[blog_date] = Blog.objects.filter(created_time__month=blog_date.month,
                                                         created_time__year=blog_date.year).count()
    context = {
        'page_of_blogs': page_of_blogs,
        'page_range': page_range,
        'blog_dates': blog_dates_dict,
        'blog_types': blog_type_list,
    }
    return context


def blog_list(request):
    blogs = Blog.objects.all()
    return render(request, 'blog/blog_list.html', context=get_blog_list(blogs, request))


def blogs_with_type(request, blog_type_pk):
    blog_type = get_object_or_404(BlogType, pk=blog_type_pk)
    blogs = Blog.objects.filter(blog_type=blog_type)
    context = get_blog_list(blogs, request)
    context['type'] = blog_type
    return render(request, 'blog/blogs_with_type.html', context)


def blogs_with_date(request, year, month):
    blogs = Blog.objects.filter(created_time__year=year, created_time__month=month)
    context = get_blog_list(blogs, request)
    context['date'] = '%s年%s月' % (year, month)
    return render(request, 'blog/blogs_with_date.html', context)


def blog_detail(request, blog_pk):
    blog = get_object_or_404(Blog, pk=blog_pk)
    read_cookie_key = read_account_once_read(request, blog)
    response = render(request, 'blog/blog_detail.html', context={
                          'blog': blog,
                          'previous_blog': Blog.objects.filter(created_time__gt=blog.created_time).last(),
                          'next_blog': Blog.objects.filter(created_time__lt=blog.created_time).first(),
                          'login_form': LoginForm(),
                      })
    response.set_cookie(read_cookie_key, 'true')
    return response