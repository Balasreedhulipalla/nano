from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.utils import timezone
import random


# ============================
# Custom User Manager
# ============================

class CustomUserManager(BaseUserManager):

    def create_user(self, email, full_name, password=None):
        if not email:
            raise ValueError("Email is required")

        email = self.normalize_email(email)

        user = self.model(
            email=email,
            full_name=full_name,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, full_name, password):
        user = self.create_user(
            email=email,
            full_name=full_name,
            password=password
        )
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


# ============================
# Custom User Model
# ============================

class CustomUser(AbstractBaseUser, PermissionsMixin):

    ROLE_CHOICES = (
        ('super_admin', 'Super Admin'),
        ('admin', 'Admin'),
        ('user', 'User'),
    )

    full_name = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    otp = models.CharField(max_length=6, blank=True, null=True)
    otp_created_at = models.DateTimeField(blank=True, null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)
    is_role_selected = models.BooleanField(default=False)
    role = models.CharField(
        max_length=20,
        choices=ROLE_CHOICES,
        default='user'
    )

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['full_name']

    def __str__(self):
        return self.email

    # =========================
    # OTP GENERATION
    # =========================
    def generate_otp(self):
        self.otp = str(random.randint(100000, 999999))
        self.save()

    # =========================
    # SAVE METHOD
    # =========================
    def save(self, *args, **kwargs):

        if self.is_superuser:
            self.role = 'super_admin'

        super().save(*args, **kwargs)

class Notification(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    message = models.TextField()
    is_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.message
    
from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()


class Dataset(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


class Submission(models.Model):

    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('screening', 'Screening'),
        ('review', 'Review'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected')
    ]

    dataset = models.ForeignKey(Dataset, on_delete=models.CASCADE, related_name='submissions')
    submitted_by = models.ForeignKey(User, on_delete=models.CASCADE)
    file = models.FileField(upload_to='submissions/')
    notes = models.TextField(blank=True)

    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')

    screened_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name='screened_submissions')
    reviewed_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name='reviewed_submissions')
    approved_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name='approved_submissions')

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.dataset.title} - {self.status}"