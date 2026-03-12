from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = 'django-insecure-c9p@@t!curr%(h9+^de7ud6(##g6m196+#q0fr4rae*acjbkiw'

DEBUG = True

ALLOWED_HOSTS = []


# ===============================
# INSTALLED APPS
# ===============================
INSTALLED_APPS = [
    # Django default contrib apps
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # Third‑party
    'rest_framework',
    'rest_framework.authtoken',

    # Local apps
    'user',
    'admin_panel',
]


# ===============================
# MIDDLEWARE
# ===============================
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]


ROOT_URLCONF = 'researcher.urls'


# ===============================
# TEMPLATES  ✅ UPDATED
# ===============================
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],   # IMPORTANT LINE ADDED
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]


WSGI_APPLICATION = 'researcher.wsgi.application'


# ===============================
# DATABASE (MySQL - XAMPP)
# Use SQLite by default in development when `USE_SQLITE` env var is not set to '0'
# ===============================
import os

# Use SQLite for development by default, MySQL for production
USE_SQLITE = os.getenv('USE_SQLITE', '1') == '1'

if USE_SQLITE:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': BASE_DIR / 'db.sqlite3',
        }
    }
else:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'nano_db',
            'USER': 'root',
            'PASSWORD': 'roos',
            'HOST': '127.0.0.1',
            'PORT': '3306',
        }
    }
# ===============================
# PASSWORD VALIDATION
# ===============================
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
]


# ===============================
# INTERNATIONALIZATION
# ===============================
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'Asia/Kolkata'
USE_I18N = True
USE_TZ = True


# ===============================
# STATIC FILES
# ===============================
STATIC_URL = 'static/'

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


# ===============================
# CUSTOM USER MODEL
# ===============================
# Use the custom user defined in the `user` app.
AUTH_USER_MODEL = 'user.CustomUser'

# ===============================
# REST FRAMEWORK SETTINGS
# ===============================
REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ),
}
# ===============================
# EMAIL CONFIGURATION (CHOOSE ONE)
# ===============================

# ✅ FOR TESTING (Recommended for now)
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'dhulipallabala@gmail.com'
EMAIL_HOST_PASSWORD = 'zdunljyndlothynm'


from datetime import timedelta

SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(minutes=30),
    'REFRESH_TOKEN_LIFETIME': timedelta(days=1),
    'AUTH_HEADER_TYPES': ('Bearer',),
}

# ✅ FOR REAL EMAIL (Use later)
# EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# EMAIL_HOST = 'smtp.gmail.com'
# EMAIL_PORT = 587
# EMAIL_USE_TLS = True
# EMAIL_HOST_USER = 'yourgmail@gmail.com'
# EMAIL_HOST_PASSWORD = 'your_app_password'