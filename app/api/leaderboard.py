from fastapi import APIRouter
from typing import List

router = APIRouter(tags=['leaderboard'])

@router.get('/leaderboard/global')
async def get_global_leaderboard(limit: int = 100):
    pass
