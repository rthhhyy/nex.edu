from fastapi import APIRouter
from typing import List

router = APIRouter(tags=['achievements'])

@router.get('/achievements/{user_id}')
async def get_user_achievements(user_id: str):
    pass
