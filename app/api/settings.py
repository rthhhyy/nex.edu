from fastapi import APIRouter
from pydantic import BaseModel

router = APIRouter(tags=['settings'])

class UserSettings(BaseModel):
    user_id: str
    theme: str
    notifications_enabled: bool
    language: str
