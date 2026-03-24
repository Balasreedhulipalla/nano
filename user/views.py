from django.contrib.auth import authenticate, get_user_model
from django.core.mail import send_mail
from django.conf import settings
from django.utils import timezone
from datetime import timedelta
import random

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, permissions
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes
from rest_framework import generics

from .models import CustomUser, Notification, Dataset, Submission
from .serializers import (
    RegisterSerializer,
    EditProfileSerializer,
    ProfileSerializer,
    CustomTokenObtainPairSerializer,
    NotificationSerializer,
    DatasetSerializer,
    SubmissionSerializer,
)


# =========================
# REGISTER VIEW
# =========================
class RegisterView(APIView):

    def post(self, request):
        serializer = RegisterSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(
                {"message": "User registered successfully"},
                status=status.HTTP_201_CREATED
            )

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# =========================
# LOGIN VIEW
# =========================
from rest_framework_simplejwt.views import TokenObtainPairView


# keep the old token-based login for reference or local auth
class LoginView(APIView):

    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')

        user = authenticate(username=email, password=password)

        if user is not None:
            token, created = Token.objects.get_or_create(user=user)

            return Response({
                "message": "Login successful",
                "token": token.key,
                "email": user.email,
                "full_name": user.full_name
            }, status=status.HTTP_200_OK)

        return Response(
            {"error": "Invalid email or password"},
            status=status.HTTP_401_UNAUTHORIZED
        )


class CustomLoginView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer


# =========================
# FORGOT PASSWORD
# =========================
class ForgotPasswordView(APIView):

    def post(self, request):
        email = request.data.get("email")

        User = get_user_model()

        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({"error": "User not found"}, status=400)

        otp = str(random.randint(100000, 999999))
        user.otp = otp
        user.otp_created_at = timezone.now()
        user.save()

        send_mail(
            subject="Nano Meta Tool Password Reset OTP",
            message=f"Your OTP is: {otp}",
            from_email=settings.EMAIL_HOST_USER,
            recipient_list=[email],
            fail_silently=False,
        )

        return Response({"message": "OTP sent to email"})

# =========================
# OTP RESET PASSWORD
# =========================
class OTPResetView(APIView):

    def post(self, request):
        email = request.data.get("email")
        otp = request.data.get("otp")
        new_password = request.data.get("new_password")

        User = get_user_model()

        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({"error": "User not found"}, status=400)

        # Check OTP
        if user.otp != otp:
            return Response({"error": "Invalid OTP"}, status=400)

        # Check OTP expiry (10 minutes)
        if user.otp_created_at and timezone.now() > user.otp_created_at + timedelta(minutes=10):
            return Response({"error": "OTP expired"}, status=400)

        # Set new password
        user.set_password(new_password)
        user.otp = None
        user.otp_created_at = None
        user.save()

        return Response({"message": "Password reset successful"})


# =========================
# SELECT ROLE
# =========================
class SelectRoleView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request):
        user = request.user

        user.role = request.data.get("role")
        user.save()

        return Response({"message": "Role updated successfully"})


# =========================
# EDIT PROFILE
# =========================
class EditProfileView(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request):
        serializer = EditProfileSerializer(
            request.user,
            data=request.data,
            partial=True,
            context={'request': request}
        )

        if serializer.is_valid():
            serializer.save()
            return Response({
                "message": "Profile updated successfully",
                "data": serializer.data
            }, status=status.HTTP_200_OK)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# =========================
# GET PROFILE
# =========================
class ProfileView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        serializer = ProfileSerializer(request.user)
        return Response(serializer.data)



class NotificationView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        notifications = Notification.objects.filter(user=request.user)
        serializer = NotificationSerializer(notifications, many=True)
        return Response(serializer.data)


# -----------------------------
# New Dataset Screen
# -----------------------------

class CreateDatasetView(generics.CreateAPIView):
    queryset = Dataset.objects.all()
    serializer_class = DatasetSerializer
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


# -----------------------------
# Submission Screen
# -----------------------------

class CreateSubmissionView(generics.CreateAPIView):
    queryset = Submission.objects.all()
    serializer_class = SubmissionSerializer


# -----------------------------
# Pending Approvals Screen
# -----------------------------

class PendingApprovalsView(generics.ListAPIView):
    serializer_class = SubmissionSerializer

    def get_queryset(self):
        return Submission.objects.filter(status='review')


# -----------------------------
# Approve Submission Screen
# -----------------------------

class ApproveSubmissionView(APIView):

    def post(self, request, pk):

        try:
            submission = Submission.objects.get(pk=pk)
            submission.status = 'approved'
            submission.approved_by = request.user
            submission.save()

            return Response({"message": "Submission Approved"})

        except Submission.DoesNotExist:
            return Response({"error": "Submission not found"}, status=404)


# -----------------------------
# Review Submission Screen
# -----------------------------

class ReviewSubmissionView(APIView):

    def post(self, request, pk):

        try:
            submission = Submission.objects.get(pk=pk)

            action = request.data.get("action")

            if action == "approve_review":
                submission.status = 'review'
                submission.reviewed_by = request.user

            elif action == "reject":
                submission.status = 'rejected'

            submission.save()

            return Response({"message": "Review completed"})

        except Submission.DoesNotExist:
            return Response({"error": "Submission not found"}, status=404)


# -----------------------------
# Screening Submissions Screen
# -----------------------------

class ScreeningSubmissionsView(APIView):

    def post(self, request, pk):

        try:
            submission = Submission.objects.get(pk=pk)

            action = request.data.get("action")

            if action == "pass":
                submission.status = "review"
                submission.screened_by = request.user

            elif action == "reject":
                submission.status = "rejected"

            submission.save()

            return Response({"message": "Screening complete"})

        except Submission.DoesNotExist:
            return Response({"error": "Submission not found"}, status=404)


# -----------------------------
# List Submissions (for screens)
# -----------------------------

class SubmissionListView(generics.ListAPIView):
    serializer_class = SubmissionSerializer

    def get_queryset(self):
        return Submission.objects.all()


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def new_submission(request):
    title = request.data.get("title")
    description = request.data.get("description")
    dataset_url = request.data.get("dataset_url")

    submission = {
        "title": title,
        "description": description,
        "dataset_url": dataset_url,
        "status": "pending"
    }

    return Response({
        "message": "Submission created successfully",
        "data": submission
    }, status=status.HTTP_201_CREATED)