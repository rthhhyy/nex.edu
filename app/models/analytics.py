from pydantic import BaseModel
from datetime import datetime

class AnalyticsData(BaseModel):
    user_id: str
    metric_name: str
    value: float
    timestamp: datetime
