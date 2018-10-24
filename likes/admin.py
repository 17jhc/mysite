from django.contrib import admin
from .models import LikeRecord, LikeCount
# Register your models here.


@admin.register(LikeCount)
class LikeCountAdmin(admin.ModelAdmin):
    list_display = ('id', 'content_type', 'like_num')


@admin.register(LikeRecord)
class LikeRecordAdmin(admin.ModelAdmin):
    list_display = ('id', 'content_type', 'user', 'liked_time')