from django.urls import path
from .views import AdminDashboardView, CreateAdminView, DeleteAdminView

urlpatterns = [
    path('dashboard/', AdminDashboardView.as_view(), name='dashboard'),
    path('create-admin/', CreateAdminView.as_view(), name='create_admin'),
    path('delete-user/<int:user_id>/', DeleteAdminView.as_view(), name='delete_user'),
]