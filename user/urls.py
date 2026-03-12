from django.urls import path
from .views import (
    RegisterView,
    CustomLoginView,
    ForgotPasswordView,
    OTPResetView,
    SelectRoleView,
    EditProfileView,
    ProfileView,
    NotificationView,
    CreateDatasetView,
    CreateSubmissionView,
    SubmissionListView,
    ScreeningSubmissionsView,
    ReviewSubmissionView,
    PendingApprovalsView,
    ApproveSubmissionView,
    new_submission,
)

urlpatterns = [
    path('register/', RegisterView.as_view()),
    path('forgot-password/', ForgotPasswordView.as_view()),
    path('reset-password/', OTPResetView.as_view()),
    path('select-role/', SelectRoleView.as_view()),
    path('edit/', EditProfileView.as_view()),
    path('profile/', ProfileView.as_view()),
    path('notifications/', NotificationView.as_view(), name='notifications'),

    # Dataset
    path('datasets/create/', CreateDatasetView.as_view()),

    # Submission
    path('submissions/create/', CreateSubmissionView.as_view()),
    path('submissions/', SubmissionListView.as_view()),
    path('new-submission/', new_submission, name='new_submission'),

    # Screening
    path('submissions/<int:pk>/screen/', ScreeningSubmissionsView.as_view()),

    # Review
    path('submissions/<int:pk>/review/', ReviewSubmissionView.as_view()),

    # Pending approvals
    path('submissions/pending-approvals/', PendingApprovalsView.as_view()),

    # Approve
    path('submissions/<int:pk>/approve/', ApproveSubmissionView.as_view()),
]