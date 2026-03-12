from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from rest_framework_simplejwt.views import TokenRefreshView
from user.views import CustomLoginView

urlpatterns = [
    # Django Admin
    path('admin/', admin.site.urls),

    # JWT Login
    path('api/login/', CustomLoginView.as_view(), name='token_obtain_pair'),

    # JWT Refresh
    path('api/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    # User APIs
    path('api/user/', include('user.urls')),

    # Admin APIs
    path('api/admin/', include('admin_panel.urls')),

    # Password Reset
    path('password_reset/', auth_views.PasswordResetView.as_view(), name='password_reset'),
    path('password_reset_done/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset_done/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
]