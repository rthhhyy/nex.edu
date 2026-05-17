from pydantic import BaseModel

class Achievement(BaseModel):
    achievement_id: str
    name: str
    description: str
    icon_url: str
