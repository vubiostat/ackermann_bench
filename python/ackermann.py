#!/usr/bin/env python3

from fastapi import FastAPI


@staticmethod
def ackermann(m: int, n: int) -> int:
    if m == 0:
        return n+1
    elif n == 0:
        return ackermann(m-1, 1)
    else:
        return ackermann(m-1, ackermann(m, n-1))

app = FastAPI()

@app.get("/")
async def root(m: int=0, n: int=0):
    return {"message": str(ackermann(m, n))}


