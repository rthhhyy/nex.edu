from fastapi import APIRouter
from pydantic import BaseModel
from typing import List

router = APIRouter(tags=['notifications'])

class NotificationPayload(BaseModel):
    user_id: str
    title: str
    message: str
    notification_type: str
