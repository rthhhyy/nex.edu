from fastapi import APIRouter
from pydantic import BaseModel
from datetime import datetime

router = APIRouter(tags=['timer'])

class TimerSession(BaseModel):
    user_id: str
    duration: int
    subject: str
    timestamp: datetime
