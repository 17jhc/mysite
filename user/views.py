import string
import random
import time
from django.shortcuts import render, redirect
from django.urls import reverse
from .forms import *
from django.http import JsonResponse
from django.core.mail import send_mail
from .models import Profile


def login(request):
    '''username = request.POST.get('username', '')
    password = request.POST.get('password', '')
    user = auth.authenticate(request, username=username, password=password)
    referer = request.META.get('HTTP_REFERER', reverse('index'))
    if user is not None:
        auth.login(request, user)
        # redirect to a success page
        return redirect(referer)
    else:
        return render(request, 'error.html', {'message': '用户名或者密码不正确', 'redirect_to': referer})
    '''
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user = login_form.cleaned_data['user']
            auth.login(request, user)
            return redirect(request.GET.get('from', reverse('index')))
    else:
        login_form = LoginForm()
    return render(request, 'user/login.html', {'login_form': login_form})


def login_for_modal(request):
    login_form = LoginForm(request.POST)
    data = {}
    if login_form.is_valid():
        user = login_form.cleaned_data['user']
        auth.login(request, user)
        data['status'] = 'SUCCESS'
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)


def register(request):
    if request.method == 'POST':
        register_form = RegisterForm(request.POST, request=request)
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            password = register_form.cleaned_data['password']
            email = register_form.cleaned_data['email']
            # 注册
            user = User.objects.create_user(username, email, password)
            user.save()
            # 清除session
            del request.session['register_code']
            # 登陆
            user = auth.authenticate(username=username, password=password)
            auth.login(request, user)
            return redirect(request.POST.get('from', reverse('index')))
    else:
        register_form = RegisterForm()
    return render(request, 'user/register.html', {'register_form': register_form})


def logout(request):
    auth.logout(request)
    return redirect(request.GET.get('from', reverse('index')))


def user_info(request):
    return render(request, 'user/user_info.html', context={})


def change_nickname(request):
    redirect_to = request.GET.get('from', reverse('index'))
    if request.method == 'POST':
        form = ChangeNicknameForm(request.POST, user=request.user)
        if form.is_valid():
            nickname_new = form.cleaned_data['nickname_new']
            profile, created = Profile.objects.get_or_create(user=request.user)
            profile.nickname = nickname_new
            profile.save()
            return redirect(redirect_to)
    else:
        form = ChangeNicknameForm()
    return render(request, 'form.html',
                  context={'form': form,
                           'form_title': '修改昵称',
                           'page_title': '修改昵称',
                           'submit_text': '修改',
                           'return_back_url': redirect_to,
                           })


def bind_email(request):
    redirect_to = request.POST.get('from', reverse('index'))
    if request.method == 'POST':
        form = BindEmailForm(request.POST, request=request)
        if form.is_valid():
            email = form.cleaned_data['email']
            request.user.email = email
            request.user.save()
            # 清除session
            del request.session['bind_email_code']
            return redirect(redirect_to)
    else:
        form = BindEmailForm()
    return render(request, 'user/bind_email.html',
                  context={'form': form,
                           'form_title': '绑定邮箱',
                           'page_title': '绑定邮箱',
                           'submit_text': '绑定',
                           'return_back_url': redirect_to,
                           })


def send_verification_code(request):
    email = request.GET.get('email', '')
    send_for = request.GET.get('send_for', '')
    data = {}
    if email != '':
        # 生成验证码
        code = ''.join(random.sample(string.ascii_letters + string.digits, 4))
        now = int(time.time())
        send_code_time = request.session.get('send_code_time', 0)
        if now - send_code_time < 30:
            data['status'] = 'ERROR'
        else:
            request.session[send_for] = code
            request.session['send_code_time'] = now
            # 发送邮件
            send_mail(
                '绑定邮箱',  # 主题
                '验证码: %s' % code,
                '391207849@qq.com',
                [email],  # 邮箱
                fail_silently=False
            )
            data['status'] = 'SUCCESS'
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)


def change_password(request):
    redirect_to = reverse('index')
    if request.method == 'POST':
        form = ChangePasswordForm(request.POST, user=request.user)
        if form.is_valid():
            user = request.user
            new_password = form.cleaned_data['new_password']
            user.set_password(new_password)
            user.save()
            auth.logout(request)
            return redirect(redirect_to)
    else:
        form = ChangePasswordForm()
    return render(request, 'form.html',
                  context={'form': form,
                           'form_title': '修改密码',
                           'page_title': '修改密码',
                           'submit_text': '修改',
                           'return_back_url': redirect_to,
                           })


def forget_password(request):
    redirect_to = reverse('index')
    if request.method == 'POST':
        form = ForgetPasswordForm(request.POST, request=request)
        if form.is_valid():
            email = form.cleaned_data['email']
            new_password = form.cleaned_data['new_password']
            user = User.objects.get(email=email)
            user.set_password(new_password)
            user.save()
            del request.session['forget_password_code']
            return redirect(redirect_to)
    else:
        form = ForgetPasswordForm()
    return render(request, 'user/forget_password.html',
                  context={'form': form,
                           'form_title': '重置密码',
                           'page_title': '重置密码',
                           'submit_text': '重置',
                           'return_back_url': redirect_to,
                           })


