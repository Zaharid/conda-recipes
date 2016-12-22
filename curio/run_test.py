import curio
import numpy as np

def large_matrix():
    return np.zeros((2000,200,200))

async def main():
    coro = curio.run_in_process(large_matrix)
    task = await curio.spawn(coro)
    res = await task.join()
    print(res)
curio.run(main())
