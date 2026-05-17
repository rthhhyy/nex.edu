from fastapi import APIRouter

router = APIRouter(tags=['social'])

@router.get('/social/followers/{user_id}')
async def get_followers(user_id: str):
    pass
