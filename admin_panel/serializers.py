from rest_framework import serializers
from django.contrib.auth import get_user_model

User = get_user_model()

class CreateAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "full_name", "email", "password", "role"]
        extra_kwargs = {
            "password": {"write_only": True},
            "role": {"required": False}
        }

    def create(self, validated_data):
        role = validated_data.pop('role', 'admin')
        user = User.objects.create_user(
            email=validated_data["email"],
            full_name=validated_data["full_name"],
            password=validated_data["password"],
        )
        user.role = role
        user.is_role_selected = True
        user.save()
        return user