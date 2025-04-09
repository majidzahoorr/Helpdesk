from django.contrib import admin
from .models import  Ticket, Category, BlogCategory, Blog
# Register your models here.

class TicketAdmin(admin.ModelAdmin):
    list_display = ['subject', 'priority', 'created_at']

class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'code', 'parent']



class BlogAdmin(admin.ModelAdmin):
    list_display = ['subject', 'priority', 'created_at']

class BlogCategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'code', 'parent']


admin.site.register(Category, CategoryAdmin)
admin.site.register(BlogCategory, BlogCategoryAdmin)
admin.site.register(Ticket, TicketAdmin)
admin.site.register(Blog, BlogAdmin)